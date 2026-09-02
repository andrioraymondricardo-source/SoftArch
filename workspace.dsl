workspace "Urban Marathon Management System" "C4 model for the Urban Marathon Management System" {

    model {

        participant = person "Participant" {
            description "Participates in the marathon."
        }

        marathonSystem = softwareSystem "Urban Marathon Management System" {
            description "Manages marathon operations."
        }

        participant -> marathonSystem "Uses"
    }

    views {

        systemContext marathonSystem "SystemContext" {
            include *
            autoLayout
        }

        theme default
    }
}