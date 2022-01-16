# qb-garages

**Public Depot**
* Park owned cars in public garages. Configure the garages on config.lua.

![image](https://user-images.githubusercontent.com/82112471/149678987-02ec660f-76c9-4414-af7b-bac284ed58b7.png)

![image](https://user-images.githubusercontent.com/82112471/149678977-2a574ee9-8ecc-494f-a845-e17281a74594.png)



**House Garages**
* Park owned cars in house garages. To add a house garage, you must have the realestate job and do /addgarage.

**Gang Garages**
* Allows for gangs to have their own garages. Configure the garages on config.lua.

**Job Garages**
* Allows jobs to have garage specific. Configure the garages on config.lua.

**Depot Garages**
* Allows depot cars to be retreived from here. Cops can do /depot [price] to send a car to the depot. Configure the garages on config.lua.

**Auto Respawn Config**
* If set to true, cars that are currently outside will be placed in the depot.

**Common Error Messages**
* "Vehicle not owned" - You can only parks vehicles that you own (needs to be in the database). 

**OPTIONAL** qb-target by Berkie - https://github.com/BerkieBb/qb-targe
* If using qb-target, here's some triggers you can use to open the public garage and depot. (Make sure to add the following code to client.lua)


# Public Garage Trigger
    RegisterNetEvent('qb-garages:client:menuGarage', function() 
    local pos = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Garages) do
        local takeDist = #(pos - vector3(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z))
        if takeDist <= 15 then
            MenuGarage()
            currentGarage = k
        end
    end
    end)

# Depot Garage Trigger
    RegisterNetEvent('qb-garages:client:menuDepot', function() 
    local pos = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Depots) do
        local depottakeDist = #(pos - vector3(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z))
        if depottakeDist <= 15 then
            MenuDepot()
            currentGarage = k
        end
    end
    end)



# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>
