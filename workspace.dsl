workspace "Event Management and Ticketing System" "C4 model for the Event Management and Ticketing System" {

    model {

        // =========================================================
        // PEOPLE
        // =========================================================

        eventOrganiser = person "Event Organiser" {
            description "Creates and manages events, ticketing, pricing, promotions, sales, and analytics."
        }

        ticketBuyer = person "Ticket Buyer / Attendee" {
            description "Browses events, purchases tickets securely, and accesses purchased digital tickets."
        }

        eventStaff = person "Event Staff" {
            description "Uses the mobile application to scan tickets, validate entry, and manage attendee admission."
        }

        administrator = person "Administrator" {
            description "Monitors core system services and investigates suspicious ticket or payment activity."
        }


        // =========================================================
        // EXTERNAL SYSTEMS
        // =========================================================

        paymentProvider = softwareSystem "Payment Provider" {
            description "Processes ticket payments securely and returns payment status and transaction confirmation."
        }

        socialMediaService = softwareSystem "Social Media Service" {
            description "Supports event promotion through external social media platforms."
        }


        // =========================================================
        // EVENT MANAGEMENT AND TICKETING SYSTEM
        // =========================================================

        ems = softwareSystem "Event Management and Ticketing System" {
            description "Supports event creation, promotion, ticketing, payment, analytics, ticket scanning, and attendee management."


            // =====================================================
            // LEVEL 2 - WEB APPLICATION
            // =====================================================

            webApplication = container "Web Application" {
                description "Provides the user interface for event page creation, multimedia content management, event browsing, ticket purchasing, promotions, analytics, and administration."
                technology "Web Application"


                // -------------------------------------------------
                // LEVEL 3 - WEB APPLICATION COMPONENTS
                // -------------------------------------------------

                eventBrowsingUI = component "Event Browsing UI" {
                    description "Allows ticket buyers to browse available events and view event and ticket information."
                    technology "Web UI Component"
                }

                ticketPurchaseUI = component "Ticket Purchase UI" {
                    description "Allows ticket buyers to select tickets, initiate purchases, and access purchased digital tickets."
                    technology "Web UI Component"
                }

                eventManagementUI = component "Event Management UI" {
                    description "Allows event organisers to create and update events, ticket types, pricing, and event configuration."
                    technology "Web UI Component"
                }

                eventPageContentUI = component "Event Page Content UI" {
                    description "Allows event organisers to manage customisable event page content and multimedia elements."
                    technology "Web UI Component"
                }

                promotionManagementUI = component "Pricing & Promotion UI" {
                    description "Allows event organisers to manage ticket pricing, pricing tiers, promotional rules, discounts, and promotional content."
                    technology "Web UI Component"
                }

                analyticsDashboard = component "Analytics Dashboard" {
                    description "Displays event sales, ticketing, and attendee analytics to event organisers."
                    technology "Web UI Component"
                }

                administrationUI = component "Administration UI" {
                    description "Allows administrators to monitor system operations and investigate suspicious ticket or payment activity."
                    technology "Web UI Component"
                }

                webApiClient = component "Backend API Client" {
                    description "Encapsulates communication between web user-interface components and the Backend API."
                    technology "REST/HTTPS Client"
                }

            }


            // =====================================================
            // LEVEL 2 - MOBILE APPLICATION
            // =====================================================

            mobileApplication = container "Mobile Application" {
                description "Supports ticket scanning and attendee admission management during events."
                technology "Mobile Application"


                // -------------------------------------------------
                // LEVEL 3 - MOBILE APPLICATION COMPONENTS
                // -------------------------------------------------

                ticketScannerUI = component "Ticket Scanner UI" {
                    description "Allows event staff to scan a digital ticket and capture its ticket identifier."
                    technology "Mobile UI Component"
                }

                ticketValidationUI = component "Ticket Validation UI" {
                    description "Submits scanned ticket information for validation and displays whether the ticket is valid, invalid, or already used."
                    technology "Mobile UI Component"
                }

                admissionManagementUI = component "Admission Management UI" {
                    description "Allows event staff to manage attendee admission after ticket validation."
                    technology "Mobile UI Component"
                }

                mobileApiClient = component "Backend API Client" {
                    description "Encapsulates communication between mobile application components and the Backend API."
                    technology "REST/HTTPS Client"
                }
            }


            // =====================================================
            // LEVEL 2 - BACKEND API
            // =====================================================

            backendApi = container "Backend API" {
                description "Executes business logic for event management, ticket purchasing, pricing and promotions, capacity management, payments, ticket validation, and analytics."
                technology "Application / API"


                // -------------------------------------------------
                // LEVEL 3 - BACKEND API COMPONENTS
                // -------------------------------------------------

                eventManagementComponent = component "Event Management Component" {
                    description "Manages event creation, customisable event pages, multimedia content, updates, ticket types, and event configuration."
                    technology "Application Component"
                }

                pricingPromotionComponent = component "Pricing & Promotion Component" {
                    description "Manages dynamic ticket pricing, pricing tiers, promotional rules, discounts, and event promotional content."
                    technology "Application Component"
                }

                ticketManagementComponent = component "Ticket Management Component" {
                    description "Handles ticket purchase requests, ticket issuance, and retrieval of purchased tickets."
                    technology "Application Component"
                }

                capacityReservationComponent = component "Capacity & Reservation Component" {
                    description "Checks real-time ticket availability, reserves capacity during purchases, and prevents overselling during concurrent ticket sales."
                    technology "Application Component"
                }

                paymentProcessingComponent = component "Payment Processing Component" {
                    description "Coordinates secure ticket payments with the external payment provider, processes payment results, and supports fraud prevention checks."
                    technology "Application Component"
                }

                ticketValidationComponent = component "Ticket Validation Component" {
                    description "Validates scanned tickets, detects invalid or previously used tickets, and records attendee admission."
                    technology "Application Component"
                }

                analyticsComponent = component "Analytics Component" {
                    description "Provides sales, ticketing, and attendee analytics for event organisers."
                    technology "Application Component"
                }

                administrationComponent = component "Administration Component" {
                    description "Supports operational monitoring and investigation of suspicious ticket or payment activity."
                    technology "Application Component"
                }

                    // -------------------------------------------------
                    // LEVEL 4 - BACKEND API CODE ELEMENTS
                    // -------------------------------------------------

                    ticketManagementService = component "TicketManagementService" {
                        description "Methods: purchaseTicket(), issueTicket(), handlePaymentResult()."
                        technology "Service"
                    }

                    pricingPromotionService = component "PricingPromotionService" {
                        description "Methods: calculatePrice(), applyPromotion(), publishPromotion()."
                        technology "Service"
                    }

                    capacityReservationService = component "CapacityReservationService" {
                        description "Methods: checkAvailability(), reserveCapacity(), confirmReservation(), releaseReservation()."
                        technology "Service"
                    }

                    paymentProcessingService = component "PaymentProcessingService" {
                        description "Methods: processPayment(), getPaymentStatus()."
                        technology "Service"
                    }

                    ticketValidationServiceCode = component "TicketValidationService" {
                        description "Methods: validateTicket(), markAdmitted()."
                        technology "Service"
                    }

                    eventManagementService = component "EventManagementService" {
                        description "Methods: createEvent(), updateEvent(), manageEventContent()."
                        technology "Service"
                    }

                    analyticsService = component "AnalyticsService" {
                        description "Methods: generateSalesReport(), generateAttendeeReport()."
                        technology "Service"
                    }

                    administrationService = component "AdministrationService" {
                        description "Methods: monitorOperations(), reviewSuspiciousActivity()."
                        technology "Service"
                    }

                    emsRepository = component "EMSRepository" {
                        description "Methods: saveEvent(), findTicket(), saveReservation(), updateCapacity(), savePayment(), updateTicketStatus()."
                        technology "Interface"
                    }

                    paymentProviderGateway = component "PaymentProviderGateway" {
                        description "Methods: requestPayment(), getPaymentStatus()."
                        technology "Interface"
                    }

                    socialMediaGateway = component "SocialMediaGateway" {
                        description "Methods: publishEventPromotion()."
                        technology "Interface"
                    }

                    ticketEntity = component "Ticket" {
                        description "Ticket entity with ticketId, ticketCode, and status."
                        technology "Entity"
                    }

                    eventEntity = component "Event" {
                        description "Event entity with eventId, name, and capacity."
                        technology "Entity"
                    }

                    attendeeEntity = component "Attendee" {
                        description "Attendee entity with attendeeId."
                        technology "Entity"
                    }

                    paymentTransactionEntity = component "PaymentTransaction" {
                        description "Payment transaction entity with transactionId and status."
                        technology "Entity"
                    }

                    reservationEntity = component "Reservation" {
                        description "Reservation entity with reservationId, status, and expiryTime."
                        technology "Entity"
                    }

            }


            // =====================================================
            // LEVEL 2 - DATABASE
            // =====================================================

            emsDatabase = container "EMS Database" {
                description "Stores persistent system data and maintains consistent ticket, capacity, and transaction states."
                technology "Relational Database"
            }
        }


        // =========================================================
        // LEVEL 1 RELATIONSHIPS
        // =========================================================

        eventOrganiser -> ems "Creates and manages events, event pages, multimedia content, ticketing, pricing, promotions, sales, and analytics"

        ticketBuyer -> ems "Browses events, purchases tickets, and accesses digital tickets"

        eventStaff -> ems "Scans and validates tickets and manages attendee admission"

        administrator -> ems "Monitors system operations and investigates suspicious activity"

        ems -> paymentProvider "Processes ticket payments using"

        ems -> socialMediaService "Publishes event promotional content using"


        // =========================================================
        // LEVEL 2 RELATIONSHIPS
        // =========================================================

        eventOrganiser -> webApplication "Manages events, event pages, multimedia content, ticketing, pricing, promotions, and analytics using" "HTTPS"

        ticketBuyer -> webApplication "Browses events and purchases and accesses tickets using" "HTTPS"

        administrator -> webApplication "Monitors system operations and suspicious activity using" "HTTPS"

        eventStaff -> mobileApplication "Scans tickets and manages attendee admission using" "HTTPS"

        webApplication -> backendApi "Makes API requests to" "REST/HTTPS"

        mobileApplication -> backendApi "Makes ticket validation and admission requests to" "REST/HTTPS"

        backendApi -> emsDatabase "Reads and writes event, ticket, capacity, payment, and attendee data" "Transactional database access"

        backendApi -> paymentProvider "Sends payment requests and receives payment status from" "External API/HTTPS"

        backendApi -> socialMediaService "Sends event and promotional content to" "External API/HTTPS"


        // =========================================================
        // LEVEL 3 RELATIONSHIPS - WEB APPLICATION
        // =========================================================

        ticketBuyer -> eventBrowsingUI "Browses events using"

        ticketBuyer -> ticketPurchaseUI "Purchases and accesses tickets using"

        eventOrganiser -> eventManagementUI "Creates and manages events using"

        eventOrganiser -> eventPageContentUI "Manages event page content and multimedia elements using"

        eventOrganiser -> promotionManagementUI "Manages pricing and promotions using"

        eventOrganiser -> analyticsDashboard "Views event analytics using"
        
        administrator -> administrationUI "Monitors system operations using"

        eventBrowsingUI -> webApiClient "Requests event and ticket information through"

        ticketPurchaseUI -> webApiClient "Submits ticket purchase and retrieval requests through"

        eventManagementUI -> webApiClient "Submits event management requests through"

        eventPageContentUI -> webApiClient "Submits event page content and multimedia management requests through"

        promotionManagementUI -> webApiClient "Submits pricing and promotion requests through"

        analyticsDashboard -> webApiClient "Requests analytics data through"
        
        administrationUI -> webApiClient "Requests monitoring and investigation data through"

        webApiClient -> backendApi "Makes API requests to" "REST/HTTPS"


        // =========================================================
        // LEVEL 3 RELATIONSHIPS - MOBILE APPLICATION
        // =========================================================

        eventStaff -> ticketScannerUI "Scans attendee tickets using"

        eventStaff -> admissionManagementUI "Manages attendee admission using"

        ticketScannerUI -> ticketValidationUI "Provides scanned ticket identifier to"

        ticketValidationUI -> mobileApiClient "Submits ticket validation requests through"

        admissionManagementUI -> mobileApiClient "Submits attendee admission requests through"

        mobileApiClient -> backendApi "Makes ticket validation and admission requests to" "REST/HTTPS"


        // =========================================================
        // LEVEL 3 RELATIONSHIPS - BACKEND API
        // =========================================================

        eventManagementComponent -> emsDatabase "Reads and writes event, event page, multimedia content, and configuration data" "Transactional database access"

        pricingPromotionComponent -> emsDatabase "Reads and writes pricing, discount, and promotion data" "Transactional database access"

        pricingPromotionComponent -> socialMediaService "Publishes event promotional content to" "External API/HTTPS"

        ticketManagementComponent -> pricingPromotionComponent "Obtains current ticket pricing and applicable promotions from"

        ticketManagementComponent -> capacityReservationComponent "Checks and reserves ticket capacity"

        ticketManagementComponent -> paymentProcessingComponent "Requests payment processing"

        ticketManagementComponent -> emsDatabase "Reads and writes ticket and purchase data" "Transactional database access"

        capacityReservationComponent -> emsDatabase "Checks and updates ticket capacity and reservation state" "Transactional database access"

        paymentProcessingComponent -> paymentProvider "Sends secure payment requests and receives payment status" "External API/HTTPS"

        paymentProcessingComponent -> capacityReservationComponent "Confirms or releases reserved capacity based on payment result"

        paymentProcessingComponent -> emsDatabase "Records payment transaction status" "Transactional database access"

        ticketValidationComponent -> emsDatabase "Validates ticket status and records attendee admission" "Transactional database access"

        analyticsComponent -> emsDatabase "Reads sales, ticketing, and attendee data" "Database access"

        administrationComponent -> emsDatabase "Reads operational, ticket, and payment data for monitoring" "Database access"

        // =========================================================
        // LEVEL 4 RELATIONSHIPS - BACKEND API CODE DIAGRAM
        // =========================================================

        ticketManagementService -> pricingPromotionService "Obtains current price and promotion details from"

        ticketManagementService -> capacityReservationService "Reserves capacity and confirms or releases reservations after payment result"

        ticketManagementService -> paymentProcessingService "Requests payment processing from"

        ticketManagementService -> emsRepository "Saves ticket and purchase data through"

        pricingPromotionService -> emsRepository "Reads and writes pricing and promotion data through"

        pricingPromotionService -> socialMediaGateway "Publishes promotional content through"

        capacityReservationService -> emsRepository "Saves reservation state and updates capacity through"

        paymentProcessingService -> paymentProviderGateway "Sends payment requests and retrieves payment status through"

        paymentProcessingService -> emsRepository "Records payment transaction status through"

        ticketValidationServiceCode -> emsRepository "Reads ticket status and updates admitted ticket status through"

        eventManagementService -> emsRepository "Reads and writes event and event content data through"

        analyticsService -> emsRepository "Reads sales, ticketing, and attendee data through"

        administrationService -> emsRepository "Reads operational, ticket, and payment data through"

        emsRepository -> ticketEntity "Persists"

        emsRepository -> eventEntity "Persists"

        emsRepository -> attendeeEntity "Persists"

        emsRepository -> paymentTransactionEntity "Persists"

        emsRepository -> reservationEntity "Persists"

    }


    views {

        // =========================================================
        // DIAGRAM 1 - C4 LEVEL 1
        // SYSTEM CONTEXT
        // =========================================================

        systemContext ems "SystemContext" {

            include eventOrganiser
            include ticketBuyer
            include eventStaff
            include administrator

            include ems

            include paymentProvider
            include socialMediaService

            autoLayout lr
        }


        // =========================================================
        // DIAGRAM 2 - C4 LEVEL 2
        // CONTAINER DIAGRAM
        // =========================================================

        container ems "Container" {

            include eventOrganiser
            include ticketBuyer
            include eventStaff
            include administrator

            include webApplication
            include mobileApplication
            include backendApi
            include emsDatabase

            include paymentProvider
            include socialMediaService

            autoLayout lr
        }


        // =========================================================
        // DIAGRAM 3 - C4 LEVEL 3
        // WEB APPLICATION COMPONENTS
        // =========================================================

        component webApplication "WebApplicationComponents" {

            include ticketBuyer
            include eventOrganiser
            include administrator

            include eventBrowsingUI
            include ticketPurchaseUI
            include eventManagementUI
            include eventPageContentUI
            include promotionManagementUI
            include analyticsDashboard
            include administrationUI
            include webApiClient

            include backendApi

            autoLayout lr
        }


        // =========================================================
        // DIAGRAM 4 - C4 LEVEL 3
        // MOBILE APPLICATION COMPONENTS
        // =========================================================

        component mobileApplication "MobileApplicationComponents" {

            include eventStaff

            include ticketScannerUI
            include ticketValidationUI
            include admissionManagementUI
            include mobileApiClient

            include backendApi

            autoLayout lr
        }


        // =========================================================
        // DIAGRAM 5 - C4 LEVEL 3
        // BACKEND API COMPONENTS
        // =========================================================

        component backendApi "BackendAPIComponents" {

            include eventManagementComponent
            include pricingPromotionComponent
            include ticketManagementComponent
            include capacityReservationComponent
            include paymentProcessingComponent
            include ticketValidationComponent
            include analyticsComponent
            include administrationComponent

            include emsDatabase
            include paymentProvider
            include socialMediaService

        }

        
        // =========================================================
        // DIAGRAM 6 - C4 LEVEL 4
        // BACKEND API CODE DIAGRAM
        // =========================================================

        component backendApi "BackendCodeDiagram" {

            include ticketManagementService
            include pricingPromotionService
            include capacityReservationService
            include paymentProcessingService
            include ticketValidationServiceCode
            include eventManagementService
            include analyticsService
            include administrationService

            include emsRepository
            include paymentProviderGateway
            include socialMediaGateway

            include ticketEntity
            include eventEntity
            include attendeeEntity
            include paymentTransactionEntity
            include reservationEntity

            autoLayout tb
        }

        // =========================================================
        // THEME
        // =========================================================

        theme default
    }
}