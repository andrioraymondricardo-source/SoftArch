workspace "Event Management and Ticketing System" "C4 model for the Event Management and Ticketing System" {

    model {

        // =========================================================
        // People
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
        // External Systems
        // =========================================================

        paymentProvider = softwareSystem "Payment Provider" {
            description "Processes ticket payments securely and returns payment status and transaction confirmation."
        }

        socialMediaService = softwareSystem "Social Media Service" {
            description "Supports event promotion through external social media platforms."
        }


        // =========================================================
        // Event Management and Ticketing System
        // =========================================================

        ems = softwareSystem "Event Management and Ticketing System" {
            description "Supports event creation, promotion, ticketing, payment, analytics, ticket scanning, and attendee management."

            // -----------------------------------------------------
            // C4 Level 2 Containers
            // -----------------------------------------------------

            webApplication = container "Web Application" {
                description "Provides the user interface for event management, event browsing, ticket purchasing, and administration."
                technology "Web Application"
            }

            mobileApplication = container "Mobile Application" {
                description "Supports ticket scanning and attendee admission management during events."
                technology "Mobile Application"
            }

            backendApi = container "Backend API" {
                description "Executes business logic for event management, ticket purchasing, pricing and promotions, capacity management, payments, ticket validation, and analytics."
                technology "Application / API"
            }

            emsDatabase = container "EMS Database" {
                description "Stores persistent system data and maintains consistent ticket, capacity, and transaction states."
                technology "Relational Database"
            }
        }


        // =========================================================
        // Relationships - People to EMS
        // =========================================================

        eventOrganiser -> ems "Creates and manages events, ticketing, pricing, promotions, sales, and analytics"

        ticketBuyer -> ems "Browses events, purchases tickets, and accesses digital tickets"

        eventStaff -> ems "Scans and validates tickets and manages attendee admission"

        administrator -> ems "Monitors system operations and investigates suspicious activity"


        // =========================================================
        // Relationships - EMS to External Systems
        // =========================================================

        ems -> paymentProvider "Processes ticket payments using"

        ems -> socialMediaService "Publishes event promotional content using"


        // =========================================================
        // Level 2 Relationships - People to Containers
        // =========================================================

        eventOrganiser -> webApplication "Manages events, ticketing, pricing, promotions, and analytics using" "HTTPS"

        ticketBuyer -> webApplication "Browses events and purchases and accesses tickets using" "HTTPS"

        administrator -> webApplication "Monitors system operations and suspicious activity using" "HTTPS"

        eventStaff -> mobileApplication "Scans tickets and manages attendee admission using" "HTTPS"


        // =========================================================
        // Level 2 Relationships - Containers
        // =========================================================

        webApplication -> backendApi "Makes API requests to" "REST/HTTPS"

        mobileApplication -> backendApi "Makes ticket validation and admission requests to" "REST/HTTPS"

        backendApi -> emsDatabase "Reads and writes event, ticket, capacity, payment, and attendee data" "Transactional database access"


        // =========================================================
        // Level 2 Relationships - External Systems
        // =========================================================

        backendApi -> paymentProvider "Sends payment requests and receives payment status from" "External API/HTTPS"

        backendApi -> socialMediaService "Sends event and promotional content to" "External API/HTTPS"
    }


    views {

        // =========================================================
        // C4 Level 1 - System Context
        // =========================================================

        systemContext ems "SystemContext" {
            include eventOrganiser
            include ticketBuyer
            include eventStaff
            include administrator
            include ems
            include paymentProvider
            include socialMediaService

            autoLayout
        }


        // =========================================================
        // C4 Level 2 - Container
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

            autoLayout
        }

        theme default
    }
}