local Translations = {
    error = {
        not_enough = "Ikke penge nok",
        not_impound = "Dit køretøj er ikke i impound",
        not_owned = "Du ejer ikke dette køretøj",
        no_vehicles = "Du har ingen køretøjer i denne garage!",
        no_vehicles_impounded = "Du har ingen beslaglagte køretøjer!",
        vehicle_at_depot = "Dit køretøj befinder sig måske ved depotet!",
        impounded_by_police = "Dette køretøj blev beslaglagt af politiet!",
        someone_inside = "Køretøj ikke gemt, se venligst om nogen er i køretøjet.",
    },
    success = {
        vehicle_parked = "Køretøj parkeret",
    },
    info = {
        public_garage = "Offentlig garage",
        gang_garage = "Bande garage",
        job_garage = "Job garage",
        house_garage = "Bolig garage",
        impound = "Impound",
        my_vehicles = "Mine køretøjer",
        view_stored = "Se dine parkeret køretøjer!",
        leave_garage = "⬅ Forlad garage",
        leave_depot = "⬅ Forlad depot",
        garage = "Garage: %{value}",
        depot = "Depot: %{value}",
        out = "Ude",
        garaged = "I garage",
        impounded = "Beslaglagt af politiet",
        garage_line = "Stand: %{value}<br>Tank: %{value2} | Motor: %{value3} | Karosseri: %{value4}",
        depot_line = "Reg.Nr.: %{value}<br>Tank: %{value2} | Motor: %{value3} | Karosseri: %{value4}",
        garage_e = "~g~E~w~ - Garage",
        park_e = "~g~E~w~ - Parkér køretøj",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
