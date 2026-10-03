workspace "Event Management and Ticketing System" "C4 and data architecture model for the Event Management and Ticketing System" {

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
            // WEB APPLICATION
            // =====================================================

            webApplication = container "Web Application" {
                description "Provides the user interface for event page creation, multimedia content management, event browsing, ticket purchasing, promotions, analytics, and administration."
                technology "Web Application"

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
            // MOBILE APPLICATION
            // =====================================================

            mobileApplication = container "Mobile Application" {
                description "Supports ticket scanning and attendee admission management during events."
                technology "Mobile Application"

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
            // BACKEND API
            // =====================================================

            backendApi = container "Backend API" {
                description "Executes business logic for event management, ticket purchasing, pricing and promotions, capacity management, payments, ticket validation, and analytics."
                technology "Application / API"

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
                    description "Provides post-event sales, ticketing, and attendee analytics using analytical data."
                    technology "Application Component"
                }

                administrationComponent = component "Administration Component" {
                    description "Supports operational monitoring and investigation of suspicious ticket or payment activity."
                    technology "Application Component"
                }


                // =================================================
                // LEVEL 4 - SERVICES
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


                // =================================================
                // LEVEL 4 - INTERFACES & PERSISTENCE
                // =================================================

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


                // =================================================
                // LEVEL 4 - DOMAIN ENTITIES
                // =================================================

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
            // OPERATIONAL DATA STORE - DAD-01
            // =====================================================

            emsDatabase = container "EMS Database" {
                description "Stores operational event, ticket, reservation, purchase, payment, promotion, and admission data with transactional consistency."
                technology "Relational Database"
                tags "Database"
            }


            // =====================================================
            // BATCH ANALYTICS INGESTION - DAD-02
            // =====================================================

            analyticsETL = container "Analytics ETL / Batch Processor" {
                description "Periodically extracts operational EMS data, transforms it for analytics, and loads it into the Analytics Data Warehouse."
                technology "Batch / ETL"
                tags "ETL"
            }


            // =====================================================
            // ANALYTICS STORAGE - DAD-03
            // =====================================================

            analyticsWarehouse = container "Analytics Data Warehouse" {
                description "Stores structured historical sales, ticketing, payment, and attendance data for post-event analytical workloads."
                technology "Analytics Data Warehouse"
                tags "DataWarehouse"
            }
        }


        // =========================================================
        // CONCEPTUAL DATA MODEL
        // =========================================================

        cdmEvent = element "Event" "Conceptual Entity" {
            description "Represents an event managed by the EMS."
            tags "ConceptualEntity"
        }

        cdmTicketType = element "Ticket Type" "Conceptual Entity" {
            description "Represents a category or type of ticket available for an event."
            tags "ConceptualEntity"
        }

        cdmPromotion = element "Promotion" "Conceptual Entity" {
            description "Represents pricing discounts or promotional information associated with an event."
            tags "ConceptualEntity"
        }

        cdmTicket = element "Ticket" "Conceptual Entity" {
            description "Represents a digital ticket issued after a successful purchase."
            tags "ConceptualEntity"
        }

        cdmReservation = element "Reservation" "Conceptual Entity" {
            description "Represents temporary ticket capacity reserved during the purchase process."
            tags "ConceptualEntity"
        }

        cdmPurchase = element "Purchase" "Conceptual Entity" {
            description "Represents a ticket purchase made by an attendee."
            tags "ConceptualEntity"
        }

        cdmPaymentTransaction = element "Payment Transaction" "Conceptual Entity" {
            description "Represents a payment transaction associated with a purchase."
            tags "ConceptualEntity"
        }

        cdmAttendee = element "Attendee" "Conceptual Entity" {
            description "Represents a ticket buyer or attendee."
            tags "ConceptualEntity"
        }


        // =========================================================
        // CONCEPTUAL RELATIONSHIPS
        // =========================================================

        cdmEvent -> cdmTicketType "1 : 0..*"
        cdmEvent -> cdmPromotion "1 : 0..*"

        cdmTicketType -> cdmTicket "1 : 0..*"
        cdmTicketType -> cdmReservation "1 : 0..*"

        cdmAttendee -> cdmReservation "1 : 0..*"

        cdmReservation -> cdmPurchase "1 : 0..1"
        cdmPurchase -> cdmPaymentTransaction "1 : 0..1"
        cdmPurchase -> cdmTicket "1 : 0..*"


        // =========================================================
        // LOGICAL DATA MODEL
        // =========================================================

        ldmEvent = element "Event [Logical]" {
            description "PK: event_id | event_name | event_content | event_capacity | remaining_capacity"
            tags "LogicalEntity"
        }

        ldmTicketType = element "Ticket Type [Logical]" {
            description "PK: ticket_type_id | FK: event_id | ticket_type | ticket_price"
            tags "LogicalEntity"
        }

        ldmPromotion = element "Promotion [Logical]" {
            description "PK: promotion_id | FK: event_id | promotion_details"
            tags "LogicalEntity"
        }

        ldmAttendee = element "Attendee [Logical]" {
            description "PK: attendee_id"
            tags "LogicalEntity"
        }

        ldmReservation = element "Reservation [Logical]" {
            description "PK: reservation_id | FK: ticket_type_id | FK: attendee_id | reservation_status | reservation_expiry"
            tags "LogicalEntity"
        }

        ldmPurchase = element "Purchase [Logical]" {
            description "PK: purchase_id | FK: reservation_id | FK: attendee_id"
            tags "LogicalEntity"
        }

        ldmPayment = element "Payment Transaction [Logical]" {
            description "PK: payment_transaction_id | FK: purchase_id | payment_status"
            tags "LogicalEntity"
        }

        ldmTicket = element "Ticket [Logical]" {
            description "PK: ticket_id | FK: ticket_type_id | FK: purchase_id | FK: attendee_id | ticket_code | ticket_status | validation_status | admission_timestamp"
            tags "LogicalEntity"
        }


        // =========================================================
        // LOGICAL RELATIONSHIPS
        // =========================================================

        ldmEvent -> ldmTicketType "1 : 0..*"
        ldmEvent -> ldmPromotion "1 : 0..*"

        ldmTicketType -> ldmReservation "1 : 0..*"
        ldmTicketType -> ldmTicket "1 : 0..*"

        ldmAttendee -> ldmReservation "1 : 0..*"
        ldmAttendee -> ldmPurchase "1 : 0..*"
        ldmAttendee -> ldmTicket "1 : 0..*"

        ldmReservation -> ldmPurchase "1 : 0..1"
        ldmPurchase -> ldmPayment "1 : 0..1"
        ldmPurchase -> ldmTicket "1 : 0..*"


        // =========================================================
        // PHYSICAL DATA MODEL
        // =========================================================

        // =========================================================
        // PHYSICAL DATA MODEL
        // =========================================================

        pdmEvents = element "events [Physical]" {
            description "event_id INTEGER (PK)\nevent_name VARCHAR(150)\nevent_content VARCHAR(255)\nevent_capacity INTEGER\nremaining_capacity INTEGER"
            tags "PhysicalTable"
        }

        pdmTicketTypes = element "ticket_types [Physical]" {
            description "ticket_type_id INTEGER (PK)\nevent_id INTEGER (FK)\nticket_type VARCHAR(50)\nticket_price DECIMAL(10,2)"
            tags "PhysicalTable"
        }

        pdmPromotions = element "promotions [Physical]" {
            description "promotion_id INTEGER (PK)\nevent_id INTEGER (FK)\npromotion_details VARCHAR(255)"
            tags "PhysicalTable"
        }

        pdmAttendees = element "attendees [Physical]" {
            description "attendee_id INTEGER (PK)"
            tags "PhysicalTable"
        }

        pdmReservations = element "reservations [Physical]" {
            description "reservation_id INTEGER (PK)\nticket_type_id INTEGER (FK)\nattendee_id INTEGER (FK)\nreservation_status VARCHAR(20)\nreservation_expiry TIMESTAMP"
            tags "PhysicalTable"
        }

        pdmPurchases = element "purchases [Physical]" {
            description "purchase_id INTEGER (PK)\nreservation_id INTEGER (FK)\nattendee_id INTEGER (FK)"
            tags "PhysicalTable"
        }

        pdmPayments = element "payment_transactions [Physical]" {
            description "payment_transaction_id VARCHAR(100) (PK)\npurchase_id INTEGER (FK)\npayment_status VARCHAR(20)"
            tags "PhysicalTable"
        }

        pdmTickets = element "tickets [Physical]" {
            description "ticket_id INTEGER (PK)\nticket_type_id INTEGER (FK)\npurchase_id INTEGER (FK)\nattendee_id INTEGER (FK)\nticket_code VARCHAR(100)\nticket_status VARCHAR(20)\nvalidation_status VARCHAR(20)\nadmission_timestamp TIMESTAMP"
            tags "PhysicalTable"
        }


        // =========================================================
        // PHYSICAL RELATIONSHIPS
        // =========================================================

        pdmEvents -> pdmTicketTypes "event_id FK"
        pdmEvents -> pdmPromotions "event_id FK"

        pdmTicketTypes -> pdmReservations "ticket_type_id FK"
        pdmTicketTypes -> pdmTickets "ticket_type_id FK"

        pdmAttendees -> pdmReservations "attendee_id FK"
        pdmAttendees -> pdmPurchases "attendee_id FK"
        pdmAttendees -> pdmTickets "attendee_id FK"

        pdmReservations -> pdmPurchases "reservation_id FK"
        pdmPurchases -> pdmPayments "purchase_id FK"
        pdmPurchases -> pdmTickets "purchase_id FK"


        // =========================================================
        // LEVEL 1 RELATIONSHIPS
        // =========================================================

        eventOrganiser -> ems "Creates and manages events, event pages, multimedia content, ticketing, pricing, promotions, sales, and analytics"

        ticketBuyer -> ems "Browses events, purchases tickets, and accesses digital tickets"

        eventStaff -> ems "Scans and validates tickets and manages attendee admission"

        administrator -> ems "Monitors system operations and investigates suspicious ticket or payment activity"

        ems -> paymentProvider "Processes ticket payments using"

        ems -> socialMediaService "Publishes event promotional content using"

        // =========================================================
        // LEVEL 2 RELATIONSHIPS
        // =========================================================

        eventOrganiser -> webApplication "Manages events, event pages, multimedia content, ticketing, pricing, promotions, and analytics using" "HTTPS"

        ticketBuyer -> webApplication "Browses events, purchases tickets, and accesses digital tickets using" "HTTPS"

        administrator -> webApplication "Monitors system operations and suspicious activity using" "HTTPS"

        eventStaff -> mobileApplication "Scans tickets and manages attendee admission using" "HTTPS"

        webApplication -> backendApi "Makes API requests to" "REST/HTTPS"

        mobileApplication -> backendApi "Makes ticket validation and admission requests to" "REST/HTTPS"

        backendApi -> emsDatabase "Reads and writes operational event, ticket, reservation, purchase, payment, and attendee data" "Transactional database access"

        backendApi -> paymentProvider "Sends payment requests and receives payment status from" "External API/HTTPS"

        backendApi -> socialMediaService "Sends event and promotional content to" "External API/HTTPS"


        // =========================================================
        // DATA ARCHITECTURE RELATIONSHIPS
        // DAD-02 + DAD-03
        // =========================================================

        emsDatabase -> analyticsETL "Provides operational sales, ticketing, payment, and attendance data for periodic extraction" "Batch extraction"

        analyticsETL -> analyticsWarehouse "Transforms and loads historical analytical data into" "Batch / ETL"

        analyticsComponent -> analyticsWarehouse "Reads post-event sales, ticketing, payment, and attendance data from" "Analytical query"


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

        administrationComponent -> emsDatabase "Reads operational, ticket, and payment data for monitoring" "Database access"


        // =========================================================
        // LEVEL 4 RELATIONSHIPS
        // =========================================================

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
        // 1. L1 - SYSTEM CONTEXT
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
        // 2. L2 - CONTAINER
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
        // 3. L3 - WEB APPLICATION COMPONENT
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
        // 4. L3 - MOBILE APPLICATION COMPONENT
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
        // 5. L3 - BACKEND API COMPONENT
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
            include analyticsWarehouse

            include paymentProvider
            include socialMediaService

            autoLayout tb
        }


        // =========================================================
        // 6. L4 - TICKET PURCHASE & PAYMENT CODE
        // =========================================================

        component backendApi "06-TicketPurchasePaymentCodeDiagram" {
            title "6. L4 - Ticket Purchase & Payment Code Diagram"

            include ticketManagementService
            include pricingPromotionService
            include capacityReservationService
            include paymentProcessingService

            include ticketRepository
            include paymentProviderGateway

            include ticketEntity
            include reservationEntity
            include paymentTransactionEntity
            include eventEntity
            include attendeeEntity

            autoLayout tb
        }


        // =========================================================
        // 7. C4 - DATA ARCHITECTURE
        //
        // Uses a custom view so that the operational and analytical
        // data architecture can be shown together explicitly.
        // =========================================================

        container ems "07-DataArchitecture" {

            title "7. C4 - Data Architecture"

            include webApplication
            include mobileApplication
            include backendApi
            include emsDatabase
            include analyticsETL
            include analyticsWarehouse
            include paymentProvider

            autoLayout lr

        }

        // =========================================================
        // 8. CONCEPTUAL DATA MODEL
        // =========================================================

        custom "08-ConceptualDataModel" {
            title "8. Conceptual Data Model"

            include cdmEvent
            include cdmTicketType
            include cdmPromotion
            include cdmAttendee
            include cdmReservation
            include cdmPurchase
            include cdmPaymentTransaction
            include cdmTicket

            autoLayout tb
        }


        // =========================================================
        // 9. LOGICAL DATA MODEL
        // =========================================================

        custom "09-LogicalDataModel" {
            title "9. Logical Data Model"

            include ldmEvent
            include ldmTicketType
            include ldmPromotion
            include ldmAttendee
            include ldmReservation
            include ldmPurchase
            include ldmPayment
            include ldmTicket

            autoLayout tb
        }


        // =========================================================
        // 10. PHYSICAL DATA MODEL
        //
        // No autoLayout.
        // This allows the diagram to be manually arranged in
        // Structurizr to minimise crossing relationship lines.
        // =========================================================

        custom "10-PhysicalDataModel" {
            title "10. Physical Data Model"

            include pdmEvents
            include pdmTicketTypes
            include pdmPromotions
            include pdmAttendees
            include pdmReservations
            include pdmPurchases
            include pdmPayments
            include pdmTickets

            autoLayout lr
        }


        // =========================================================
        // LOCAL STYLES
        //
        // These styles do not require the remote Structurizr
        // default theme to be downloaded.
        // =========================================================

        styles {

            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }

            element "Software System" {
                background #1168bd
                color #ffffff
            }

            element "Container" {
                background #438dd5
                color #ffffff
            }

            element "Component" {
                background #85bbf0
                color #000000
            }

            element "ConceptualEntity" {
                shape RoundedBox
                background #438dd5
                color #ffffff
            }

            element "LogicalEntity" {
                shape RoundedBox
                background #85bbf0
                color #000000
            }

            element "PhysicalTable" {
                shape RoundedBox
                background #dddddd
                color #000000
                width 420
                height 300
                fontSize 20
            }

            relationship "Relationship" {
                color #707070
                thickness 2
            }
        }
    }
}