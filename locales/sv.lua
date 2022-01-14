local Translations = {
    error = {
        not_enough = "Du har inte tillräckligt med pengar",
        not_impound = "Ditt fordon är inte beslagtagen",
        not_owned = "Du äger inte fordonet",
        no_vehicles = "Du har inga fordon i garaget!",
        no_vehicles_impounded = "Du har inga beslagtagna fordon!",
        vehicle_at_depot = "Ditt fordon kan vara på uppställningsplatsen!",
        impounded_by_police = "Fordonet är konfiskerat av Polisen!",
        someone_inside = "Fordonet är inte i förvar, Kontrollera om någon befinner sig i bilen.",
    },
    success = {
        vehicle_parked = "Fordon parkerat",
    },
    info = {
        public_garage = "Offentligt garage",
        gang_garage = "Gänggarage",
        job_garage = "Arbetsplatsgarage",
        house_garage = "Privat Garage",
        impound = "Fordonsbeslag",
        my_vehicles = "Mina fordon",
        view_stored = "Visa parkerade fordon!",
        leave_garage = "⬅ Lämna fordon",
        leave_depot = "⬅ Lämna uppställningsplats",
        garage = "Garage: %{value}",
        depot = "Uppställningsplats: %{value}",
        out = "Ute",
        garaged = "Parkerad",
        impounded = "Konfiskerad av Polisen",
        garage_line = "Status: %{value}<br>Bränsle: %{value2} | Motor: %{value3} | Kaross: %{value4}",
        depot_line = "Reg.plåt: %{value}<br>Bränsle: %{value2} | Motor: %{value3} | Kaross: %{value4}",
        garage_e = "~g~E~w~ - Garage",
        park_e = "~g~E~w~ - Parkera Fordon",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
