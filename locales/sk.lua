local Translations = {
    error = {
        not_enough = "Nemáš dostatok peňazí",
        not_impound = "Vaše auto nie je zabavené",
        not_owned = "Vozidlo nikto nevlastnení",
        no_vehicles = "V tejto garáži nemáte žiadne vozidlá!",
        no_vehicles_impounded = "Nemáte žiadne zabavené vozidlá!",
        vehicle_at_depot = "Vaše vozidlo môže byť v depe!",
        impounded_by_police = "Toto vozidlo zabavila polícia!",
        someone_inside = "Vozidlo nie je uskladnené, skontrolujte, či niekto nie je v aute.",
    },
    success = {
        vehicle_parked = "Vozidlo je zaparkované",
    },
    info = {
        public_garage = "Verejná Garáž",
        gang_garage = "Gang Garáž",
        job_garage = "Pracovná Garáž",
        house_garage = "Osobná Garáž",
        impound = "Odťahovka",
        my_vehicles = "Moje vozidlá",
        view_stored = "Pozrieť si svoje uložené vozidlá!",
        leave_garage = "⬅ Opustiť Garáž",
        leave_depot = "⬅ Opustiť depo",
        garage = "Garáž: %{value}",
        depot = "Deop: %{value}",
        out = "Von",
        garaged = "Garážované",
        impounded = "Zabavené políciou",
        garage_line = "State: %{value}<br>Palivo: %{value2} | Motor: %{value3} | Body: %{value4}",
        depot_line = "SPZ: %{value}<br>Palivo: %{value2} | Motor: %{value3} | Body: %{value4}",
        garage_e = "~g~E~w~ - Garáž",
        park_e = "~g~E~w~ - Zaparkovať Vozidlo",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
