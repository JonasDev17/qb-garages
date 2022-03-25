local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local PlayerGang = {}
local PlayerJob = {}
local currentHouseGarage = nil
local OutsideVehicles = {}
local currentGarage = nil
local garagePoly = {}
local menuItemId = nil

--Menus
function PublicGarage()
    exports['qb-menu']:openMenu({
        {
            header = currentGarage.label,
            isMenuHeader = true,
        },
        {
            header = Lang:t("menu.text.vehicles"),
            txt = Lang:t("menu.text.vehicles"),
            params = {
                event = "qb-garages:client:PublicGarage",
                args = {
                    type = currentGarage.type,
                    garage = currentGarage,
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

local function MenuHouseGarage(house)
    exports['qb-menu']:openMenu({
        {
            header = "House Garage",
            isMenuHeader = true
        },
        {
            header = Lang:t("menu.text.vehicles"),
            txt = Lang:t("menu.text.vehicles"),
            params = {
                event = "qb-garages:client:HouseGarage",
                args = house
            }
        },
        {
            header = Lang:t("menu.leave.car"),
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function ClearMenu()
	TriggerEvent("qb-menu:closeMenu")
end

local function closeMenuFull()
    ClearMenu()
end

-- Functions

local function doCarDamage(currentVehicle, veh)
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0

    Wait(100)
    if body < 900.0 then
		SmashVehicleWindow(currentVehicle, 0)
		SmashVehicleWindow(currentVehicle, 1)
		SmashVehicleWindow(currentVehicle, 2)
		SmashVehicleWindow(currentVehicle, 3)
		SmashVehicleWindow(currentVehicle, 4)
		SmashVehicleWindow(currentVehicle, 5)
		SmashVehicleWindow(currentVehicle, 6)
		SmashVehicleWindow(currentVehicle, 7)
	end
	if body < 800.0 then
		SetVehicleDoorBroken(currentVehicle, 0, true)
		SetVehicleDoorBroken(currentVehicle, 1, true)
		SetVehicleDoorBroken(currentVehicle, 2, true)
		SetVehicleDoorBroken(currentVehicle, 3, true)
		SetVehicleDoorBroken(currentVehicle, 4, true)
		SetVehicleDoorBroken(currentVehicle, 5, true)
		SetVehicleDoorBroken(currentVehicle, 6, true)
	end
	if engine < 700.0 then
		SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
	end
	if engine < 500.0 then
		SetVehicleTyreBurst(currentVehicle, 0, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 5, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 6, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 7, false, 990.0)
	end
    SetVehicleEngineHealth(currentVehicle, engine)
    SetVehicleBodyHealth(currentVehicle, body)

end

local function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function ExitAndDeleteVehicle(vehicle)
    for i = -1, 5, 1 do
        local ped = GetPedInVehicleSeat(vehicle, i)
        if ped then
            TaskLeaveVehicle(ped, vehicle, 0)
        end
    end
    SetVehicleDoorsLocked(vehicle)
    Wait(1500)
    QBCore.Functions.DeleteVehicle(vehicle)
end

local function canParkVehicle(veh)
    if currentGarage['ParkingSpots'] ~= nil then
        local closestDistance = -1
        for i,v in ipairs(currentGarage['ParkingSpots'] ) do
            local vehCoords = GetEntityCoords(veh, 0)
            local distance = Vdist(v["x"], v["y"], v["z"], vehCoords["x"], vehCoords["y"], vehCoords["z"])
            if(closestDistance == -1 or closestDistance > distance) then
                closestDistance = distance
            end
        end
        if closestDistance >= 2.0 then
            QBCore.Functions.Notify("Please park on a parking lot...", "error", 4500)
            return false
        else
            return true
        end
    else
        return true
    end
end

local function parkVehicle(veh, type)
    local plate = exports['zx-fakeplate']:GetRealPlate(QBCore.Functions.GetPlate(veh))
    QBCore.Functions.TriggerCallback('qb-garage:server:checkOwnership', function(owned)
        if owned then
            local bodyDamage = math.ceil(GetVehicleBodyHealth(veh))
            local engineDamage = math.ceil(GetVehicleEngineHealth(veh))
            
            local totalFuel = 0
            
            if FuelScript then
                totalFuel = exports[FuelScript]:GetFuel(veh)
            else
                totalFuel = exports['LegacyFuel']:GetFuel(veh)
            end

            if not canParkVehicle(veh) then return end
            TriggerServerEvent('qb-garage:server:updateVehicle', 1, totalFuel, engineDamage, bodyDamage, plate, currentGarage.name)
            ExitAndDeleteVehicle(veh)
            if plate then
                OutsideVehicles[plate] = nil
                TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
            end
            QBCore.Functions.Notify(Lang:t("success.vehicle_parked"), "primary", 4500)
        else
            QBCore.Functions.Notify(Lang:t("error.not_owned"), "error", 3500)
        end
    end, plate, type)
end

local function createGarageZone(zone, garage)
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then       
            currentGarage = garage
            exports['qb-core']:DrawText(garage['drawText'],'left')
        else
            currentGarage = nil
            if menuItemId ~= nil then
                exports['qb-radialmenu']:RemoveOption(menuItemId)
                menuItemId = nil
            end
            exports['qb-core']:HideText()
        end
    end)
end

local function createGaragePolyZone(garage)
    local zone = PolyZone:Create(garage['Zone']['Shape'], {
        name = garage.name,
        minZ = garage['Zone']['minZ'],
        maxZ = garage['Zone']['maxZ'],
        debugPoly = garage.debug
    })
   createGarageZone(zone, garage)
end

local function createGarageBoxZone(house, coords, debugPoly)
    local pos = vector3(coords.x, coords.y, coords.z)
    return BoxZone:Create(pos,5,3.5, {
        name = house,
        offset = {0.0, 0.0, 0.0},
        debugPoly = debugPoly,
        heading = coords.h,
        minZ = pos.z - 1.0,
        maxZ = pos.z + 1.0,
    })
end

local function registerHousePoly(house)
    if garagePoly[house] then return end
    local coords = HouseGarages[house].takeVehicle
    if not coords or not coords.x then return end
    local zone = createGarageBoxZone(house, coords, true)
    garagePoly[house] = {
        Polyzone = zone,
        coords = coords,
    }
    zone:onPlayerInOut(function(isPpointInside)
        print(isPpointInside)
        if isPpointInside then
            currentHouseGarage = house
            exports['qb-core']:DrawText(HouseParkingDrawText,'left')
        else
            exports['qb-core']:HideText()
            if menuItemId ~= nil then
                exports['qb-radialmenu']:RemoveOption(menuItemId)
                menuItemId = nil
            end
            currentHouseGarage = nil
        end
    end)
end

-- Events

RegisterNetEvent("qb-garages:client:PublicGarage", function(data)
    local type = data.type
    local garage = data.garage
    local header
    local leave 
    header = Lang:t("menu.header."..type.."_"..garage.vehicle, {value = garage.label})
    leave = Lang:t("menu.leave."..garage.vehicle)

    QBCore.Functions.TriggerCallback("qb-garage:server:GetGarageVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify(Lang:t("error.no_vehicles"), "error", 5000)
        else
            local MenuGarageOptions = {
                {
                    header = header,
                    isMenuHeader = true
                },
            }
            for k, v in pairs(result) do
                local enginePercent = round(v.engine / 10, 0)
                local bodyPercent = round(v.body / 10, 0)
                local currentFuel = v.fuel
                local vname = QBCore.Shared.Vehicles[v.vehicle].name

                if v.state == 0 then
                    v.state = Lang:t("status.out")
                elseif v.state == 1 then
                    v.state = Lang:t("status.garaged")
                elseif v.state == 2 then
                    v.state = Lang:t("status.impound")
                end
                if type == "depot" then
                    MenuGarageOptions[#MenuGarageOptions+1] = {
                        header = Lang:t('menu.header.depot', {value = vname, value2 = v.depotprice}),
                        txt = Lang:t('menu.text.depot', {value = v.plate, value2 = currentFuel, value3 = enginePercent, value4 = bodyPercent}),
                        params = {
                            event = "qb-garages:client:TakeOutDepot",
                            args = {
                                vehicle = v,
                                type = type,
                                garage = garage,
                            }
                        }
                    }
                else
                    MenuGarageOptions[#MenuGarageOptions+1] = {
                        header = Lang:t('menu.header.garage', {value = vname, value2 = v.plate}),
                        txt = Lang:t('menu.text.garage', {value = v.state, value2 = currentFuel, value3 = enginePercent, value4 = bodyPercent}),
                        params = {
                            event = "qb-garages:client:takeOutGarage",
                            args = {
                                vehicle = v,
                                type = type,
                                garage = garage,
                            }
                        }
                    }
                end
            end

            MenuGarageOptions[#MenuGarageOptions+1] = {
                header = leave,
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuGarageOptions)
        end
    end, garage.name, type, garage.vehicle)
end)

RegisterNetEvent('qb-garages:client:takeOutGarage', function(data)
    local type = data.type
    local vehicle = data.vehicle
    local garage = data.garage
    local spawn = false

    if type == "depot" then         --If depot, check if vehicle is not already spawned on the map
        local VehExists = DoesEntityExist(OutsideVehicles[vehicle.plate])        
        if not VehExists then
            spawn = true
        else
            QBCore.Functions.Notify(Lang:t("error.not_impound"), "error", 5000)
            spawn = false
        end
    else
        spawn = true
    end
    if spawn then
        local location
        local heading
        if type == "house" then
            location = garage.takeVehicle
            heading = garage.takeVehicle.w
        else
            if garage['ParkingSpots'] ~= nil then
                local closestDistance = -1
                local closestIndex = -1
                for i,v in ipairs(garage['ParkingSpots'] ) do
                    local plyCoords = GetEntityCoords(PlayerPedId(), 0)
                    local distance = Vdist(v["x"], v["y"], v["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
                    if(closestDistance == -1 or closestDistance > distance) then
                        closestDistance = distance
                        closestIndex = i
                    end
                end
                if closestDistance >= 4.5 then
                    return
                else
                    local spot = garage['ParkingSpots'][closestIndex]
                    location = vector4(spot["x"], spot["y"], spot["z"], spot["w"])
                    heading = spot['w']
                end
            else
                local ped = GetEntityCoords(PlayerPedId())
                local pedheadin = GetEntityHeading(PlayerPedId())
                local forward = GetEntityForwardVector(PlayerPedId())
                local x, y, z = table.unpack(ped + forward * 3)
                location = vector3(x, y, z)
                if VehicleHeading == 'forward' then
                    heading = pedheadin
                elseif VehicleHeading == 'driverside' then
                    heading = pedheadin + 90
                elseif VehicleHeading == 'hood' then
                    heading = pedheadin + 180
                elseif VehicleHeading == 'passengerside' then
                    heading = pedheadin + 270
                end
            end
        end

        local veh = GetClosestVehicle(location.x, location.y, location.z, 1.0, 0, 70)
        if veh ~= 0 then
            QBCore.Functions.Notify("Parkinglot occupied", "error", 4500)
            do return end
        end
        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                if vehicle.plate then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end
                
                QBCore.Functions.SetVehicleProperties(veh, properties)
                SetVehicleNumberPlateText(veh, exports['zx-fakeplate']:GetFakePlate(vehicle.plate))
                SetEntityHeading(veh, heading)
               
                if FuelScript then
                    exports[FuelScript]:SetFuel(veh, vehicle.fuel)
                else
                    exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                end

                doCarDamage(veh, vehicle)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                closeMenuFull()
                if WarpPlayerIntoVehicle or type == 'house' or type == 'gang' or vehicle == 'air' or vehicle == 'sea' then
                   TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) 
                end
                TriggerEvent("vehiclekeys:client:SetOwner", exports['zx-fakeplate']:GetRealPlate(QBCore.Functions.GetPlate(veh)))
                SetVehicleEngineOn(veh, true, true)
            end, exports['zx-fakeplate']:GetRealPlate(vehicle.plate))
    
        end, location, true)
    end
end)

RegisterNetEvent('qb-garages:client:TakeOutHouseGarage', function(vehicleToSpawn)
    if vehicleToSpawn.state == "Garaged" then
        QBCore.Functions.SpawnVehicle(vehicleToSpawn.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                QBCore.Functions.SetVehicleProperties(veh, properties)

                if vehicleToSpawn.plate then
                    OutsideVehicles[vehicleToSpawn.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                SetVehicleNumberPlateText(veh, vehicleToSpawn.plate)
                SetEntityHeading(veh, HouseGarages[currentHouseGarage].takeVehicle.h)

                if FuelScript then
                    exports[FuelScript]:SetFuel(veh, vehicleToSpawn.fuel)
                else
                    exports['LegacyFuel']:SetFuel(veh, vehicleToSpawn.fuel)
                end
                
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicleToSpawn)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicleToSpawn.plate, vehicleToSpawn.garage)
                closeMenuFull()
                TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                SetPedIntoVehicle(PlayerPedId(), veh, -1)
            end, vehicleToSpawn.plate)
        end, HouseGarages[currentHouseGarage].takeVehicle, true)
    end
end)

RegisterNetEvent('qb-radialmenu:client:onRadialmenuOpen', function()
    local Player = PlayerPedId()
    if currentGarage ~= nil then
        if currentGarage.type == 'job' then
            local job = currentGarage.job
            if PlayerJob.name == job then
                if IsPedInAnyVehicle(Player) then
                    menuItemId = exports['qb-radialmenu']:AddOption({
                        id = 'put_up_vehicle',
                        title = 'Park Vehicle',
                        icon = 'parking',
                        type = 'client',
                        event = 'qb-garages:client:parkvehicle',
                        shouldClose = true
                    }, menuItemId)
                else
                    menuItemId = exports['qb-radialmenu']:AddOption({
                        id = 'open_garage_menu',
                        title = 'Open Garage',
                        icon = 'warehouse',
                        type = 'client',
                        event = 'qb-garages:client:openmenu',
                        shouldClose = true
                    }, menuItemId)
                end
            end
        elseif currentGarage.type == 'gang' then
            local gang = currentGarage.gang
            if PlayerGang.name == gang then
                if IsPedInAnyVehicle(Player) then
                    menuItemId = exports['qb-radialmenu']:AddOption({
                        id = 'put_up_vehicle',
                        title = 'Park Vehicle',
                        icon = 'parking',
                        type = 'client',
                        event = 'qb-garages:client:parkvehicle',
                        shouldClose = true
                    }, menuItemId)
                else
                    menuItemId = exports['qb-radialmenu']:AddOption({
                        id = 'open_garage_menu',
                        title = 'Open Garage',
                        icon = 'warehouse',
                        type = 'client',
                        event = 'qb-garages:client:openmenu',
                        shouldClose = true
                    }, menuItemId)
                end
            end
        elseif currentGarage.type == 'public' then
            if IsPedInAnyVehicle(Player) then
                menuItemId = exports['qb-radialmenu']:AddOption({
                    id = 'put_up_vehicle',
                    title = 'Park Vehicle',
                    icon = 'parking',
                    type = 'client',
                    event = 'qb-garages:client:parkvehicle',
                    shouldClose = true
                }, menuItemId)
            else
                menuItemId = exports['qb-radialmenu']:AddOption({
                    id = 'open_garage_menu',
                    title = 'Open Garage',
                    icon = 'warehouse',
                    type = 'client',
                    event = 'qb-garages:client:openmenu',
                    shouldClose = true
                }, menuItemId)
            end
        elseif currentGarage.type == 'depot' then
            menuItemId = exports['qb-radialmenu']:AddOption({
                id = 'open_garage_menu',
                title = 'Open Impound Lot',
                icon = 'warehouse',
                type = 'client',
                event = 'qb-garages:client:openmenu',
                shouldClose = true,
            }, menuItemId)
        end
    elseif currentHouseGarage ~= nil then
        if not IsPedInAnyVehicle(PlayerPedId()) then
            menuItemId = exports['qb-radialmenu']:AddOption({
                id = currentHouseGarage,
                title = 'Open Garage',
                icon = 'warehouse',
                type = 'client',
                event = 'qb-garages:client:openHouseGarage',
                shouldClose = true
            }, menuItemId)
        elseif IsPedInAnyVehicle(PlayerPedId()) then
            menuItemId = exports['qb-radialmenu']:AddOption({
                id = currentHouseGarage,
                title = 'Park Vehicle',
                icon = 'parking',
                type = 'client',
                event = 'qb-garages:client:putGarageHouse',
                shouldClose = true
            }, menuItemId)
        end
    else
        if menuItemId ~= nil then 
            exports['qb-radialmenu']:RemoveOption(menuItemId)
            menuItemId = nil
        end
    end
end)

RegisterNetEvent('qb-garages:client:openmenu', function()
    PublicGarage()
end)

RegisterNetEvent('qb-garages:client:parkvehicle', function()
    local ped = PlayerPedId()
    local curVeh = GetVehiclePedIsIn(ped)
    local vehClass = GetVehicleClass(curVeh)
    if currentGarage.vehicle == 'car' or not currentGarage.vehicle then
        if vehClass ~=14 and vehClass ~= 15 and vehClass ~= 16 then
            parkVehicle(curVeh)
        end
    end
end)

RegisterNetEvent('qb-garages:client:TakeOutDepot', function(data)
    local vehicle = data.vehicle

    if vehicle.depotprice ~= 0 then
        TriggerServerEvent("qb-garage:server:PayDepotPrice", data)
    else
        TriggerEvent("qb-garages:client:takeOutGarage", data)
    end
end)

RegisterNetEvent("qb-garages:client:HouseGarage", function(house)
    house = house or currentHouseGarage
    if not house then return end
    QBCore.Functions.TriggerCallback("qb-garage:server:GetGarageVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify("You don't have any vehicles in your garage!", "error", 5000)
        else
            local MenuHouseGarageOptions = {
                {
                    header = "Garage: "..HouseGarages[house].label,
                    isMenuHeader = true
                },
            }

            for k, v in pairs(result) do
                local enginePercent = round(v.engine / 10, 0)
                local bodyPercent = round(v.body / 10, 0)
                local currentFuel = v.fuel
                local vname = QBCore.Shared.Vehicles[v.vehicle].name

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garaged"
                elseif v.state == 2 then
                    v.state = "Impounded By Police"
                end

                MenuHouseGarageOptions[#MenuHouseGarageOptions+1] = {
                    header = vname.." ["..v.plate.."]",
                    txt = "State: "..v.state.. "<br>Fuel: "..currentFuel.." | Engine: "..enginePercent.." | Body: "..bodyPercent,
                    params = {
                        event = "qb-garages:client:TakeOutHouseGarage",
                        args = v
                    }
                }
            end

            MenuHouseGarageOptions[#MenuHouseGarageOptions+1] = {
                header = "⬅ Leave Garage",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuHouseGarageOptions)
        end
    end, house, 'house')
end)



RegisterNetEvent('qb-garages:client:putGarageHouse', function()
    local ped = PlayerPedId()
    local curVeh = GetVehiclePedIsIn(ped)
    local plate = QBCore.Functions.GetPlate(curVeh)
    QBCore.Functions.TriggerCallback('qb-garage:server:checkOwnership', function(owned)
        if owned then
            local bodyDamage = round(GetVehicleBodyHealth(curVeh), 1)
            local engineDamage = round(GetVehicleEngineHealth(curVeh), 1)

            local totalFuel = 0
            if FuelScript then
                totalFuel = exports[FuelScript]:GetFuel(curVeh)
            else
                totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
            end

            local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
            ExitAndDeleteVehicle(curVeh)
            if DoesEntityExist(curVeh) then
                QBCore.Functions.Notify("Vehicle not stored, please check if is someone inside the car", "error", 4500)
            else
            TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, currentHouseGarage)
            TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, currentHouseGarage)
            TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
            QBCore.Functions.DeleteVehicle(curVeh)
            if plate then
                OutsideVehicles[plate] = veh
                TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
            end
            QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
        end
        else
            QBCore.Functions.Notify("You don't own this vehicle", "error", 3500)
        end

    end, plate, 'house', currentHouseGarage)
end)

RegisterNetEvent('qb-garages:client:openHouseGarage', function()
    QBCore.Functions.TriggerCallback('qb-houses:server:hasKey', function(hasKey)
        if hasKey then
            MenuHouseGarage(currentHouseGarage)
        else
            QBCore.Functions.Notify("You can't open this garage, you don't have the key.")
        end
    end, currentHouseGarage)
end)

RegisterNetEvent('qb-garages:client:houseGarageConfig', function(garageConfig)
    HouseGarages = garageConfig
    for house, _ in pairs(HouseGarages) do
        registerHousePoly(house)
    end
end)

RegisterNetEvent('qb-garages:client:addHouseGarage', function(house, garageInfo)
    HouseGarages[house] = garageInfo
    registerHousePoly(house)
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerGang = PlayerData.gang
    PlayerJob = PlayerData.job
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

-- Threads

CreateThread(function()
    for _, garage in pairs(Garages) do
        if garage.showBlip then
            local Garage = AddBlipForCoord(garage.blipcoords.x, garage.blipcoords.y, garage.blipcoords.z)
            SetBlipSprite(Garage, garage.blipNumber)
            SetBlipDisplay(Garage, 4)
            SetBlipScale(Garage, 0.60)
            SetBlipAsShortRange(Garage, true)
            SetBlipColour(Garage, 3) 
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(garage.blipName)
            EndTextCommandSetBlipName(Garage)
        end
    end
end)

CreateThread(function()
    for _, garage in pairs(Garages) do
        if(garage.type == 'public' or garage.type == 'depot' or garage.type == 'job') and garage.vehicle == 'car' then
            createGaragePolyZone(garage)
        end
    end
end)

-- TODO: remove when done making parking lots
Citizen.CreateThread(function()
    while true do
        for _, garage in pairs(Garages) do
            if garage['ParkingSpots'] ~= nil and garage['debug'] then
                for _, location in pairs(garage['ParkingSpots']) do
                    DrawMarker(2, location.x, location.y, location.z + 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                end
            end
        end
        Wait(0)
    end
end)