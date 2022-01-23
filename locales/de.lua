local Translations = {
    error = {
        not_enough = "Nicht genu Geld",
        not_impound = "Dein Auto ist nicht abgeschleppt",
        not_owned = "Auto nicht in besitz",
        no_vehicles = "Du hast keine Autos in dieser Garage!",
        no_vehicles_impounded = "Du hast keine abgeschleppten Autos!",
        vehicle_at_depot = "Dein Auto ist vielleicht im Depot!",
        impounded_by_police = "Dieses Auto wurde abgeschleppt durch die Polizei!",
        someone_inside = "Auto nicht geparkt, bitte schau ob sich jemand darin befindet.",
    },
    success = {
        vehicle_parked = "Auto geparkt",
    },
    info = {
        public_garage = "Öffentliche  Garage",
        gang_garage = "Gang Garage",
        job_garage = "Job Garage",
        house_garage = "Haus Garage",
        impound = "Abschlepphof",
        my_vehicles = "Meine Autos",
        view_stored = "Sieh deine geparkten Autos!",
        leave_garage = "⬅ Verlasse Garage",
        leave_depot = "⬅ Verlasse Depot",
        garage = "Garage: %{value}",
        depot = "Depot: %{value}",
        out = "Draußen",
        garaged = "In der Garage",
        impounded = "Abgeschleppt durch Polizei",
        garage_line = "Ort: %{value}<br>Benzin: %{value2} | Motor: %{value3} | Karosserie: %{value4}",
        depot_line = "Kennzeichen: %{value}<br>Benzin: %{value2} | Motor: %{value3} | Karosserie: %{value4}",
        garage_e = "~g~E~w~ - Garage",
        park_e = "~g~E~w~ - parke Auto",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
