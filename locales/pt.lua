local Translations = {
    error = {
        not_enough = "Dinheiro insuficiente",
        not_impound = "O teu veículo não está nos apreendidos",
        not_owned = "Este veículo não te pertence",
        no_vehicles = "Não tens nenhum veículo nesta garagem!",
        no_vehicles_impounded = "Não tens nenhum veículo apreendido!",
        vehicle_at_depot = "O teu veículo pode estar apreendido!",
        impounded_by_police = "Este veículo foi apreendido pela polícia!",
        someone_inside = "Veículo não guardado, certifica-te que ninguém está dentro do carro.",
    },
    success = {
        vehicle_parked = "Veículo guardado",
    },
    info = {
        public_garage = "Garagem Pública",
        gang_garage = "Garagem da Gang",
        job_garage = "Garagem do Trabalho",
        house_garage = "Garagem da Casa",
        impound = "Apreendidos",
        my_vehicles = "Meus Veículos",
        view_stored = "Ver veículos guardados!",
        leave_garage = "⬅ Sair da Garagem",
        leave_depot = "⬅ Sair dos Apreendidos",
        garage = "Garagem: %{value}",
        depot = "Apreendidos: %{value}",
        out = "Fora",
        garaged = "Guardado",
        impounded = "Apreendido Pela Polícia",
        garage_line = "Estado: %{value}<br>Combu: %{value2} | Motor: %{value3} | Chassi: %{value4}",
        depot_line = "Placa: %{value}<br>Combu: %{value2} | Motor: %{value3} | Chassi: %{value4}",
        garage_e = "~g~E~w~ - Garagem",
        park_e = "~g~E~w~ - Guardar Veículo",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
