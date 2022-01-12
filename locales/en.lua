local Translations = {
    error = {
        not_enough = "Not enough money",
        not_impound = "Your car is not in impound",
        not_owned = "Vehicle not owned",
        no_vehicles = "You don't have any vehicles in this garage!",
        no_vehicles_impounded = "You don't have any impounded vehicles!",
        vehicle_at_depot = "Your vehicle may be at the depot!",
        impounded_by_police = "This vehicle was impounded by the police!",
        someone_inside = "Vehicle not stored, please check if is someone inside the car.",
    },
    success = {
        vehicle_parked = "Vehicle Parked",
    },
    info = {
        public_garage = "Public Garage",
        gang_garage = "Gang Garage",
        job_garage = "Job Garage",
        house_garage = "House Garage",
        impound = "Impound",
        my_vehicles = "My Vehicles",
        view_stored = "View your stored vehicles!",
        leave_garage = "⬅ Leave Garage",
        leave_depot = "⬅ Leave Depot",
        garage = "Garage: %{value}",
        depot = "Depot: %{value}",
        out = "Out",
        garaged = "Garaged",
        impounded = "Impounded By Police",
        garage_line = "State: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Body: %{value4}",
        depot_line = "Plate: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Body: %{value4}",
        garage_e = "~g~E~w~ - Garage",
        park_e = "~g~E~w~ - Park Vehicle",
    }
}


if GetConvar('qb_locale', 'en') == 'en' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })    
end
