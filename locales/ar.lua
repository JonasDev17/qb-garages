local Translations = {
    error = {
        not_enough = "مال غير كاف",
        not_impound = "سيارتك ليست في الحجز",
        not_owned = "مركبة غير مملوكة",
        no_vehicles = "ليس لديك أي مركبات في هذا المرآب",
        no_vehicles_impounded = "ليس لديك أي مركبات محجوزة",
        vehicle_at_depot = "قد تكون سيارتك في المستودع",
        impounded_by_police = "وقد احتجزت الشرطة هذه السيارة",
        someone_inside = "المركبة غير مخزنة ، يرجى التحقق مما إذا كان شخص ما داخل السيارة.",
    },
    success = {
        vehicle_parked = "تم تخزين السيارة",
    },
    info = { -- you need font arabic --
        public_garage = "غراج عام",
        gang_garage = "غراج العصابة",
        job_garage = "غراج العمل",
        house_garage = "غراج المنزل",
        impound = "الحجز",
        my_vehicles = "سيارتي",
        view_stored = "عرض المركبات المخزنة الخاصة بك",
        leave_garage = "⬅ خروج",
        leave_depot = "⬅ خروج",
        garage = "%{value} الغراج:",
        depot = "%{value} الحجز:",
        out = "خارج",
        garaged = "الغراج",
        impounded = "حجزتها الشرطة",
        garage_line = "%{value}<br>البنزين: %{value2} | المحرك: %{value3} | الجسم: %{value4}",
        depot_line = "%{value}<br>البنزين: %{value2} | المحرك: %{value3} | الجسم: %{value4}",
        garage_e = "~g~E~w~ - ﺝﺍﺮﻏ",
        park_e = "~g~E~w~ - ﺓﺭﺎﻴﺴﻟﺍ ﻦﻳﺰﺨﺗ",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
