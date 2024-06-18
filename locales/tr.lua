local Translations = {
    error = {
        no_vehicles = "Bu lokasyonda herhangi bir araç yok!",
        not_impound = "Herhangi bir çekilmiş aracın yok.",
        not_owned = "Bu aracı garaja koyamazsın.",
        not_correct_type = "Bu tip bir aracı bu garaja koyamazsın.",
        not_enough = "Yeterli kadar paran yok.",
        no_garage = "Hiçbiri",
        too_far_away = "Garaj çok uzağında.",
        occupied = "Garaj zaten dolu.",
        all_occupied = "Tüm park yerleri dolu.",
        no_vehicle = "Park edilecek araç yok.",
        no_house_keys = "Bu evin garajının anahtarlarına sahip değilsin",
    },
    success = {
        vehicle_parked = "Araç garaja park edildi.",
    },
    menu = {
        header = {
            house_garage = "Ev Garajı",
            house_car = "Ev Garajı %{value}",
            public_car = "Açık Garaj %{value}",
            public_sea = "Açık Bot Garajı %{value}",
            public_air = "Açık Hangar %{value}",
            job_car = "Meslek Garajı %{value}",
            job_sea = "Meslek Bot Garajı %{value}",
            job_air = "Meslek Hangar %{value}",
            gang_car = "Çete Garajı %{value}",
            gang_sea = "Çete Bot Garajı %{value}",
            gang_air = "Çete Hangar %{value}",
            depot_car = "Çekilmişler %{value}",
            depot_sea = "Çekilmişler %{value}",
            depot_air = "Çekilmişler %{value}",
            vehicles = "Mevcut Araçlar",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Garajdan Ayrıl",
            sea = "⬅ Bot Garajından Ayrıl",
            air = "⬅ Hangardan Ayrıl",
            job = "⬅ Garajdan Ayrıl",
            gang = "⬅ Garajdan Ayrıl"
        },
        text = {
            vehicles = "Garajdaki arçaları görüntüle!",
            depot = "Plaka: %{value}<br>Yakıt: %{value2} | Motor: %{value3} | Gövde: %{value4}",
            garage = "Sokak: %{value}<br>Yakıt: %{value2} | Motor: %{value3} | Gövde: %{value4}",
        }
    },
    status = {
        out = "Dışarıda",
        garaged = "Garajda",
        impound = "Çekilmiş",
    },
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
