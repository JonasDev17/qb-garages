local Translations = {
    error = {
        no_vehicles = "There are no vehicles in this location!",
        not_impound = "Your vehicle is not in impound",
        not_owned = "This vehicle can't be stored",
        not_correct_type = "You can't store this type of vehicle here",
        not_enough = "Not enough money",
        no_garage = "None",
        too_far_away = "Too far away from a parking lot",
        occupied = "Parking lot is already occupied",
        all_occupied = "All parking spots are occupied",
        no_vehicle = "There is no vehicle to park",
        no_house_keys = "You don't have the keys for this house garage",
        job_not_defined = 'Job not defined on garage',
        gang_not_defined = 'Gang not defined on garage',
        job_garage_not_configured = 'Job garage with id $%{value} not configured',
        jobgarageidentifier_not_configured = "'jobGarageIdentifier' not defined on job garage $%{value}",
    },
    success = {
        vehicle_parked = "Vehicle Stored",
    },
    info = {
        park_vehicle = "Park Vehicle",
        open_garage = "Open Garage",
        open_impound_lot = "Open Impound Lot",
    },
    menu = {
        header = {
            house_garage = "House Garage",
            house_car = "House Garage %{value}",
            public_car = "Public Garage %{value}",
            public_sea = "Public Boathouse %{value}",
            public_air = "Public Hangar %{value}",
            job_car = "Job Garage %{value}",
            job_sea = "Job Boathouse %{value}",
            job_air = "Job Hangar %{value}",
            gang_car = "Gang Garage %{value}",
            gang_sea = "Gang Boathouse %{value}",
            gang_air = "Gang Hangar %{value}",
            depot_car = "Depot %{value}",
            depot_sea = "Depot %{value}",
            depot_air = "Depot %{value}",
            vehicles = "Available Vehicles",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Leave Garage",
            sea = "⬅ Leave Boathouse",
            air = "⬅ Leave Hangar",
            job = "⬅ Leave Garage"
        },
        text = {
            vehicles = "View stored vehicles!",
            depot = "Plate: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Body: %{value4}",
            garage = "State: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Body: %{value4}",
        }
    },
    status = {
        out = "Out",
        garaged = "Garaged",
        impound = "Impounded",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
