local Translations = {
    error = {
        not_enough = "არ გააქვს საკმარისი თანხა",
        not_impound = "შენი ავტომობილი არ არის საჯარიმოზე",
        not_owned = "ავტომობილი არ არის საკუთრებაში",
        no_vehicles = "არ გყავს არანაირი ავტომობილი გარაჟში!",
        no_vehicles_impounded = "შენ არ გყავს მანაქანა საჯარიმოზე!",
        vehicle_at_depot = "ავტომობილი შეიძლება იყოს საჯარიმოზე!",
        impounded_by_police = "ეს ავტომობილი იქნა გადაყვანილი საჯარიმოზე პოლიციის მიერ!",
        someone_inside = "ავტომობილი არ არის შენახული, გადაამოწმე თუ არის ვინმე შიგნით.",
    },
    success = {
        vehicle_parked = "ავტომობილი დაპარკინგებულია",
    },
    info = {
        public_garage = "საერთო პარკინგი",
        gang_garage = "დაჯგუფების ფარეხი",
        job_garage = "სამსახურეობრივი ფარეხი",
        house_garage = "საცხოვრებელი ფარეხი",
        impound = "საჯარიმო",
        my_vehicles = "ჩემი ავტომობილები",
        view_stored = "შენახული ავტომობილების ნახვა!",
        leave_garage = "⬅ ფარეხიდან გასვლა",
        leave_depot = "⬅ საჯარიმოდან გასვლა",
        garage = "ფარეხი: %{value}",
        depot = "საჯარიმო: %{value}",
        out = "გარეთ",
        garaged = "ფარეხში",
        impounded = "საჯარიმოზე პოლიციის მიერ",
        garage_line = "ნომერი: %{value}<br>ავზი: %{value2} | მატორი: %{value3} | მდგომარეობა: %{value4}",
        depot_line = "ნომერი: %{value}<br>ავზი: %{value2} | მატორი: %{value3} | მდგომარეობა: %{value4}",
        garage_e = "~g~E~w~ - ფარეხი",
        park_e = "~g~E~w~ - ავტომობილის პარკირება",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
