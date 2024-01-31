local QBCore = exports['qb-core']:GetCoreObject()
local OutsideVehicles = {}
local VehicleSpawnerVehicles = {}

local function TableContains (tab, val)
    if type(val) == "table" then
        for _, value in ipairs(tab) do
            if TableContains(val, value) then
                return true
            end
        end
        return false
    else
        for _, value in ipairs(tab) do
            if value == val then
                return true
            end
        end
    end
    return false
end

QBCore.Functions.CreateCallback("qb-garage:server:GetOutsideVehicle", function(source, cb, plate)
    plate = string.upper(plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if not OutsideVehicles[plate] then cb(nil) return end
     MySQL.query('SELECT * FROM player_vehicles WHERE citizenid = ? and plate = ?', {pData.PlayerData.citizenid, plate}, function(result)
        if result[1] then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garages:server:GetVehicleLocation", function(source, cb, plate)
    plate = string.upper(plate)
    local src = source
    local vehicles = GetAllVehicles()
    for _, vehicle in pairs(vehicles) do
        local pl = GetVehicleNumberPlateText(vehicle)
        if pl == plate then
            cb(GetEntityCoords(vehicle))
            return
        end
    end
    local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
    local veh = result[1]
    if veh then
        if Config.StoreParkinglotAccuratly and veh.parkingspot then
            local location = json.decode(veh.parkingspot)
            cb(vector3(location.x, location.y, location.z))
        else
            local garageName = veh and veh.garage
            local garage = Config.Garages[garageName]
            if garage and garage.blipcoords then
                cb(garage.blipcoords)
            elseif garage and garage.Zone and garage.Zone.Shape and garage.Zone.Shape[1] then
                cb(vector3(garage.Zone.Shape[1].x, garage.Zone.Shape[1].y, garage.Zone.minZ))
            else
                local result = MySQL.query.await('SELECT * FROM houselocations WHERE name = ?', {garageName})
                if result and result[1] then
                    local coords = json.decode(result[1].garage)
                    if coords then
                        cb(vector3(coords.x, coords.y, coords.z))
                    else
                        cb(nil)
                    end
                else
                    cb(nil)
                end
            end
        end
    end
end)

QBCore.Functions.CreateCallback("qb-garage:server:CheckSpawnedVehicle", function(source, cb, plate)
    plate = string.upper(plate)
    cb(VehicleSpawnerVehicles[plate] ~= nil and VehicleSpawnerVehicles[plate])
end)

RegisterNetEvent("qb-garage:server:UpdateSpawnedVehicle", function(plate, value)
    plate = string.upper(plate)
    VehicleSpawnerVehicles[plate] = value
end)

QBCore.Functions.CreateCallback('qb-garage:server:spawnvehicle', function (source, cb, vehInfo, coords, heading, warp)
    local hash = type(vehInfo.vehicle) == 'string' and joaat(vehInfo.vehicle) or vehInfo.vehicle;

    local ped
    if not coords then
        ped = GetPlayerPed(source)
        coords = GetEntityCoords(ped)
    end

    QBCore.Functions.TriggerClientCallback('qb-garages:client:GetVehicleType', source, function (vehicleType)

        if not CreateVehicleServerSetter then
            error('^1CreateVehicleServerSetter is not available on your artifact, please use artifact 5904 or above to be able to use this^0')
            return
        end

        local veh = CreateVehicleServerSetter and CreateVehicleServerSetter(hash, vehicleType, coords.x, coords.y, coords.z, heading) or CreateVehicle(hash, coords.x, coords.y, coords.z, heading, true, true)
        Wait(500)
        if not veh or not NetworkGetNetworkIdFromEntity(veh) then
            print('ISSUE HERE', veh, NetworkGetNetworkIdFromEntity(veh))
        end

        while not DoesEntityExist(veh) do
            Wait(0)
        end
    
        while GetVehicleNumberPlateText(veh) == "" do
            Wait(0)
        end
        
        local vehProps = {}
        local plate = string.upper(vehInfo.plate)
        if plate then
            SetVehicleNumberPlateText(veh, plate)
        end

        if warp then
            SetPedIntoVehicle(source, veh, -1)
        end

        local result = MySQL.query.await('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
        if result[1] then vehProps = json.decode(result[1].mods) end
        local netId = NetworkGetNetworkIdFromEntity(veh)
        OutsideVehicles[plate] = {netID = netId, entity = veh}
        cb(netId, vehProps or {})
    end, hash)
end)

local function GetVehicles(citizenid, garageName, state, cb)
    local result = nil
    if not Config.GlobalParking then
        result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND garage = @garage AND state = @state', {
            ['@citizenid'] = citizenid,
            ['@garage'] = garageName,
            ['@state'] = state
        })
    else
        result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND state = @state', {
            ['@citizenid'] = citizenid,
            ['@state'] = state
        })
    end
    cb(result)
