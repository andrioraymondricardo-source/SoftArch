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


                // =================================================
                // LEVEL 3 - BACKEND API COMPONENTS
                // =================================================

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
                    description "Coordinates secure ticket payments with the external payment provider and handles successful and failed payment results."
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


                // =================================================
                // LEVEL 4
                // TICKET PURCHASE & PAYMENT CODE ELEMENTS
                //
                // Focus:
                // - Ticket purchase
                // - Capacity reservation
                // - Concurrent oversell prevention
                // - Payment processing
                // - Payment success/failure recovery
                // =================================================

                group "Services" {

                    ticketManagementService = component "Ticket Management Service" {
                        description "Methods: purchaseTicket(), issueTicket(), handlePaymentResult()."
                        technology "Service"
                    }

                    pricingPromotionService = component "Pricing Promotion Service" {
                        description "Methods: calculatePrice(), applyPromotion()."
                        technology "Service"
                    }

                    capacityReservationService = component "Capacity Reservation Service" {
                        description "Methods: checkAvailability(), reserveCapacity(), confirmReservation(), releaseReservation()."
                        technology "Service"
                    }

                    paymentProcessingService = component "Payment Processing Service" {
                        description "Methods: processPayment(), getPaymentStatus()."
                        technology "Service"
                    }
                }


                // -------------------------------------------------
                // INTERFACES & PERSISTENCE
                // -------------------------------------------------

                group "Interfaces & Persistence" {

                    ticketRepository = component "Ticket Repository" {
                        description "Methods: findTicket(), saveTicket(), saveReservation(), updateCapacity(), savePayment()."
                        technology "Interface"
                    }

                    paymentProviderGateway = component "Payment Provider Gateway" {
                        description "Methods: requestPayment(), getPaymentStatus()."
                        technology "Interface"
                    }
                }


                // -------------------------------------------------
                // DOMAIN ENTITIES
                // -------------------------------------------------

                group "Domain Entities" {

                    ticketEntity = component "Ticket" {
                        description "Ticket entity with ticketId, ticketCode, and status."
                        technology "Entity"
                    }

                    reservationEntity = component "Reservation" {
                        description "Reservation entity with reservationId, status, and expiryTime."
                        technology "Entity"
                    }

                    paymentTransactionEntity = component "Payment Transaction" {
                        description "Payment transaction entity with transactionId and status."
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

        capacityReservationComponent -> emsDatabase "Atomically checks and updates ticket capacity and reservation state" "Transactional database access"

        paymentProcessingComponent -> paymentProvider "Sends secure payment requests and receives payment status" "External API/HTTPS"

        paymentProcessingComponent -> capacityReservationComponent "Confirms reservation on payment success or releases reservation on payment failure"

        paymentProcessingComponent -> emsDatabase "Records payment transaction status" "Transactional database access"

        ticketValidationComponent -> emsDatabase "Validates ticket status and records attendee admission" "Transactional database access"

        analyticsComponent -> emsDatabase "Reads sales, ticketing, and attendee data" "Database access"

        administrationComponent -> emsDatabase "Reads operational, ticket, and payment data for monitoring" "Database access"


        // =========================================================
        // LEVEL 4 RELATIONSHIPS
        // TICKET PURCHASE & PAYMENT CODE DIAGRAM
        // =========================================================

        // ---------------------------------------------------------
        // PURCHASE COORDINATION
        // ---------------------------------------------------------

        ticketManagementService -> pricingPromotionService "Gets price and promotion"

        ticketManagementService -> capacityReservationService "Reserves capacity"

        ticketManagementService -> paymentProcessingService "Requests payment"

        capacityReservationService -> ticketRepository "Updates reservation and capacity"

        paymentProcessingService -> paymentProviderGateway "Processes payment"

        paymentProcessingService -> ticketRepository "Records payment status"

        paymentProcessingService -> capacityReservationService "Success: confirm; failure: release"

        ticketManagementService -> ticketRepository "Issues ticket after successful payment"

        ticketRepository -> ticketEntity "Persists"

        ticketRepository -> reservationEntity "Persists"

        ticketRepository -> paymentTransactionEntity "Persists"

        ticketRepository -> eventEntity "Reads event data"

        ticketRepository -> attendeeEntity "Reads attendee data"
    }


    // =============================================================
    // VIEWS
    // =============================================================

    views {

        // =========================================================
        // DIAGRAM 1
        // L1 - SYSTEM CONTEXT
        // =========================================================

        systemContext ems "01-SystemContext" {
            title "1. L1 - System Context"

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
        // DIAGRAM 2
        // L2 - CONTAINER
        // =========================================================

        container ems "02-Container" {
            title "2. L2 - Container"

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
        // DIAGRAM 3
        // L3 - WEB APPLICATION COMPONENT
        // =========================================================

        component webApplication "03-WebApplicationComponent" {
            title "3. L3 - Web Application Component"

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
        // DIAGRAM 4
        // L3 - MOBILE APPLICATION COMPONENT
        // =========================================================

        component mobileApplication "04-MobileApplicationComponent" {
            title "4. L3 - Mobile Application Component"

            include eventStaff

            include ticketScannerUI
            include ticketValidationUI
            include admissionManagementUI
            include mobileApiClient

            include backendApi

            autoLayout lr
        }


        // =========================================================
        // DIAGRAM 5
        // L3 - BACKEND API COMPONENT
        // =========================================================

        component backendApi "05-BackendAPIComponent" {
            title "5. L3 - Backend API Component"

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

            autoLayout tb
        }

        // =========================================================
        // DIAGRAM 6
        // L4 - TICKET PURCHASE & PAYMENT CODE DIAGRAM
        // =========================================================

        component backendApi "06-TicketPurchasePaymentCodeDiagram" {

            title "6. L4 - Ticket Purchase & Payment Code Diagram"

            // Services
            include ticketManagementService
            include pricingPromotionService
            include capacityReservationService
            include paymentProcessingService

            // Interfaces & Persistence
            include ticketRepository
            include paymentProviderGateway

            // Domain Entities
            include ticketEntity
            include reservationEntity
            include paymentTransactionEntity
            include eventEntity
            include attendeeEntity

        }



        // =========================================================
        // THEME
        // =========================================================

        theme default
    }
}