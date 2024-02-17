local Translations = {
    error = {
        no_vehicles = "Du har inga fordon i det här garaget!",
        not_impound = "Ditt fordon är inte beslagtaget",
        not_owned = "Du äger inte det här fordonet",
        not_correct_type = "Du kan inte parkera den här typen av fordon här",
        not_enough = "Inte tillräckligt med pengar",
        no_garage = "Ingen",
        too_far_away = "Too far away from a parking lot", -- TODO
        occupied = "Parking lot is already occupied", -- TODO
        all_occupied = "All parkingspots are occupied", -- TODO
        no_vehicle = "There is no vehicle to park", -- TODO
        no_house_keys = "You don't have the keys for this house garage", -- TODO
    },
    success = {
        vehicle_parked = "Fordon har parkerats",
    },
    menu = {
        header = {
            house_garage = "Hus Garage",
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
            job = "⬅ Lämna garage",
            gang = "⬅ Lämna garage"
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
}

if GetConvar('qb_locale', 'en') == 'sv' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
