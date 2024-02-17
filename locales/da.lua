local Translations = {
    error = {
        no_vehicles = "Der er ingen biler i denne garage!",
        not_impound = "Din bil er ikke i impounden",
        not_owned = "Dette er ikke din bil",
        not_correct_type = "Du kan ikke parkere denne type bil her",
        not_enough = "Ikke nok penge",
        no_garage = "Ingen",
        too_far_away = "For langt væk fra en parkeringsplads",
        occupied = "Parkeringspladsen er allerede optaget",
        all_occupied = "Alle parkeringspladser er optaget",
        no_vehicle = "Der er intet køretøj at parkere",
        no_house_keys = "Du har ikke nøglerne til denne husgarage",
    },
    success = {
        vehicle_parked = "Køretøj opbevaret",
    },
    menu = {
        header = {
            house_garage = "Husgarage",
            house_car = "Husgarage %{value}",
            public_car = "Offentlig garage %{value}",
            public_sea = "Offentligt bådehus %{value}",
            public_air = "Offentlig hangar %{value}",
            job_car = "Job Garage %{value}",
            job_sea = "Job Boathouse %{value}",
            job_air = "Job Hangar %{value}",
            gang_car = "Bande Garage %{value}",
            gang_sea = "Bande Boathouse %{value}",
            gang_air = "Bandehangaren %{value}",
            depot_car = "Depot %{value}",
            depot_sea = "Depot %{value}",
            depot_air = "Depot %{value}",
            vehicles = "Tilgængelige køretøjer",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Forlad garagen",
            sea = "⬅ Forlad bådehus",
            air = "⬅ Forlad Hangar",
            job = "⬅ Forlad garagen",
            gang = "⬅ Forlad garagen",
        },
        text = {
            vehicles = "Se lagrede køretøjer!",
            depot = "Plade: %{value}<br>Brændstof: %{value2} | Motor: %{value3} | Krop: %{value4}",
            garage = "Tilstand: %{value}<br>Brændstof: %{value2} | Motor: %{value3} | Krop: %{value4}",
        }
    },
    status = {
        out = "Ude",
        garaged = "i garage",
        beslaglagt = "Beslaglagt",
    },
}

if GetConvar('qb_locale', 'en') == 'da' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
