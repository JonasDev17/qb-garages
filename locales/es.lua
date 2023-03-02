local Translations = {
    error = {
        no_vehicles = "¡No hay vehículos en esta ubicación!",
        not_impound = "Tu vehículo no está en embargo",
        not_owned = "Este vehículo no puede ser estacionado",
        not_correct_type = "No puedes guardar este tipo de vehículo aquí",
        not_enough = "No tienes suficiente dinero",
        no_garage = "Ninguno",
        too_far_away = "Muy lejos de zona de estacionamiento",
        occupied = "Espacio de estacionamiento ya está ocupado",
        all_occupied = "Todos los espacios de estacionamiento están ocupados",
        no_vehicle = "No hay vehículo para estacionar",
        no_house_keys = "No tienes las llaves para este garaje de casa",
        job_not_defined = 'Trabajo no definido en garaje',
        gang_not_defined = 'Pandilla no definida en garaje',
        job_garage_not_configured = 'Garaje de trabajo con id $%{value} no está configurado',
        jobgarageidentifier_not_configured = "'jobGarageIdentifier' no está definido en garaje de trabajo $%{value}",
    },
    success = {
        vehicle_parked = "Vehículo estacionado",
    },
    info = {
        park_vehicle = "Estacionar vehículo",
        open_garage = "Abrir garaje",
        open_impound_lot = "Abrir depósito de vehículos",
    },
    menu = {
        header = {
            house_garage = "Garaje de casa",
            house_car = "Garaje de casa %{value}",
            public_car = "Garaje público %{value}",
            public_sea = "Marina pública %{value}",
            public_air = "Hangar público %{value}",
            job_car = "Garaje de trabajo %{value}",
            job_sea = "Marina de trabajo %{value}",
            job_air = "Hangar de trabajo %{value}",
            gang_car = "Garaje de pandilla %{value}",
            gang_sea = "Marina de pandilla %{value}",
            gang_air = "Hangar de pandilla %{value}",
            depot_car = "Deposito %{value}",
            depot_sea = "Deposito %{value}",
            depot_air = "Deposito %{value}",
            vehicles = "Vehículos disponibles",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Salir garaje",
            sea = "⬅ Salir marina",
            air = "⬅ Salir hangar",
            job = "⬅ Salir garaje"
        },
        text = {
            vehicles = "¡Ver vehículos estacionados!",
            depot = "Placa: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Cuerpo: %{value4}",
            garage = "Estado: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Cuerpo: %{value4}",
        }
    },
    status = {
        out = "Afuera",
        garaged = "En garaje",
        impound = "Embargado",
    },
}

if GetConvar('qb_locale', 'en') == 'es' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
