local Translations = {
    error = {
        no_vehicles = "No tienes ningún vehículo en este garaje!",
        not_impound = "Tu Vehiculo no está en el depósito",
        not_owned = "No eres dueño del vehiculo",
        not_correct_type = "No puede almacenar este tipo de vehículo aquí.",
        not_enough = "Dinero insuficiente",
        no_garage = "Ninguno",
        vehicle_occupied = "No puedes almacenar este vehículo ya que no está vacío.",
    },
    success = {
        vehicle_parked = "vehículo estacionado",
    },
    menu = {
        header = {
            house_car = "Garage de casa %{value}",
            public_car = "Garage Público  %{value}",
            public_sea = "Boathouse Público  %{value}",
            public_air = "Hangar Público  %{value}",
            job_car = "Job Garage %{value}",
            job_sea = "Job Boathouse %{value}",
            job_air = "Job Hangar %{value}",
            gang_car = "Gang Garage %{value}",
            gang_sea = "Gang Boathouse %{value}",
            gang_air = "Gang Hangar %{value}",
            depot_car = "Deposito %{value}",
            depot_sea = "Deposito %{value}",
            depot_air = "Deposito %{value}",
            vehicles = "Vehiculos Disponible ",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Abandonar Garage",
            sea = "⬅ Abandonar Boathouse",
            air = "⬅ Abandonar Hangar",
        },
        text = {
            vehicles = "Ver vehículos almacenados!",
            depot = "Placa: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Carroceria: %{value4}",
            garage = "Estado: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Carroceria: %{value4}",
        }
    },
    status = {
        out = "Afuera",
        garaged = "en garaje",
        impound = "incautado por la policía",
    },
    info = {
        car_e = "[E] Garage",
        sea_e = "[E] Boathouse",
        air_e = "[E] Hangar",
        park_e = "[E] Almacenar vehículo",
        house_garage = "garaje de la casa",
    }
}

if GetConvar('qb_locale', 'en') == 'es' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
