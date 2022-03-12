local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData() -- Just for resource restart (same as event handler)
local insideZones = {}
local OutsideVehicles = {}

for name, garage in pairs(PolyGarages) do -- foreach shop
    insideZones[name] = false  -- default to not being in a shop
end

local zones = {}

function getGarageInsideOf() 
    for name, garage in pairs(PolyGarages) do -- foreach shop
        if insideZones[name] then
            return name
        end
    end
    return nil
end

local function isInGarage() 
    for garageName, isInside in pairs(insideZones) do
        if isInside then
            return true
        end
    end

    return false
end

local function createGarageZones(garageShape, name)
    local zone = PolyZone:Create(garageShape, {
        name = name,
        minZ = garageShape.minZ,
        maxZ = garageShape.maxZ
    })
    zone:onPlayerInOut(function (isPointInside)
        if isPointInside then
            insideZones[name] = true
            CreateThread(function ()
                while insideZones[name] do
                    local PlayerJob = QBCore.Functions.GetPlayerData().job
                    local Player = PlayerPedId()
                    local veh = GetVehiclePedIsIn(Player)
                    for index, garages in pairs(PolyGarages) do
                        if index == getGarageInsideOf() then
                            if garages.type == 'job' then
                                local job = garages.job
                                if PlayerJob.name == job then
                                    if IsPedInAnyVehicle(Player) then
                                        exports['qb-radialmenu']:AddOption(5, {
                                            id = 'put_up_vehicle',
                                            title = 'Put Up Vehicle',
                                            icon = 'car',
                                            type = 'client',
                                            event = 'qb-Garages:client:putupvehicle',
                                            shouldClose = true
                                        }) 
                                    else
                                        exports['qb-radialmenu']:AddOption(5, {
                                            id = 'open_garage_menu',
                                            title = 'Open Garage Menu',
                                            icon = 'car',
                                            type = 'client',
                                            event = 'qb-Garages:client:openmenu',
                                            shouldClose = true
                                        })
                                    end
                                end
                            elseif garages.type == 'public' then
                                if IsPedInAnyVehicle(Player) then
                                    exports['qb-radialmenu']:AddOption(5, {
                                        id = 'put_up_vehicle',
                                        title = 'Put Up Vehicle',
                                        icon = 'car',
                                        type = 'client',
                                        event = 'qb-Garages:client:putupvehicle',
                                        shouldClose = true
                                    }) 
                                else
                                    --print('notinveh')
                                    exports['qb-radialmenu']:AddOption(5, {
                                        id = 'open_garage_menu',
                                        title = 'Open Garage Menu',
                                        icon = 'car',
                                        type = 'client',
                                        event = 'qb-Garages:client:openmenu',
                                        shouldClose = true
                                    })
                                end
                            elseif garages.type == 'depot' then
                                exports['qb-radialmenu']:AddOption(5, {
                                    id = 'open_garage_menu',
                                    title = 'Open Impound Lot Menu',
                                    icon = 'car',
                                    type = 'client',
                                    event = 'qb-Garages:client:openmenu',
                                    shouldClose = true,
                                })
                            end
                        end
                    end
                    Wait(1000)
                end
                exports['qb-radialmenu']:RemoveOption(5)
            end)
        else
            insideZones[name] = false
        end 
    end)
end


for name, garage in pairs(PolyGarages) do
    if (garage.type == 'public' or garage.type == 'depot' or garage.type == 'job') and garage.vehicle == 'car' then
        createGarageZones(garage['Zone']['Shape'], name)
    end
end

RegisterNetEvent('qb-Garages:client:openmenu', function ()
        PublicGarage()
end)

local function CheckPlayers(vehicle, garage)
    for i = -1, 5, 1 do
        local seat = GetPedInVehicleSeat(vehicle, i)
        if seat then
            TaskLeaveVehicle(seat, vehicle, 0)
            if garage then
                SetEntityCoords(seat, garage.blipcoords.x, garage.blipcoords.y, garage.blipcoords.z)
            end
        end
    end
    SetVehicleDoorsLocked(vehicle)
    Wait(1500)
    QBCore.Functions.DeleteVehicle(vehicle)
end

local function enterVehicle(veh, indexgarage, type, garage)
    local plate = QBCore.Functions.GetPlate(veh)
    QBCore.Functions.TriggerCallback('qb-garage:server:checkOwnership', function(owned)
        if owned then
            local bodyDamage = math.ceil(GetVehicleBodyHealth(veh))
            local engineDamage = math.ceil(GetVehicleEngineHealth(veh))
            local totalFuel = exports['LegacyFuel']:GetFuel(veh)
            local vehProperties = QBCore.Functions.GetVehicleProperties(veh)
            TriggerServerEvent('qb-garage:server:updateVehicle', 1, totalFuel, engineDamage, bodyDamage, plate, indexgarage)
            CheckPlayers(veh, garage)
            if plate then
                OutsideVehicles[plate] = nil
                TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
            end
            QBCore.Functions.Notify(Lang:t("success.vehicle_parked"), "primary", 4500)
        else
            QBCore.Functions.Notify(Lang:t("error.not_owned"), "error", 3500)
        end
    end, plate, type, indexgarage--[[, PlayerGang.name]])
end

RegisterNetEvent('qb-Garages:client:putupvehicle', function ()
    local ped = PlayerPedId()
    local curVeh = GetVehiclePedIsIn(ped)
    local vehClass = GetVehicleClass(curVeh)
    for index, garage in pairs(PolyGarages) do

        if garage.vehicle == 'car' or not garage.vehicle then
            if vehClass ~=14 and vehClass ~= 15 and vehClass ~= 16 then
                if index == getGarageInsideOf() then
                   local index = getGarageInsideOf()
                    enterVehicle(curVeh, index, garage.type)
                end
                --enterVehicle(curVeh, index, garage.type)
            end
        end
    end
end)
function PublicGarage()
    for index, garage in pairs(PolyGarages) do
        if index == getGarageInsideOf() then
            exports['qb-menu']:openMenu({
                {
                    header = garage.label,
                    isMenuHeader = true,
        
                },
                {
                    header = Lang:t("menu.text.vehicles"),
                    txt = Lang:t("menu.text.vehicles"),
                    params = {
                        event = "qb-garages:client:VehicleList",
                        args = {
                            type = garage.type,
                            garage = garage,
                            index = index
                        }
                    }
                },
                {
                    header = Lang:t("menu.leave.car"),
                    txt = "",
                    params = {
                        event = 'qb-menu:closeMenu'
                    }
                },
            })
        end
    end
end

CreateThread(function()
    for _, garage in pairs(PolyGarages) do
        if garage.showBlip then
            local Garage = AddBlipForCoord(garage.blipcoords.x, garage.blipcoords.y, garage.blipcoords.z)
            SetBlipSprite (Garage, garage.blipNumber)
            SetBlipDisplay(Garage, 4)
            SetBlipScale  (Garage, 0.60)
            SetBlipAsShortRange(Garage, true)
            SetBlipColour(Garage, 3)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(garage.blipName)
            EndTextCommandSetBlipName(Garage)
        end
    end
end)