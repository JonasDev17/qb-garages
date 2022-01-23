local Translations = {
    error = {
        not_enough = "Ei tarpeeksi rahaa!",
        not_impound = "Ajoneuvosi ei ole takavarikossa",
        not_owned = "Ajoneuvo ei ole omistuksessasi",
        no_vehicles = "Sinulla ei ole ajoneuvoja tässä tallissa!",
        no_vehicles_impounded = "Sinulla ei ole ajoneuvoja takavarikoituna!",
        vehicle_at_depot = "Ajoneuvosi saattaa olla varikolla!",
        impounded_by_police = "Ajoneuvo takavarikoitiin poliisin toimesta.",
        someone_inside = "Ajoneuvoa ei voitu tallettaa: Tarkista onko joku sisällä.",
    },
    success = {
        vehicle_parked = "Ajoneuvo parkkeerattu",
    },
    info = {
        public_garage = "Julkinen talli",
        gang_garage = "Jengitalli",
        job_garage = "Työtalli",
        house_garage = "Talon talli",
        impound = "Takavarikko",
        my_vehicles = "Ajoneuvoni",
        view_stored = "Katso talletettuja ajoneuvoja!",
        leave_garage = "⬅ Poistu tallista",
        leave_depot = "⬅ Poistu varikolta",
        garage = "Talli: %{value}",
        depot = "Varikko: %{value}",
        out = "Ulos",
        garaged = "Talletettu",
        impounded = "Takavarikoitu poliisin toimesta",
        garage_line = "Tila: %{value}<br>Bensa: %{value2} | Moottori: %{value3} | Kori: %{value4}",
        depot_line = "Rekisteritunnus: %{value}<br>Bensa: %{value2} | Moottori: %{value3} | Kori: %{value4}",
        garage_e = "~g~E~w~ - Talli",
        park_e = "~g~E~w~ - Parkkeeraa ajoneuvo",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
