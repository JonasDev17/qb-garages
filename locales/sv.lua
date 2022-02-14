local Translations = {
    error = {
        no_vehicles = "Du har inga fordon i det här garaget!",
        not_impound = "Ditt fordon är inte beslagtaget",
        not_owned = "Du äger inte det här fordonet",
        not_correct_type = "Du kan inte parkera den här typen av fordon här",
        not_enough = "Inte tillräckligt med pengar",
        no_garage = "Ingen",
    },
    success = {
        vehicle_parked = "Fordon har parkerats",
    },
    menu = {
        header = {
            house_car = "Husgarage %{value}",
            public_car = "Offentligt Garage %{value}",
            public_sea = "Offentlig Båthus %{value}",
            public_air = "Offentlig Hangar %{value}",
            job_car = "Arbetsgarage %{value}",
            job_sea = "Arbetsbåthus %{value}",
            job_air = "Arbetshangar %{value}",
            gang_car = "Gänggarage %{value}",
            gang_sea = "Gängbåthus %{value}",
            gang_air = "Gänghangar %{value}",
            depot_car = "Bilbeslag %{value}",
            depot_sea = "Båtbeslag %{value}",
            depot_air = "Helikopterbeslag %{value}",
            vehicles = "Tillgängliga fordon",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Lämna garage",
            sea = "⬅ Lämna båthus",
            air = "⬅ Lämna Hangar",
        },
        text = {
            vehicles = "Visa dina parkerade fordon!",
            depot = "Reg.plåt: %{value}<br>Bränsle: %{value2} | Motorhälsa: %{value3} | Karosshälsa: %{value4}",
            garage = "Status: %{value}<br>Bränsle: %{value2} | Motorhälsa: %{value3} | Karosshälsa: %{value4}",
        }
    },
    status = {
        out = "Ute",
        garaged = "Parkerad",
        impound = "Beslagtaget av Polis",
    },
    info = {
        car_e = "~g~E~w~ - Garage",
        sea_e = "~g~E~w~ - Båthus",
        air_e = "~g~E~w~ - Hangar",
        park_e = "~g~E~w~ - Parkera Fordon",
        house_garage = "Hus Garage",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
