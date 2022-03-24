local Translations = {
    error = {
        not_enough = "Dinero insuficiente",
        not_impound = "Tu Vehiculo no está en el depósito",
        not_owned = "No eres dueño del vehiculo",
        no_vehicles = "No tienes ningún vehículo en este garaje!",
        no_vehicles_impounded = "No tienes ningún vehículo incautado.!",
        vehicle_at_depot = "Su vehículo puede estar en el depósito!",
        impounded_by_police = "Este vehículo fue incautado por la policía.!",
        someone_inside = "Vehículo no guardado, compruebe si hay alguien dentro del coche..",
    },
    success = {
        vehicle_parked = "vehículo estacionado",
    },
    info = {
        public_garage = "Garaje publico",
        gang_garage = "Garaje de banda",
        job_garage = "Garaje de trabajo",
        house_garage = "Garage de casa",
        impound = "Confiscar",
        my_vehicles = "Mis vehículos",
        view_stored = "Ver sus vehículos almacenados!",
        leave_garage = "⬅ Salir del garaje",
        leave_depot = "⬅ Salir del depósito",
        garage = "Garaje: %{value}",
        depot = "Deposito: %{value}",
        out = "Fuera",
        garaged = "En garaje",
        impounded = "incautado por la policía",
        garage_line = "Estado: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Carroceria: %{value4}",
        depot_line = "Placa: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Carroceria: %{value4}",
        garage_e = "~g~E~w~ - Garaje",
        park_e = "~g~E~w~ - Estacionar vehículo",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
