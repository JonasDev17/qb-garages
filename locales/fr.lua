local Translations = {
    error = {
        not_enough = "Pas assez d'argent",
        not_impound = "Votre véhicule n'est pas à la fourrière",
        not_owned = "Le véhicule ne vous appartient pas",
        no_vehicles = "Vous n'avez aucun véhicule dans ce garage!",
        no_vehicles_impounded = "Vous n'avez aucun véhicule en fourrière!",
        vehicle_at_depot = "Votre véhicule doit être à la fourrière!",
        impounded_by_police = "Ce véhicule a été mis en fourrière par la police!",
        someone_inside = "Le véhicule n'a pu être rangé, quelqu'un se trouve sans doute dedans.",
    },
    success = {
        vehicle_parked = "Véhicule garé",
    },
    info = {
        public_garage = "Garage Public",
        gang_garage = "Garage de Gang",
        job_garage = "Garage de fonction",
        house_garage = "Garage de maison",
        impound = "Fourrière",
        my_vehicles = "Mes Véhicules",
        view_stored = "Voir vos véhicules garés!",
        leave_garage = "⬅ Quitter le Garage",
        leave_depot = "⬅ Quitter la fourrière",
        garage = "Garage: %{value}",
        depot = "Fourrière: %{value}",
        out = "Sorti",
        garaged = "Garé",
        impounded = "Mis en fourrière par la police",
        garage_line = "Etat: %{value}<br>Essence: %{value2} | Moteur: %{value3} | Carrosserie: %{value4}",
        depot_line = "Plaque: %{value}<br>Essence: %{value2} | Moteur: %{value3} | Carrosserie: %{value4}",
        garage_e = "~g~E~w~ - Garage",
        park_e = "~g~E~w~ - Gare le véhicule",
    }
}


if GetConvar('qb_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })    
end
