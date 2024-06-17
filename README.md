# qb-garages



**ATENTION: THIS SCRIPT USES THE LATEST VERSION OF THE [RADIALMENU](https://github.com/qbcore-framework/qb-radialmenu) AND [QB-CORE](https://github.com/qbcore-framework/qb-core)**

This is a qb-garages script that uses the radialmenu to retrieve and park vehicles.
Almost everything is fully customizable to the last bit!

**For screenshots scroll down**

## Dependencies
 - [qb-radialmenu](https://github.com/qbcore-framework/qb-radialmenu)
 - [qb-core](https://github.com/qbcore-framework/qb-core)

## Installation

Drag 'n Drop replace for qb-garages.

- Delete qb-garages.
- Drag the downloaded qb-garages folder into the [qb] folder.
- If you want to use the latest features, apply patch1.sql to your DB

## Features

* Public Garages
* House Garages
* Gang Garages
* Job Garages
* Depot Garages
* Blips and names
* Custom DrawText
* Water Garages
* Aircraft Garages

## Screenshots

![image](https://user-images.githubusercontent.com/25738474/161191185-5bfa6805-1e89-44ef-902a-11f60ed68ea8.png)

![image](https://user-images.githubusercontent.com/25738474/161191275-2ca930fe-5583-4caa-a159-0c239b404abe.png)

![image](https://user-images.githubusercontent.com/25738474/161191330-9270f95d-182f-4709-988a-ef13f0723ba5.png)

![image](https://user-images.githubusercontent.com/25738474/161191354-057ca8d9-ee6d-4f92-8dd7-657d3bf26274.png)

## Config Example

```
Everything that says optional can be omitted.
 -- GARAGE CONFIGURATION EXAMPLE :
    ['somegarage'] = {
        ['Zone'] = {
            ['Shape'] = { -- Create a polyzone by using '/pzcreate poly', '/pzadd' and '/pzfinish' or '/pzcancel' to cancel it. the newly created polyzone will be in txData/QBCoreFramework_******.base/polyzone_created_zones.txt
            vector2(-1030.4713134766, -3016.3388671875),
            vector2(-970.09686279296, -2914.7397460938),
            vector2(-948.322265625, -2927.9030761718),
            vector2(-950.47174072266, -2941.6584472656),
            vector2(-949.04180908204, -2953.9467773438),
            vector2(-940.78369140625, -2957.2941894532),
            vector2(-943.88732910156, -2964.5512695312),
            vector2(-897.61529541016, -2990.0505371094),
            vector2(-930.01025390625, -3046.0695800782),
            vector2(-942.36407470704, -3044.7858886718),
            vector2(-952.97467041016, -3056.5122070312),
            vector2(-957.11712646484, -3057.0900878906)
            },
            ['minZ'] = 12.5,  -- min height of the parking zone, cannot be the same as maxZ, and must be smaller than maxZ
            ['maxZ'] = 20.0,  -- max height of the parking zone
            -- VERY IMPORTANT: Make sure the parking zone is high enough - higher than the tallest vehicle and LOW ENOUGH / touches the ground (turn on debug to see)
        },
        label = 'Hangar', -- label displayed on phone
        type = 'public', -- 'public', 'job', 'depot' or 'gang'
        showBlip = true, -- optional, when not defined, defaults to false
        blipName = 'Police', -- otional
        blipNumber = 90, -- optional, numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipColor = 69, -- optional, defaults to 3 (Blue), numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipcoords = vector3(-972.66, -3005.4, 13.32), -- blip coordinates
        job = 'police', -- optional, everyone can use it when not defined
        vehicleCategories = {'helicopter', 'plane'}, -- categories defined in VehicleCategories
        drawText = 'Hangar', -- the drawtext text, shown when entering the polyzone of that garage
        ParkingDistance = 10.0 -- Optional ParkingDistance, to override the global ParkingDistance
        SpawnDistance = 5.0 -- Optional SpawnDistance, to override the global SpawnDistance
        debug = false -- Optional, will show the polyzone and the parking spots, helpful when creating new garages. If too many garages are set to debug, it will not show all parking lots
        ExitWarpLocations: { -- Optional, Used for e.g. Boat parking, to teleport the player out of the boat to the closest location defined in the list. 
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        } 
    },
```

### parking vehicle using target
```
local garageName = 'pdgarage'
    exports['qb-target']:AddBoxZone(garageName, vector3(469.51, -992.35, 26.27), 0.2, 0.2, {
        name = garageName,
        debugPoly = true,
        minZ = 26.80,
        maxZ = 27.10,
    }, {
        options = {
            {
                type = "client",
                action = function ()
                    TriggerEvent('qb-garages:client:ParkLastVehicle', garageName)
                end,
                icon = 'parking',
                label = 'Park Vehicle',
            },
        },
        distance = 3
    })
```

## Credits

* [ARSSANTO](https://github.com/ARSSANTO) - For making code style suggestions and helping me improve the performance.
* [JustLazzy](https://github.com/JustLazzy) - I used part of his qb-garages script.
* [bamablood94](https://github.com/bamablood94) - I used part of his qb-garages script.
* [QBCore Devs](https://github.com/qbcore-framework/) - For making an awesome framework and enabling me to do this.
* QBCore Community - Thank you so much for everyone who's been testing this!

## Support

Join my Discord server: https://discord.gg/pqcug3XSQx

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

