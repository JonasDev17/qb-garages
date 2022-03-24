local Translations = {
    error = {
        not_enough = "Mojodi Kafi Nist",
        not_impound = "Mashin Shoma Togif Nashode",
        not_owned = "Vasile Nagliye Motealeg be Shoma Nist",
        no_vehicles = "Shoma Hich Vasile Nagliyei dar in Garazh Nararid!",
        no_vehicles_impounded = "Shoma Hich Vasile Nagliyei dar Togif Nararid!",
        vehicle_at_depot = "Vasile Nagliye Shoma dar Anbar Ast!",
        impounded_by_police = "In Vasile Nagliye Tavasote Police Togif Shode Ast!",
        someone_inside = "Vasile Nagliye Park Nashod, Lotfat Barasi Konid Kasi Dakhel Mashin Nabashad..",
    },
    success = {
        vehicle_parked = "Vasile Nagliye Park Shod",
    },
    info = {
        public_garage = "Garazhe Omumi",
        gang_garage = "Garazhe Band",
        job_garage = "Garazhe Shogh",
        house_garage = "Garazhe Khane",
        impound = "Togif",
        my_vehicles = "Vasayele Nagliye Man",
        view_stored = "Vasayele Nagliye Park Shodeye Khod ra Moshahede Konid!",
        leave_garage = "⬅ Tark Garazh",
        leave_depot = "⬅ Tark Anbar",
        garage = "Garazh: %{value}",
        depot = "Anbar: %{value}",
        out = "Birun",
        garaged = "Dar Garazh",
        impounded = "Togif Shode Tavasote Police",
        garage_line = "Eyalat: %{value}<br>Sokht: %{value2} | Motor: %{value3} | Badane: %{value4}",
        depot_line = "Pelak: %{value}<br>Sokht: %{value2} | Motor: %{value3} | Badane: %{value4}",
        garage_e = "~g~E~w~ - Garazh",
        park_e = "~g~E~w~ - Park Kardan Vasile Nagliye",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
