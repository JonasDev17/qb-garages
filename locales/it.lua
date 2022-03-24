local Translations = {
    error = {
        not_enough = "Non hai abbastanza denaro",
        not_impound = "Il tuo veicolo non è sequestrato",
        not_owned = "Veicolo non posseduto",
        no_vehicles = "Non hai veicoli in questo garage!",
        no_vehicles_impounded = "Non hai nessun veicolo sequestrato!",
        vehicle_at_depot = "Il tuo veicolo potrebbe essere al deposito!",
        impounded_by_police = "Questo veicolo è stato sequestrato dalla polizia!",
        someone_inside = "Veicolo non depositato, controlla se c\'è qualcuno all\'interno del veicolo.",
    },
    success = {
        vehicle_parked = "Veicolo Parcheggiato",
    },
    info = {
        public_garage = "Garage Pubblico",
        gang_garage = "Garage Gang",
        job_garage = "Garage Lavoro",
        house_garage = "Garage Casa",
        impound = "Sequestra",
        my_vehicles = "Miei Veicoli",
        view_stored = "Controlla i tuoi veicoli depostitati!",
        leave_garage = "⬅ Lascia Garage",
        leave_depot = "⬅ Lascia Deposito",
        garage = "Garage: %{value}",
        depot = "Deposito: %{value}",
        out = "Fuori",
        garaged = "Parcheggiato",
        impounded = "Sequestrato Dalla Polizia",
        garage_line = "Stato: %{value}<br>Carburante: %{value2} | Motore: %{value3} | Carrozzeria: %{value4}",
        depot_line = "Targa: %{value}<br>Carburante: %{value2} | Motore: %{value3} | Carrozzeria: %{value4}",
        garage_e = "~g~E~w~ - Garage",
        park_e = "~g~E~w~ - Parcheggia Veicolo",
    }
}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})