end

local function GetDepotVehicles(citizenid, state, garage, cb)
    local result = MySQL.Sync.fetchAll("SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND (state = @state OR garage = @garage OR garage IS NULL or garage = '')", {
        ['@citizenid'] = citizenid,
        ['@state'] = state,
        ['@garage'] = garage
    })
    cb(result)
end

local function GetVehicleByPlate(plate)
    plate = string.upper(plate)
    local vehicles = GetAllVehicles() -- Get all vehicles known to the server
    for _, vehicle in pairs(vehicles) do
        local pl = GetVehicleNumberPlateText(vehicle)
        if pl == plate then
            return vehicle
        end
    end
    return nil
end

QBCore.Functions.CreateCallback("qb-garage:server:GetGarageVehicles", function(source, cb, garage, garageType, category)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local playerGang = pData.PlayerData.gang.name;

    if garageType == "public" then        --Public garages give player cars in the garage only
        GetVehicles(pData.PlayerData.citizenid, garage, 1, function(result)
            local vehs = {}
            if result[1] then
                for _, vehicle in pairs(result) do
                    if vehicle.parkingspot then
                        local spot = json.decode(vehicle.parkingspot)
                        if spot and spot.x then
                            vehicle.parkingspot = vector3(spot.x, spot.y, spot.z)
                        end
                    end
                    if vehicle.damage then
                        vehicle.damage = json.decode(vehicle.damage)
                    end
                    vehs[#vehs + 1] = vehicle
                end
                cb(vehs)
            else
                cb(nil)
            end
        end)
    elseif garageType == "depot" then    --Depot give player cars that are not in garage only
        GetDepotVehicles(pData.PlayerData.citizenid, 0, garage, function(result)
            local tosend = {}
            if result[1] then
                if type(category) == 'table' then
                    if TableContains(category, {'car'}) then
                        category = 'car'
                    elseif TableContains(category, {'plane', 'helicopter'}) then
                        category = 'air'
                    elseif TableContains(category, 'boat') then
                        category = 'sea'
                    end
                end
                for _, vehicle in pairs(result) do
                    if not QBCore.Shared.Vehicles[vehicle.vehicle] then
                        goto skip
                    end
                    if Config.SpawnVehiclesServerside then
                        local veh = GetVehicleByPlate(string.upper(vehicle.plate))
                        if (veh and GetVehicleBodyHealth(veh) < Config.MinImpoundDamage) or not veh then
                            goto skip
                        end
                    end
                    if vehicle.depotprice == 0 then
                        vehicle.depotprice = Config.DepotPrice
                    end

                    vehicle.parkingspot = nil
                    if vehicle.damage then
                        vehicle.damage = json.decode(vehicle.damage)
                    end

                    if category == "air" and ( QBCore.Shared.Vehicles[vehicle.vehicle].category == "helicopters" or QBCore.Shared.Vehicles[vehicle.vehicle].category == "planes" ) then
                        tosend[#tosend + 1] = vehicle
                    elseif category == "sea" and QBCore.Shared.Vehicles[vehicle.vehicle].category == "boats" then
                        tosend[#tosend + 1] = vehicle
                    elseif category == "car" and QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "helicopters" and QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "planes" and QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "boats" then
                        tosend[#tosend + 1] = vehicle
                    end
                    ::skip::
                end
                cb(tosend)
            else
                cb(nil)
            end
        end)
    else                            --House give all cars in the garage, Job and Gang depend of config
        local shared = ''
        if not TableContains(Config.SharedJobGarages, garage) and not (Config.SharedHouseGarage and garageType == "house") and not ((Config.SharedGangGarages == true or (type(Config.SharedGangGarages) == "table" and Config.SharedGangGarages[playerGang])) and garageType == "gang") then
            shared = " AND citizenid = '"..pData.PlayerData.citizenid.."'"
        end
         MySQL.query('SELECT * FROM player_vehicles WHERE garage = ? AND state = ?'..shared, {garage, 1}, function(result)
            if result[1] then
                local vehs = {}
                for _, vehicle in pairs(result) do
                    local spot = json.decode(vehicle.parkingspot)
                    if vehicle.parkingspot then
                        vehicle.parkingspot = vector3(spot.x, spot.y, spot.z)
                    end
                    if vehicle.damage then
                        vehicle.damage = json.decode(vehicle.damage)
                    end
                    vehs[#vehs + 1] = vehicle
                end
                cb(vehs)
            else
                cb(nil)
            end
        end)
    end
end)



QBCore.Functions.CreateCallback("qb-garage:server:checkOwnership", function(source, cb, plate, garageType, garage, gang)
    plate = string.upper(plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if garageType == "public" then        --Public garages only for player cars
        local addSQLForAllowParkingAnyonesVehicle = ""
        if not Config.AllowParkingAnyonesVehicle then
            addSQLForAllowParkingAnyonesVehicle = " AND citizenid = '"..pData.PlayerData.citizenid.."' "
        end
         MySQL.query('SELECT * FROM player_vehicles WHERE plate = ? ' .. addSQLForAllowParkingAnyonesVehicle,{plate}, function(result)
            if result[1] then
                cb(true)
            else
                cb(false)
            end
        end)
    elseif garageType == "house" then     --House garages only for player cars that have keys of the house
         MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
            if result[1] then
                cb(true)
            else
                cb(false)
            end
        end)
    elseif garageType == "gang" then        --Gang garages only for gang members cars (for sharing)
         MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
            if result[1] then
                --Check if found owner is part of the gang
                local Player = QBCore.Functions.GetPlayer(source)
                local playerGang = Player.PlayerData.gang.name
                cb(playerGang == gang)
            else
                cb(false)
            end
        end)
    else                            --Job garages only for cars that are owned by someone (for sharing and service) or only by player depending of config
        local shared = ''
        if not TableContains(Config.SharedJobGarages, garage) then
            shared = " AND citizenid = '"..pData.PlayerData.citizenid.."'"
        end
         MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?'..shared, {plate}, function(result)
            if result[1] then
                cb(true)
            else
                cb(false)
            end
        end)
    end
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetVehicleProperties", function(source, cb, plate)
    local properties = {}
    local result = MySQL.query.await('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] then
        properties = json.decode(result[1].mods)
    end
    cb(properties)
end)

RegisterNetEvent('qb-garage:server:updateVehicle', function(state, fuel, engine, body, properties, plate, garage, location, damage)
    plate = string.upper(plate)
    if location and type(location) == 'vector3' then
        MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, fuel = ?, engine = ?, body = ?, mods = ?, parkingspot = ? WHERE plate = ?',{state, garage, fuel, engine, body, json.encode(properties), json.encode(location), plate})
    else
        MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, fuel = ?, engine = ?, body = ?, mods = ? WHERE plate = ?', {state, garage, fuel, engine, body, json.encode(properties), plate})
    end
end)

RegisterNetEvent('qb-garage:server:updateVehicleState', function(state, plate, garage)
    plate = string.upper(plate)
    MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, depotprice = ? WHERE plate = ?',{state, garage, 0, plate})
end)

RegisterNetEvent('qb-garages:server:UpdateOutsideVehicles', function(Vehicles)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local citizenId = ply.PlayerData.citizenid
    OutsideVehicles[citizenId] = Vehicles
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetOutsideVehicles", function(source, cb)
    local ply = QBCore.Functions.GetPlayer(source)
    local citizenId = ply.PlayerData.citizenid
    if OutsideVehicles[citizenId] and next(OutsideVehicles[citizenId]) then
        cb(OutsideVehicles[citizenId])
    else
        cb({})
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        if Config.AutoRespawn then
            MySQL.update('UPDATE player_vehicles SET state = 1 WHERE state = 0', {})
        end
    end
end)

RegisterNetEvent('qb-garage:server:PayDepotPrice', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
    local bankBalance = Player.PlayerData.money["bank"]

    
    local vehicle = data.vehicle

     MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {string.upper(vehicle.plate)}, function(result)
        if result[1] then
            local vehicle = result[1]
            local depotPrice = vehicle.depotprice ~= 0 and vehicle.depotprice or Config.DepotPrice
            if cashBalance >= depotPrice then
                Player.Functions.RemoveMoney("cash", depotPrice, "paid-depot")
            elseif bankBalance >= depotPrice then
                Player.Functions.RemoveMoney("bank", depotPrice, "paid-depot")
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_enough"), 'error')
            end
        end
    end)
end)

RegisterNetEvent('qb-garages:server:parkVehicle', function(plate)
    plate = string.upper(plate)
    local vehicle = GetVehicleByPlate(plate)
    if vehicle then
        DeleteEntity(vehicle)
    end
end)

--External Calls
--Call from qb-vehiclesales
QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleOwner", function(source, cb, plate)
    plate = string.upper(plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
     MySQL.query('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?',{plate, pData.PlayerData.citizenid}, function(result)
        if result[1] then
            cb(true, result[1].balance)
        else
            cb(false)
        end
    end)
end)

--Call from qb-phone
QBCore.Functions.CreateCallback('qb-garages:server:GetPlayerVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Vehicles = {}

     MySQL.query('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid}, function(result)
        if result[1] then
            for k, v in pairs(result) do
                local VehicleData = QBCore.Shared.Vehicles[v.vehicle]
                if not VehicleData then goto continue end
                local VehicleGarage = Lang:t("error.no_garage")
                if v.garage ~= nil then
                    if Config.Garages[v.garage] ~= nil then
                        VehicleGarage = Config.Garages[v.garage].label
                    elseif Config.HouseGarages[v.garage] then
                        VehicleGarage = Config.HouseGarages[v.garage].label
                    end
                end

                if v.state == 0 then
                    v.state = Lang:t("status.out")
                elseif v.state == 1 then
                    v.state = Lang:t("status.garaged")
                elseif v.state == 2 then
                    v.state = Lang:t("status.impound")
                end
                
                local fullname 
                if VehicleData["brand"] ~= nil then
                    fullname = VehicleData["brand"] .. " " .. VehicleData["name"]
                else
                    fullname = VehicleData["name"]
                end
                local spot = json.decode(v.parkingspot)
                Vehicles[#Vehicles+1] = {
                    fullname = fullname,
                    brand = VehicleData["brand"],
                    model = VehicleData["name"],
                    plate = string.upper(v.plate),
                    garage = VehicleGarage,
                    state = v.state,
                    fuel = v.fuel,
                    engine = v.engine,
                    body = v.body,
                    parkingspot = spot and vector3(spot.x, spot.y, spot.z) or nil,
                    damage = json.decode(v.damage)
                }
                ::continue::
            end
            cb(Vehicles)
        else
            cb(nil)
        end
    end)
end)

local function GetRandomPublicGarage()
    for garageName, garage in pairs(Config.Garages)do
        if garage.type == 'public' then
            return garageName -- return the first garageName
        end
    end
end


-- Command to restore lost cars (garage: 'None' or something similar)
QBCore.Commands.Add("restorelostcars", "Restores cars that were parked in a grage that no longer exists in the config or is invalid (name change or removed).", {{name = "destination_garage", help = "(Optional) Garage where the cars are being sent to."}}, false,
function(source, args)
    local src = source
    if next(Config.Garages) ~= nil then
        local destinationGarage = args[1] and args[1] or GetRandomPublicGarage()
        if Config.Garages[destinationGarage] == nil then
            TriggerClientEvent('QBCore:Notify', src, 'Invalid garage name provided', 'error', 4500)
            return
        end

        local invalidGarages = {}
         MySQL.query('SELECT garage FROM player_vehicles', function(result)
            if result[1] then
                for _,v in ipairs(result) do
                    if Config.Garages[v.garage] == nil then
                        if v.garage then
                            invalidGarages[v.garage] = true
                        end
                    end
                end
                for garage,_ in pairs(invalidGarages) do
                    MySQL.update('UPDATE player_vehicles set garage = ? WHERE garage = ?',{destinationGarage, garage})
                end
                MySQL.update('UPDATE player_vehicles set garage = ? WHERE garage IS NULL OR garage = \'\'',{destinationGarage})
            end
        end)
    end
end, Config.RestoreCommandPermissionLevel)

if Config.EnableTrackVehicleByPlateCommand then
    QBCore.Commands.Add(Config.TrackVehicleByPlateCommand, 'Track vehicle', {{name='plate', help='Plate'}}, true, function(source, args)
    TriggerClientEvent('qb-garages:client:TrackVehicleByPlate', source, args[1])
    end, Config.TrackVehicleByPlateCommandPermissionLevel)
end
