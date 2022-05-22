local Translations = {
    error = {
        no_vehicles = "Vous n'avez aucun véhicule dans ce garage!",              
        not_impound = "Votre véhicule n'est pas à la fourrière",
        not_owned = "Le véhicule ne vous appartient pas",
        not_correct_type = "Vous ne pouvez pas stocker ce type de véhicule ici.",
        not_enough = "Pas assez d'argent",
        no_garage = "Aucun",
        too_far_away = "Trop loin d'une place de parking",
        occupied = "Parking déjà occupé",
        all_occupied = "Toutes les places de parking sont occupées",
        no_vehicle = "Il n'y a pas de véhicule a garer",
        no_house_keys = "Vous n'avez pas les clées de ce garage",
    },
    success = {
        vehicle_parked = "Véhicule garé !",
    },
    menu = {
        header = {
            house_garage = "Garage Personnel",
            house_car = "Garage de propriété %{value}",
            public_car = "Garage Public %{value}",
            public_sea = "Hangar à bateaux Public %{value}",
            public_air = "Hangar Public %{value}",
            job_car = "Garage de fonction %{value}",
            job_sea = "Hangar à bateaux de fonction %{value}",
            job_air = "Hangar de fonction %{value}",
            gang_car = "Garage de Gang %{value}",
            gang_sea = "Hangar à bateaux de Gang %{value}",
            gang_air = "Hangar de Gang %{value}",
            depot_car = "Fourrière %{value}",
            depot_sea = "Fourrière %{value}",
            depot_air = "Fourrière %{value}",
            vehicles = "Véhicules disponibles",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Quitter le garage",
            sea = "⬅ Quitter le hangar à bateaux",
            air = "⬅ Quitter le Hangar",
            job = "⬅ Quitter le garage"
        },
        text = {
            vehicles = "Voir les véhicules stockés!",
            depot = "Plaque: %{value}<br>Réservoir: %{value2} | Moteur: %{value3} | Carrosserie: %{value4}",
            garage = "État: %{value}<br>Réservoir: %{value2} | Moteur: %{value3} | Carrosserie: %{value4}",
        }
    },
    status = {
        out = "Dehors",
        garaged = "Garé",
        impound = "En Fourrière par la Police",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
