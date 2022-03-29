--[[
    Author: JDev17#8160
    TRANSLATION: 
        To create a new translation file, copy an existing one and rename it to e.g. es (spanish), then translate it and change the imported file in the fxmanifest under shared_scripts.
    GARAGE CONFIGURATION EXAMPLE:
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
            -- Important: Make sure the parking zone is high enoug - higher than the tallest vehicle and touches the ground (turn on debug to see)
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
        debug = false -- will show the polyzone and the parking spots, helpful when creating new garages. If too many garages are set to debug, it will not show all parking lots
        ExitWarpLocations: { -- Optional, Used for e.g. Boat parking, to teleport the player out of the boat to the closest location defined in the list. 
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        } 
    },
]]



FuelScript = 'LegacyFuel' -- change to lj-fuel if you use lj-fuel or something else if you use any other LegcyFuel compatible script
-- AutoRespawn defaults to true and changing it to false does not work, will be fixed in a future update: AutoRespawn = true --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
SharedGarages = false   --True == Gang and job garages are shared, false == Gang and Job garages are personal
WarpPlayerIntoVehicle = false -- True == Will Warp Player Into their vehicle after pulling it out of garage. False It will spawn on the parking lot / in front of them  (Global, can be overriden by each garage)
HouseParkingDrawText = 'Parking' -- text when driving on to the HOUSE parking lot
ParkingDistance = 2.0 -- Distance to the parking lot when trying to park the vehicle  (Global, can be overriden by each garage)
SpawnDistance = 4.5 -- The maximum distance you can be from a parking spot, to spawn a car (Global, can be overriden by each garage)
DepotPrice = 60.0 -- The price to take out a despawned vehicle from impound.
DrawTextPosition = 'left' -- location of drawtext: left, top, right

-- Here you can define which category contains which vehicle class. These categories can then be used in the garage config
-- All vehicle classes can be found here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
VehicleCategories = {
    ['car'] = {0,1,2,3,4,5,6,7,9,10,11,12},
    ['motorcycle'] = {8},
    ['boat'] = {14},
    ['helicopter'] = {15},
    ['plane'] = {16},
    ['service'] = {17},
    ['emergency'] = {18},
    ['other'] = {13} -- cycles: 13 - you can move cycles to cars if you want and have anything else like military vehicles in this category
    -- you can also create new / delete or update categories, and use them below in the config. 
}

HouseGarageCategories = {'car', 'motorcycle', 'other'} -- Which categories are allowed to be parked at a house garage


VehicleHeading = 'driverside' -- only used when NO parking spots are defined in the garage config
--[[^^^^^^^^
    'forward' = will face the sameway as the ped
    'driverside' = will put the driver door closets to the ped
    'hood' = will face the hood towards ped
    'passengerside' = will put the passenger door closets to the ped
]]

SharedJobGarages = { -- define the job garages which are shared
    --'pdgarage',
}

Garages = {
    --[[
        types:
        - public
        - job
        - depot
        vehicleCategories:
        - car
        - motorcycle
        - boat
        - helicopter
        - plane
        - other
    ]]
    ['motelgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(266.04238891602, -348.67025756836),
                vector2(285.89639282227, -356.23840332031),
                vector2(287.69180297852, -351.80249023438),
                vector2(294.92953491211, -354.30316162109),
                vector2(304.30255126953, -329.3703918457),
                vector2(268.12475585938, -316.15463256836),
                vector2(261.09896850586, -334.95642089844),
                vector2(268.07708740234, -337.50454711914),
                vector2(266.080078125, -343.24353027344),
                vector2(267.49453735352, -344.12811279297)
            },
            ['minZ'] = 43.74,  -- min height of the parking zone
            ['maxZ'] = 53.74,  -- max height of the parking zone
        },
        label = 'Motel Parking',
        showBlip = true,
        blipcoords = vector3(273.43, -343.99, 44.91),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public', -- public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Motel Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(277.62, -340.01, 44.5, 70.08),
            vector4(284.0, -342.32, 44.5, 70.09),
            vector4(278.33, -336.51, 44.49, 70.34),
            vector4(284.94, -338.87, 44.5, 70.28),
            vector4(285.3, -335.65, 44.5, 70.49),
            vector4(286.94, -332.56, 44.5, 67.79),
            vector4(288.56, -329.41, 44.5, 69.87),
            vector4(289.54, -325.98, 44.5, 70.81),
            vector4(300.23, -330.3, 44.5, 69.25),
            vector4(298.52, -333.09, 44.5, 69.25),
            vector4(298.66, -337.07, 44.5, 67.98),
            vector4(297.0, -340.11, 44.49, 69.9),
            vector4(296.05, -342.85, 44.49, 68.75),
            vector4(294.61, -346.22, 44.5, 67.07),
            vector4(292.54, -349.49, 44.52, 68.4),
            vector4(268.42, -325.58, 44.5, 249.47),
            vector4(267.58, -329.12, 44.49, 247.62),
            vector4(266.03, -332.22, 44.5, 247.32),
            vector4(271.12, -319.16, 44.5, 67.31),
            vector4(283.0, -323.71, 44.5, 73.83),
            vector4(281.99, -326.86, 44.5, 69.26),
            vector4(281.1, -330.43, 44.49, 71.55),
            vector4(279.59, -333.68, 44.5, 71.98),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },
    ['apartments'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-363.8267211914, -862.93182373046),
                vector2(-268.29055786132, -885.1919555664),
                vector2(-282.65710449218, -925.12030029296),
                vector2(-298.25598144532, -919.4287109375),
                vector2(-302.71203613282, -930.14245605468),
                vector2(-297.5908203125, -932.38952636718),
                vector2(-310.84530639648, -969.61614990234),
                vector2(-289.9221496582, -977.25311279296),
                vector2(-296.0697631836, -994.66876220704),
                vector2(-364.01559448242, -969.91552734375)
            },
            ['minZ'] = 28.74,  -- min height of the parking zone
            ['maxZ'] = 38.74,  -- max height of the parking zone
        },
        label = 'Apartments Parking',
        showBlip = true,
        blipcoords = vector3(-297.87, -990.49, 31.08),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public', -- public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Apartments Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-297.71, -990.11, 30.76, 338.79),
            vector4(-301.09, -988.82, 30.76, 339.11),
            vector4(-304.64, -987.72, 30.76, 339.36),
            vector4(-308.09, -986.34, 30.76, 339.47),
            vector4(-311.46, -985.08, 30.76, 339.5),
            vector4(-315.07, -983.98, 30.76, 339.18),
            vector4(-318.71, -982.49, 30.76, 338.43),
            vector4(-277.33, -890.09, 30.75, 339.58),
            vector4(-285.76, -888.04, 30.76, 168.44),
            vector4(-289.39, -887.34, 30.76, 168.59),
            vector4(-292.99, -886.36, 30.76, 167.4),
            vector4(-296.78, -885.82, 30.75, 167.93),
            vector4(-300.35, -885.14, 30.76, 167.76),
            vector4(-303.82, -884.06, 30.76, 167.76),
            vector4(-307.59, -883.44, 30.76, 167.24),
            vector4(-311.16, -882.7, 30.76, 166.92),
            vector4(-314.74, -881.99, 30.75, 166.91),
            vector4(-318.34, -881.19, 30.75, 167.5),
            vector4(-322.02, -880.47, 30.75, 167.75),
            vector4(-325.62, -879.65, 30.75, 168.31),
            vector4(-329.11, -878.9, 30.75, 168.35),
            vector4(-332.88, -878.22, 30.75, 167.35),
            vector4(-336.55, -877.38, 30.75, 168.02),
            vector4(-340.1, -876.67, 30.75, 167.45),
            vector4(-343.78, -875.91, 30.75, 167.01),
            vector4(-352.86, -874.08, 30.75, 0.76),
            vector4(-360.26, -889.43, 30.75, 269.23),
            vector4(-360.46, -893.17, 30.75, 268.23),
            vector4(-360.24, -896.83, 30.75, 270.26),
            vector4(-360.37, -900.58, 30.75, 268.61),
            vector4(-360.29, -904.27, 30.75, 269.75),
            vector4(-360.14, -908.01, 30.75, 270.4),
            vector4(-360.5, -911.66, 30.76, 269.55),
            vector4(-360.12, -915.4, 30.76, 269.63),
            vector4(-360.28, -919.07, 30.76, 270.11),
            vector4(-360.56, -922.77, 30.75, 268.41),
            vector4(-360.46, -926.49, 30.76, 270.43),
            vector4(-360.37, -930.12, 30.76, 269.72),
            vector4(-360.22, -933.88, 30.76, 270.34),
            vector4(-360.28, -937.58, 30.76, 269.99),
            vector4(-360.47, -941.31, 30.75, 269.54),
            vector4(-360.28, -944.99, 30.76, 270.14),
            vector4(-360.32, -948.72, 30.76, 269.82),
            vector4(-360.38, -952.44, 30.75, 269.95),
            vector4(-360.57, -956.16, 30.76, 270.31),
            vector4(-322.02, -981.29, 30.76, 339.92),
            vector4(-325.56, -980.1, 30.76, 340.1),
            vector4(-329.0, -978.69, 30.76, 338.49),
            vector4(-332.49, -977.59, 30.76, 339.58),
            vector4(-335.9, -976.3, 30.76, 339.7),
            vector4(-339.43, -975.08, 30.76, 339.47),
            vector4(-342.7, -973.45, 30.76, 338.85),
            vector4(-326.58, -956.4, 30.75, 250.37),
            vector4(-325.37, -952.84, 30.76, 250.47),
            vector4(-324.03, -949.43, 30.76, 250.37),
            vector4(-322.69, -945.96, 30.75, 249.91),
            vector4(-321.47, -942.43, 30.76, 250.29),
            vector4(-320.23, -939.06, 30.76, 250.38),
            vector4(-318.8, -935.56, 30.76, 249.46),
            vector4(-317.66, -932.03, 30.76, 250.73),
            vector4(-316.5, -928.43, 30.76, 250.15),
            vector4(-345.07, -932.2, 30.76, 69.27),
            vector4(-343.99, -928.61, 30.76, 70.11),
            vector4(-342.58, -925.18, 30.76, 70.69),
            vector4(-341.39, -921.67, 30.76, 69.83),
            vector4(-327.34, -924.44, 30.76, 69.82),
            vector4(-328.81, -927.89, 30.76, 69.43),
            vector4(-330.09, -931.33, 30.76, 70.81),
            vector4(-331.29, -934.83, 30.76, 70.29),
            vector4(-332.71, -938.34, 30.76, 69.75),
            vector4(-333.91, -941.81, 30.76, 69.46),
            vector4(-335.02, -945.3, 30.75, 71.24),
            vector4(-336.56, -948.74, 30.75, 70.65),
            vector4(-337.69, -952.22, 30.76, 70.31),
            vector4(-340.74, -902.45, 30.75, 167.89),
            vector4(-337.18, -903.24, 30.75, 167.65),
            vector4(-333.64, -903.98, 30.75, 167.05),
            vector4(-329.93, -904.61, 30.75, 167.95),
            vector4(-326.38, -905.62, 30.75, 168.51),
            vector4(-322.65, -906.2, 30.75, 167.96),
            vector4(-318.98, -906.94, 30.75, 168.06),
            vector4(-315.39, -907.89, 30.75, 166.81),
            vector4(-311.81, -908.81, 30.75, 167.5),
            vector4(-308.14, -909.33, 30.75, 167.34),
            vector4(-285.56, -921.9, 30.76, 70.14),
            vector4(-283.75, -918.52, 30.76, 70.23),
            vector4(-282.97, -914.81, 30.75, 69.93),
            vector4(-281.65, -911.4, 30.76, 69.49),
            vector4(-280.5, -908.04, 30.76, 69.51),
            vector4(-279.28, -904.45, 30.76, 70.18),
            vector4(-302.07, -933.44, 30.75, 69.9),
            vector4(-303.19, -937.09, 30.76, 70.71),
            vector4(-304.56, -940.34, 30.76, 70.04),
            vector4(-305.74, -943.95, 30.76, 70.49),
            vector4(-307.19, -947.34, 30.76, 69.04),
            vector4(-308.26, -950.95, 30.76, 70.24),
            vector4(-309.63, -954.35, 30.76, 68.9),
            vector4(-310.83, -957.88, 30.76, 69.56),
            vector4(-312.07, -961.38, 30.76, 70.21),
            vector4(-313.39, -964.8, 30.76, 68.92),
            vector4(-298.26, -899.82, 30.66, 346.23),
            vector4(-302.47, -898.86, 30.66, 348.7),
            vector4(-305.9, -898.52, 30.66, 351.35),
            vector4(-309.58, -897.38, 30.66, 347.24),
            vector4(-313.04, -896.37, 30.65, 349.98),
            vector4(-316.74, -895.46, 30.65, 347.83),
            vector4(-320.36, -894.95, 30.65, 348.97),
            vector4(-324.05, -893.86, 30.65, 348.71),
            vector4(-327.67, -893.18, 30.65, 347.61),
            vector4(-331.02, -892.69, 30.65, 346.03),
            vector4(-334.83, -891.72, 30.65, 350.2),
            vector4(-338.6, -891.08, 30.65, 348.34),
        }
    },
    ['delperroparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1473.0787353516, -487.65484619141),
                vector2(-1504.7054443359, -508.6481628418),
                vector2(-1492.2734375, -528.69299316406),
                vector2(-1489.1231689453, -526.95556640625),
                vector2(-1483.6931152344, -523.26513671875),
                vector2(-1483.6533203125, -521.71868896484),
                vector2(-1480.75, -519.44073486328),
                vector2(-1481.3087158203, -518.32086181641),
                vector2(-1462.0318603516, -504.92568969727),
                vector2(-1464.5360107422, -500.98297119141),
                vector2(-1469.4757080078, -492.97305297852)
            },
            ['minZ'] = 31.0,  -- min height of the parking zone
            ['maxZ'] = 38.0,  -- max height of the parking zone
        },
        label = 'Del Perro Parking',
        showBlip = true,
        blipcoords = vector3(-1479.26, -504.38, 32.81),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public', -- public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Del Perro Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1500.46, -510.03, 32.16, 212.86),
            vector4(-1498.39, -508.06, 32.16, 215.61),
            vector4(-1495.79, -506.34, 32.16, 214.65),
            vector4(-1492.92, -504.77, 32.16, 214.71),
            vector4(-1490.73, -502.89, 32.16, 212.83),
            vector4(-1487.66, -501.28, 32.17, 211.0),
            vector4(-1485.18, -499.76, 32.16, 213.74),
            vector4(-1482.26, -498.91, 32.17, 214.13),
            vector4(-1479.94, -496.28, 32.16, 210.7),
            vector4(-1477.39, -494.84, 32.17, 212.94),
            vector4(-1475.15, -492.91, 32.16, 214.35),
            vector4(-1467.25, -504.98, 32.16, 33.43),
            vector4(-1470.56, -505.55, 32.16, 34.86),
            vector4(-1472.41, -508.02, 32.17, 33.46),
            vector4(-1475.25, -509.71, 32.17, 35.7),
            vector4(-1477.52, -511.4, 32.17, 35.77),
            vector4(-1479.73, -513.37, 32.16, 36.04),
            vector4(-1482.77, -515.29, 32.16, 32.89),
            vector4(-1484.26, -518.38, 32.16, 36.23),
            vector4(-1487.34, -522.49, 32.17, 35.68),
            vector4(-1489.89, -523.84, 32.17, 34.06),
        }
    },
    ['lagunapi'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(358.69207763672, 302.30017089844),
                vector2(351.44546508789, 277.92486572266),
                vector2(355.01831054688, 277.03842163086),
                vector2(353.3766784668, 270.50997924805),
                vector2(387.72875976562, 257.78961181641),
                vector2(399.73132324219, 290.71780395508),
                vector2(364.49926757812, 300.54202270508),
                vector2(362.70568847656, 295.12139892578),
                vector2(359.67681884766, 296.56146240234),
                vector2(361.49871826172, 301.58950805664)
            },
            ['minZ'] = 102.00,  -- min height of the parking zone
            ['maxZ'] = 112.0,  -- max height of the parking zone
        },
        label = 'Laguna Parking',
        showBlip = true,
        blipcoords = vector3(380.72, 292.53, 103.16),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Laguna Parking', 
        debug = false,
        ['ParkingSpots'] = {
            vector4(359.53, 270.99, 102.65, 341.37),
            vector4(363.59, 269.88, 102.64, 341.77),
            vector4(368.05, 267.75, 102.62, 337.77),
            vector4(371.2, 266.77, 102.6, 340.94),
            vector4(375.32, 265.38, 102.59, 339.29),
            vector4(379.12, 264.74, 102.59, 337.98),
            vector4(388.53, 269.67, 102.58, 68.7),
            vector4(389.17, 272.93, 102.58, 72.26),
            vector4(391.11, 276.63, 102.57, 69.67),
            vector4(392.57, 280.58, 102.57, 70.77),
            vector4(393.81, 283.91, 102.55, 71.82),
            vector4(390.92, 290.55, 102.58, 163.29),
            vector4(386.89, 291.62, 102.63, 162.58),
            vector4(383.07, 292.87, 102.69, 164.08),
            vector4(379.23, 293.87, 102.77, 162.43),
            vector4(374.93, 294.49, 102.85, 162.54),
            vector4(375.86, 274.26, 102.65, 157.86),
            vector4(371.94, 275.54, 102.71, 158.54),
            vector4(368.03, 277.26, 102.77, 156.9),
            vector4(378.84, 281.93, 102.68, 336.98),
            vector4(375.05, 283.0, 102.75, 339.72),
            vector4(370.91, 284.66, 102.83, 337.04),
            vector4(361.12, 293.52, 103.08, 251.69),
            vector4(359.6, 290.0, 103.08, 249.21),
            vector4(357.99, 286.45, 103.1, 248.69),
            vector4(356.98, 283.01, 103.0, 248.05),
        }
    },
    ['airportp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-774.63580322266, -2029.9718017578),
                vector2(-762.36541748047, -2020.2685546875),
                vector2(-751.77990722656, -2006.7869873047),
                vector2(-746.55560302734, -1994.9779052734),
                vector2(-741.193359375, -1969.6853027344),
                vector2(-748.38757324219, -1967.7554931641),
                vector2(-749.80072021484, -1972.8009033203),
                vector2(-751.66424560547, -1983.6604003906),
                vector2(-753.23101806641, -1990.0401611328),
                vector2(-755.97369384766, -1997.2758789062),
                vector2(-760.61236572266, -2004.3958740234),
                vector2(-767.02648925781, -2011.8990478516),
                vector2(-774.74267578125, -2019.3276367188),
                vector2(-779.95263671875, -2023.1264648438)
            },
            ['minZ'] = 6.0,  -- min height of the parking zone
            ['maxZ'] = 12.0,  -- max height of the parking zone
        },
        label = 'Airport Parking',
        showBlip = true,
        blipcoords = vector3(-787.73, -2027.71, 8.87),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Airport Parking', 
        debug = false,
        ['ParkingSpots'] = {
            vector4(-774.87, -2026.01, 8.23, 216.52),
            vector4(-772.47, -2023.62, 8.23, 218.81),
            vector4(-769.48, -2021.51, 8.24, 223.63),
            vector4(-767.15, -2018.49, 8.24, 227.83),
            vector4(-764.68, -2015.96, 8.24, 226.56),
            vector4(-762.28, -2013.69, 8.24, 228.43),
            vector4(-759.81, -2011.28, 8.24, 227.22),
            vector4(-757.65, -2008.1, 8.24, 231.13),
            vector4(-755.57, -2005.36, 8.24, 234.72),
            vector4(-753.49, -2002.26, 8.24, 234.8),
            vector4(-751.36, -1998.72, 8.24, 246.51),
            vector4(-750.16, -1995.26, 8.24, 247.26),
            vector4(-748.92, -1992.03, 8.24, 250.8),
            vector4(-747.97, -1988.04, 8.23, 259.08),
            vector4(-746.86, -1984.55, 8.23, 259.25),
            vector4(-746.47, -1981.01, 8.23, 257.51),
            vector4(-746.1, -1977.65, 8.23, 259.18),
            vector4(-745.14, -1974.51, 8.23, 259.03),
            vector4(-744.63, -1970.99, 8.23, 257.23),
        }
    },
    ['beachp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1184.0090332031, -1506.9578857422),
                vector2(-1191.0072021484, -1510.4536132812),
                vector2(-1208.0456542969, -1485.4736328125),
                vector2(-1207.2938232422, -1484.9837646484),
                vector2(-1207.82421875, -1483.9691162109),
                vector2(-1207.1929931641, -1483.5710449219),
                vector2(-1207.4473876953, -1482.5003662109),
                vector2(-1194.8387451172, -1473.3900146484),
                vector2(-1195.8562011719, -1470.9033203125),
                vector2(-1188.6729736328, -1465.9649658203),
                vector2(-1171.3671875, -1491.5797119141),
                vector2(-1183.1450195312, -1499.9438476562)
            },
            ['minZ'] = 3.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Beach Parking',
        showBlip = true,
        blipcoords = vector3(-1183.1, -1511.11, 4.36),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},       
        drawText = 'Beach Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1190.52, -1503.64, 3.73, 303.05),
            vector4(-1193.78, -1499.97, 3.73, 304.47),
            vector4(-1195.43, -1496.38, 3.73, 303.91),
            vector4(-1197.21, -1493.7, 3.73, 306.4),
            vector4(-1199.45, -1490.6, 3.73, 305.42),
            vector4(-1201.97, -1487.92, 3.73, 306.23),
            vector4(-1204.19, -1484.47, 3.73, 303.38),
            vector4(-1194.82, -1480.57, 3.74, 123.38),
            vector4(-1192.82, -1483.34, 3.74, 124.65),
            vector4(-1190.71, -1485.72, 3.74, 124.51),
            vector4(-1188.57, -1488.35, 3.74, 121.48),
            vector4(-1187.32, -1491.07, 3.74, 125.25),
            vector4(-1185.11, -1493.4, 3.74, 125.65),
            vector4(-1184.27, -1496.5, 3.74, 126.33),
            vector4(-1176.67, -1491.37, 3.74, 303.02),
            vector4(-1178.44, -1488.85, 3.74, 305.32),
            vector4(-1180.25, -1486.35, 3.74, 304.39),
            vector4(-1182.0, -1483.73, 3.74, 302.76),
            vector4(-1184.69, -1479.87, 3.74, 304.1),
            vector4(-1187.34, -1475.98, 3.74, 303.5),
            vector4(-1189.09, -1472.58, 3.74, 305.18),
            vector4(-1191.35, -1470.01, 3.74, 303.15),
        }
    },
    ['themotorhotel'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1139.9086914062, 2652.3527832031),
                vector2(1117.0804443359, 2652.6826171875),
                vector2(1116.2991943359, 2661.5607910156),
                vector2(1109.01953125, 2661.2229003906),
                vector2(1109.2404785156, 2667.4311523438),
                vector2(1094.9285888672, 2667.5925292969),
                vector2(1095.3262939453, 2659.7412109375),
                vector2(1108.4549560547, 2659.6665039062),
                vector2(1108.4644775391, 2644.330078125),
                vector2(1140.1859130859, 2644.1916503906)
            },
            ['minZ'] = 36.0,  -- min height of the parking zone
            ['maxZ'] = 42.0,  -- max height of the parking zone
        },
        label = 'The Hotel Parking',
        showBlip = true,
        blipcoords = vector3(1122.78, 2665.25, 38.02),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                
        debug = false,
        ['ParkingSpots'] = {
            vector4(1135.2, 2648.18, 37.35, 1.01),
            vector4(1131.44, 2648.52, 37.35, 0.19),
            vector4(1127.55, 2648.31, 37.35, 359.2),
            vector4(1124.03, 2649.53, 37.35, 1.3),
            vector4(1120.5, 2648.18, 37.35, 359.0),
            vector4(1116.72, 2648.86, 37.35, 359.78),
            vector4(1112.4, 2654.23, 37.35, 269.71),
            vector4(1112.55, 2657.83, 37.35, 269.13),
            vector4(1105.56, 2663.52, 37.33, 358.24),
            vector4(1101.89, 2663.87, 37.33, 0.6),
            vector4(1098.12, 2663.2, 37.33, 0.93),
        }
    },
    ['shoreparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1712.85546875, 3782.0153808594),
                vector2(1701.6730957031, 3774.4406738281),
                vector2(1699.8341064453, 3773.2316894531),
                vector2(1698.3884277344, 3772.3322753906),
                vector2(1697.5706787109, 3770.4873046875),
                vector2(1697.1193847656, 3768.9091796875),
                vector2(1697.4830322266, 3767.7175292969),
                vector2(1697.3917236328, 3766.7282714844),
                vector2(1700.0863037109, 3763.9912109375),
                vector2(1705.7977294922, 3758.3413085938),
                vector2(1706.3470458984, 3757.6352539062),
                vector2(1706.2116699219, 3756.6440429688),
                vector2(1704.9096679688, 3754.1391601562),
                vector2(1702.0946044922, 3751.4658203125),
                vector2(1698.966796875, 3748.1306152344),
                vector2(1698.3508300781, 3747.5686035156),
                vector2(1701.5850830078, 3743.0949707031),
                vector2(1712.2723388672, 3751.5366210938),
                vector2(1712.1044921875, 3754.6669921875),
                vector2(1708.1145019531, 3757.7258300781),
                vector2(1712.8225097656, 3763.2758789062),
                vector2(1707.2990722656, 3769.498046875),
                vector2(1714.8156738281, 3773.8583984375),
                vector2(1717.1613769531, 3774.7897949219)
            },
            ['minZ'] = 32.00,  -- min height of the parking zone
            ['maxZ'] = 41.00,  -- max height of the parking zone
        },
        label = 'Shore Parking',
        showBlip = true,
        blipcoords = vector3(1715.63, 3762.77, 34.2),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'}, 
        drawText = 'Shore Parking',       
        debug = false,
        ['ParkingSpots'] = {
            vector4(1712.89, 3776.11, 33.83, 213.83),
            vector4(1709.02, 3774.29, 33.84, 212.96),
            vector4(1705.53, 3772.02, 33.85, 218.81),
            vector4(1705.19, 3765.94, 33.74, 315.05),
            vector4(1708.27, 3763.11, 33.63, 318.11),
            vector4(1707.81, 3752.46, 33.44, 227.36),
            vector4(1704.73, 3749.57, 33.39, 223.26),
            vector4(1702.08, 3746.21, 33.3, 226.73),
        }
    },
    ['haanparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(80.34969329834, 6391.3623046875),
                vector2(86.156478881836, 6396.8198242188),
                vector2(73.955017089844, 6408.5102539062),
                vector2(68.827651977539, 6404.4145507812),
                vector2(64.261825561523, 6411.298828125),
                vector2(53.718883514404, 6401.2817382812),
                vector2(60.496765136719, 6395.1240234375),
                vector2(67.129524230957, 6401.25390625),
                vector2(77.48779296875, 6388.595703125)
            },
            ['minZ'] = 30.00,  -- min height of the parking zone
            ['maxZ'] = 36.00,  -- max height of the parking zone
        },
        label = 'Paleto Parking',
        showBlip = true,
        blipcoords = vector3(82.01, 6422.61, 31.67),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Paleto Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(80.16, 6395.45, 30.58, 132.74),
            vector4(77.49, 6398.07, 30.58, 133.44),
            vector4(75.02, 6400.99, 30.58, 134.68),
            vector4(72.24, 6403.97, 30.58, 133.65),
            vector4(65.2, 6405.68, 30.58, 213.57),
            vector4(62.28, 6403.33, 30.58, 213.16),
            vector4(59.35, 6400.22, 30.58, 210.39),
        }
    },
    ['pillboxgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(239.88751220703, -820.52038574219),
                vector2(252.71513366699, -784.91027832031),
                vector2(258.39483642578, -786.82489013672),
                vector2(264.27755737305, -769.99841308594),
                vector2(218.69738769531, -754.69787597656),
                vector2(200.07238769531, -805.74285888672)
            },
            ['minZ'] = 29.00,  -- min height of the parking zone
            ['maxZ'] = 35.00,  -- max height of the parking zone
        },
        label = 'Legion Square Parking',
        showBlip = true,
        blipcoords = vector3(215.9499, -809.698, 30.731),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public', --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Legion Square Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(219.38, -765.95, 30.41, 247.04),
            vector4(218.07, -768.47, 30.41, 248.86),
            vector4(216.93, -770.89, 30.42, 249.93),
            vector4(216.35, -773.48, 30.43, 249.43),
            vector4(215.02, -775.62, 30.44, 252.59),
            vector4(214.22, -778.6, 30.45, 247.99),
            vector4(213.67, -780.92, 30.45, 248.98),
            vector4(212.9, -783.52, 30.46, 249.01),
            vector4(210.97, -785.75, 30.5, 250.38),
            vector4(210.35, -788.41, 30.51, 249.85),
            vector4(209.74, -790.91, 30.51, 248.14),
            vector4(209.21, -793.47, 30.52, 249.87),
            vector4(207.96, -795.82, 30.55, 248.81),
            vector4(206.91, -798.68, 30.57, 248.97),
            vector4(205.45, -800.74, 30.6, 249.38),
            vector4(234.07, -771.23, 30.33, 249.64),
            vector4(232.09, -776.31, 30.3, 248.31),
            vector4(230.94, -778.87, 30.29, 248.97),
            vector4(230.7, -781.41, 30.28, 250.6),
            vector4(229.02, -783.81, 30.28, 250.06),
            vector4(227.64, -789.2, 30.26, 247.99),
            vector4(226.28, -791.42, 30.26, 248.95),
            vector4(225.72, -794.21, 30.24, 249.28),
            vector4(224.66, -796.59, 30.24, 247.01),
            vector4(223.2, -798.92, 30.25, 248.79),
            vector4(222.61, -801.4, 30.25, 248.1),
            vector4(221.77, -804.1, 30.26, 245.92),
            vector4(221.6, -806.74, 30.25, 247.77),
            vector4(219.83, -808.89, 30.26, 251.3),
            vector4(228.63, -768.88, 30.36, 69.31),
            vector4(227.76, -771.74, 30.35, 71.5),
            vector4(226.39, -773.88, 30.35, 68.62),
            vector4(225.43, -776.69, 30.35, 69.02),
            vector4(224.35, -778.81, 30.34, 64.93),
            vector4(224.25, -781.78, 30.33, 70.11),
            vector4(222.81, -784.16, 30.34, 72.1),
            vector4(221.16, -786.48, 30.35, 68.66),
            vector4(221.04, -789.3, 30.34, 68.07),
            vector4(219.76, -791.48, 30.34, 70.29),
            vector4(218.97, -794.38, 30.34, 68.04),
            vector4(218.34, -796.97, 30.34, 66.59),
            vector4(217.56, -799.45, 30.35, 69.51),
            vector4(216.23, -801.69, 30.37, 70.17),
            vector4(215.69, -804.56, 30.38, 68.56),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(236.32, -812.55, 29.88, 248.26),
            vector4(237.41, -809.93, 29.89, 244.26),
            vector4(238.45, -807.4, 29.9, 244.04),
            vector4(238.94, -804.82, 29.93, 248.53),
            vector4(240.36, -802.39, 29.94, 246.63),
            vector4(241.52, -799.87, 29.96, 245.68),
            vector4(242.03, -797.37, 29.98, 246.08),
            vector4(243.06, -794.79, 30.01, 249.35),
            vector4(244.27, -792.42, 30.03, 247.07),
            vector4(245.14, -789.87, 30.06, 247.13),
            vector4(246.18, -787.38, 30.08, 248.58),
            vector4(246.61, -784.52, 30.12, 248.32),
            vector4(248.17, -782.46, 30.14, 248.95),
            vector4(249.12, -779.63, 30.18, 249.01),
            vector4(249.32, -776.78, 30.22, 247.42),
            vector4(250.19, -774.3, 30.26, 248.86),
            vector4(244.75, -772.24, 30.29, 69.17),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(231.42, -810.44, 30.01, 70.18),
            vector4(231.62, -807.79, 30.03, 68.27),
            vector4(232.96, -805.51, 30.02, 66.62),
            vector4(234.88, -803.0, 30.02, 69.62),
            vector4(235.38, -800.43, 30.04, 68.23),
            vector4(236.58, -797.83, 30.05, 69.89),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(237.88, -792.75, 30.08, 66.76),
            vector4(238.84, -790.11, 30.11, 68.34),
            vector4(240.15, -787.59, 30.13, 67.55),
            vector4(241.01, -785.27, 30.15, 69.84),
            vector4(244.51, -775.07, 30.26, 70.7),
            vector4(243.65, -777.69, 30.22, 67.25),
            vector4(242.44, -779.84, 30.2, 68.04),
            vector4(241.32, -782.41, 30.18, 69.19),
        }
    },
    ['hayesdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(396.42849731445, -1638.5462646484),
            vector2(391.47442626953, -1644.7932128906),
            vector2(408.99801635742, -1659.8707275391),
            vector2(410.10244750977, -1660.0045166016),
            vector2(411.02520751953, -1660.5128173828),
            vector2(414.14010620117, -1656.6708984375),
            vector2(413.75109863281, -1656.2716064453),
            vector2(414.02716064453, -1655.3604736328),
            vector2(417.91046142578, -1650.4777832031),
            vector2(419.05334472656, -1650.5107421875),
            vector2(423.38757324219, -1645.2980957031),
            vector2(424.07730102539, -1640.5269775391),
            vector2(423.83642578125, -1632.6691894531),
            vector2(423.06732177734, -1628.1555175781),
            vector2(418.51977539062, -1624.3377685547),
            vector2(417.60821533203, -1624.7392578125),
            vector2(417.07940673828, -1624.1993408203),
            vector2(412.89819335938, -1629.0834960938),
            vector2(416.64144897461, -1632.8732910156),
            vector2(417.00152587891, -1633.2419433594),
            vector2(406.35409545898, -1646.1291503906)
            },
            ['minZ'] = 28.25,  -- min height of the parking zone
            ['maxZ'] = 31.31,  -- max height of the parking zone
        },
        label = 'Hayes Depot',
        showBlip = true,
        blipcoords = vector3(410.26, -1641.74, 29.29),
        blipName = 'Impound Lot',
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Hayes Depot',
        debug = false,
        ['ParkingSpots'] = {
            vector4(410.69, -1656.37, 28.87, 319.32),
            vector4(408.42, -1654.4, 28.87, 319.48),
            vector4(405.64, -1652.35, 28.87, 319.43),
            vector4(403.64, -1650.28, 28.87, 319.23),
            vector4(401.02, -1648.25, 28.87, 320.07),
            vector4(398.57, -1646.3, 28.87, 319.62),
            vector4(396.16, -1644.29, 28.87, 319.21),
            vector4(417.08, -1627.89, 28.87, 319.43),
            vector4(419.4, -1629.64, 28.87, 320.41),
            vector4(420.66, -1635.66, 28.87, 268.2),
            vector4(420.5, -1639.01, 28.87, 268.98),
            vector4(420.33, -1642.07, 28.87, 88.84),
            vector4(418.17, -1646.49, 28.87, 50.64),
        }
    },
    ['sandy'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1967.3037109375, 3765.0610351562),
                vector2(1964.3835449219, 3770.3464355469),
                vector2(1946.6644287109, 3759.47265625),
                vector2(1949.1380615234, 3754.4504394531)
            },
            ['minZ'] = 30.00,  -- min height of the parking zone
            ['maxZ'] = 35.00,  -- max height of the parking zone
        },
        label = 'Sandy Impound',
        showBlip = true,
        blipcoords = vector3(1959.15, 3761.33, 32.2),
        blipName = 'Impound Lot',
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Sandy Impound',
        debug = false,
        ['ParkingSpots'] = {
            vector4(1949.41, 3759.43, 31.56, 30.1),
            vector4(1952.92, 3761.21, 31.56, 30.92),
            vector4(1956.18, 3763.03, 31.56, 32.15),
            vector4(1959.63, 3764.94, 31.56, 26.87),
            vector4(1963.11, 3767.01, 31.56, 28.04),
        }
    },
    ['paleto'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-212.97718811035, 6222.3862304688),
                vector2(-198.84443664551, 6235.9604492188),
                vector2(-191.78587341308, 6229.2333984375),
                vector2(-206.16171264648, 6215.5356445312)
            },
            ['minZ'] = 30.00,  -- min height of the parking zone
            ['maxZ'] = 35.00,  -- max height of the parking zone
        },
        label = 'Paleto Impound',
        showBlip = true,
        blipcoords = vector3(-201.85, 6224.23, 31.49),
        blipName = 'Impound Lot',
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Paleto Impound',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-207.36, 6219.36, 30.85, 225.68),
            vector4(-204.48, 6221.39, 30.85, 223.79),
            vector4(-202.54, 6224.14, 30.85, 223.59),
            vector4(-200.12, 6226.58, 30.85, 223.9),
            vector4(-197.73, 6228.88, 30.86, 224.33),
        }
    },
    ['sapcounsel'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-362.48254394531, -793.2802734375),
                vector2(-362.46408081055, -730.71594238281),
                vector2(-360.078125, -727.29187011719),
                vector2(-359.91299438477, -726.02014160156),
                vector2(-355.41589355469, -725.94165039062),
                vector2(-347.00802612305, -729.64282226562),
                vector2(-312.21273803711, -742.18682861328),
                vector2(-310.43478393555, -737.13165283203),
                vector2(-266.06091308594, -753.01647949219),
                vector2(-275.53680419922, -777.63562011719),
                vector2(-284.21676635742, -774.40985107422),
                vector2(-285.57073974609, -778.85809326172),
                vector2(-287.20227050781, -778.1279296875),
                vector2(-289.10836791992, -783.76214599609),
                vector2(-319.63018798828, -772.48706054688),
                vector2(-335.69149780273, -786.58020019531),
                vector2(-345.55349731445, -791.60711669922)
            },
            ['minZ'] = 33.00,  -- min height of the parking zone
            ['maxZ'] = 37.60,  -- max height of the parking zone
        },
        label = "San Andreas Parking",
        showBlip = true,
        blipcoords = vector3(-330.01, -780.33, 33.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,                 --car, air, sea
        ['ParkingSpots'] = {
            vector4(-356.89, -749.29, 33.54, 270.15),
            vector4(-356.83, -753.66, 33.54, 269.64),
            vector4(-357.22, -756.74, 33.54, 269.93),
            vector4(-357.17, -760.01, 33.54, 269.71),
            vector4(-357.4, -764.54, 33.54, 268.82),
            vector4(-357.14, -767.51, 33.54, 269.67),
            vector4(-357.09, -770.59, 33.54, 271.03),
            vector4(-357.09, -776.02, 33.54, 267.95),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-357.37, -746.23, 33.54, 269.64),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-289.82, -764.25, 33.54, 160.83),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-295.59, -762.4, 33.54, 160.93),
            vector4(-298.43, -761.45, 33.54, 159.95),
            vector4(-302.41, -760.02, 33.54, 161.24),
            vector4(-305.16, -758.37, 33.54, 158.98),
            vector4(-308.23, -757.98, 33.54, 160.64),
            vector4(-311.14, -757.03, 33.54, 158.78),
            vector4(-315.09, -755.34, 33.54, 157.34),
            vector4(-317.51, -753.39, 33.54, 160.53),
            vector4(-320.45, -752.5, 33.55, 161.44),
            vector4(-323.24, -751.76, 33.54, 158.57),
            vector4(-329.02, -750.3, 33.54, 179.15),
            vector4(-331.75, -750.26, 33.54, 179.53),
            vector4(-334.52, -750.73, 33.54, 181.13),
            vector4(-337.46, -751.25, 33.54, 183.02),
            vector4(-342.14, -749.82, 33.55, 272.39),
            vector4(-341.94, -753.53, 33.55, 94.28),
            vector4(-341.97, -756.82, 33.55, 90.65),
            vector4(-342.23, -760.49, 33.55, 88.42),
            vector4(-341.84, -764.1, 33.55, 89.13),
            vector4(-341.93, -767.36, 33.55, 91.18),
            vector4(-357.3, -732.9, 33.54, 270.41),
            vector4(-357.24, -737.63, 33.55, 269.9),
            vector4(-357.33, -743.24, 33.54, 270.89),
            vector4(-295.82, -778.26, 33.54, 342.22),
            vector4(-299.37, -776.74, 33.54, 342.64),
            vector4(-307.47, -773.5, 33.54, 340.32),
            vector4(-303.19, -775.79, 33.54, 339.27),
            vector4(-310.37, -772.78, 33.54, 339.1),
            vector4(-313.07, -771.64, 33.54, 338.38),
            vector4(-315.73, -770.26, 33.54, 339.87),
            vector4(-273.07, -761.54, 33.54, 69.58),
            vector4(-273.81, -765.05, 33.54, 71.99),
            vector4(-276.05, -771.7, 33.54, 68.27),
            vector4(-277.3, -775.37, 33.54, 70.28),
            vector4(-277.07, -751.83, 33.54, 160.8),
            vector4(-279.97, -750.75, 33.54, 160.08),
            vector4(-284.28, -748.9, 33.54, 159.2),
            vector4(-287.28, -748.29, 33.54, 160.63),
            vector4(-290.22, -747.64, 33.54, 159.94),
            vector4(-292.89, -746.25, 33.54, 160.17),
            vector4(-297.03, -744.69, 33.54, 159.37),
            vector4(-299.71, -743.7, 33.54, 159.26),
            vector4(-302.62, -742.8, 33.54, 159.48),
            vector4(-275.18, -768.22, 33.54, 71.26)
        }
    },
    ['lowerpowerstreet'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(69.414520263672, -849.34320068359),
                vector2(59.563220977783, -876.13598632812),
                vector2(53.812015533447, -873.94421386719),
                vector2(52.552845001221, -876.92974853516),
                vector2(58.53719329834, -879.25579833984),
                vector2(49.19457244873, -904.89520263672),
                vector2(12.526390075684, -891.47192382812),
                vector2(32.711112976074, -835.94616699219),
                vector2(43.370277404785, -840.03533935547),
                vector2(41.773113250732, -844.49047851562),
                vector2(44.550273895264, -845.6552734375),
                vector2(46.358081817627, -841.06768798828)
            },
            ['minZ'] = 29.0,
            ['maxZ'] = 31.10
        },
        label = 'LOWER POWER STREET',
        showBlip = true,
        blipcoords = vector3(52.41, -874.53, 30.42),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(19.23, -880.71, 29.8, 341.54),
            vector4(22.45, -882.16, 29.79, 340.09),
            vector4(25.93, -883.46, 29.79, 343.72),
            vector4(37.8, -887.64, 29.77, 160.81),
            vector4(40.91, -889.25, 29.75, 160.21),
            vector4(44.33, -890.22, 29.75, 159.58),
            vector4(48.14, -890.77, 29.75, 161.49),
            vector4(51.0, -892.1, 29.74, 158.87),
            vector4(52.71, -887.68, 29.81, 158.88),
            vector4(49.66, -885.99, 29.83, 161.45),
            vector4(45.81, -885.22, 29.83, 161.8),
            vector4(42.78, -884.27, 29.83, 161.42),
            vector4(39.63, -883.03, 29.84, 159.02),
            vector4(27.5, -878.27, 29.87, 160.31),
            vector4(24.28, -877.02, 29.88, 158.81),
            vector4(20.96, -876.17, 29.88, 157.99),
            vector4(25.15, -864.12, 30.08, 161.27),
            vector4(28.23, -865.24, 30.07, 158.11),
            vector4(32.0, -866.64, 30.06, 158.96),
            vector4(44.22, -870.05, 30.05, 159.97),
            vector4(47.29, -872.04, 30.03, 160.4),
            vector4(50.56, -873.75, 30.01, 158.52),
            vector4(60.1, -866.79, 30.13, 159.36),
            vector4(56.83, -865.6, 30.14, 161.35),
            vector4(53.77, -864.08, 30.16, 158.58),
            vector4(50.79, -863.1, 30.16, 159.63),
            vector4(47.46, -861.17, 30.18, 160.06),
            vector4(35.2, -857.05, 30.21, 160.46),
            vector4(31.39, -855.98, 30.22, 163.34),
            vector4(28.65, -854.67, 30.24, 156.84),
            vector4(34.44, -839.08, 30.49, 161.56),
            vector4(37.43, -840.18, 30.48, 159.6),
            vector4(41.04, -841.14, 30.47, 157.63),
            vector4(53.89, -846.47, 30.42, 159.93),
            vector4(56.93, -847.64, 30.41, 162.76),
            vector4(60.37, -848.47, 30.41, 161.79),
            vector4(63.44, -850.18, 30.39, 157.81),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(233.41, -774.07, 30.31, 248.68)
        }
    },
--JOB Garage
    ['police'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(433.20791625976, -1030.1831054688),
                vector2(453.41519165039, -1027.6652832031),
                vector2(452.32653808594, -1020.2009277344),
                vector2(432.58502197266, -1021.8754272461)
            },
            ['minZ'] = 27.00,  -- min height of the parking zone
            ['maxZ'] = 35.00,  -- max height of the parking zone
        },
        label = 'Police',
        showBlip = false,
        blipName = 'Police',
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency','car', 'motorcycle', 'other'},
        drawText = 'Police Parking',             
        job = 'police',
        debug = false,
        ['ParkingSpots'] = {
            vector4(449.57, -1024.85, 28.06, 5.95),
            vector4(446.04, -1025.62, 28.14, 5.18),
            vector4(442.53, -1025.66, 28.2, 6.39),
            vector4(438.8, -1025.99, 28.27, 7.28),
            vector4(435.41, -1026.74, 28.35, 3.84),
        }
    },
    ['ems'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(302.12600708008, -602.61865234375),
                vector2(298.04449462891, -614.00830078125),
                vector2(291.31134033203, -611.32257080078),
                vector2(295.59765625, -600.63952636719)
            },
            ['minZ'] = 42.00,  -- min height of the parking zone
            ['maxZ'] = 46.00,  -- max height of the parking zone
        },
        label = 'EMS',
        showBlip = false,
        blipName = 'EMS',
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency','car', 'motorcycle', 'other'},
        drawText = 'EMS Parking',             
        job = 'ems',
        debug = false,
        ['ParkingSpots'] = {
            vector4(296.81, -604.72, 42.59, 66.49),
            vector4(296.07, -607.81, 42.61, 67.39),
            vector4(294.61, -610.52, 42.6, 67.88),
        }
    },
    ['mechanic'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-358.58636474609, -131.41928100586),
                vector2(-364.77157592773, -129.05923461914),
                vector2(-359.99783325195, -115.81956481934),
                vector2(-353.69378662109, -117.98598480225)
            },
            ['minZ'] = 37.00,  -- min height of the parking zone
            ['maxZ'] = 44.00,  -- max height of the parking zone
        },
        label = 'LS Customs',
        showBlip = false,
        blipName = 'LS Customs',
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency','car', 'motorcycle', 'other'},
        drawText = 'LS Customs Parking',             
        job = 'mechanic',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-360.6, -127.3, 38.06, 70.43),
            vector4(-360.04, -123.64, 38.06, 68.29),
            vector4(-358.02, -120.42, 38.06, 68.7),
        }
    },
    ['cardealer'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-6.6579723358154, -1095.2349853516),
                vector2(-12.778080940247, -1093.3577880859),
                vector2(-19.265251159668, -1110.9040527344),
                vector2(-12.685285568237, -1111.4750976562)
            },
            ['minZ'] = 25.00,  -- min height of the parking zone
            ['maxZ'] = 30.00,  -- max height of the parking zone
        },
        label = 'Cardealer',
        showBlip = false,
        blipName = 'Cardealer',
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Cardealer Parking',             
        job = 'cardealer',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-11.01, -1097.07, 26.03, 98.91),
            vector4(-12.75, -1102.43, 26.03, 101.42),
            vector4(-13.92, -1108.2, 26.03, 100.64),
        }
    },
    ['bcso'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1843.3245849609, 3673.3190917969),
                vector2(1846.6403808594, 3668.1979980469),
                vector2(1858.0625, 3675.0053710938),
                vector2(1854.9332275391, 3679.9377441406)
            },
            ['minZ'] = 32.0,  -- min height of the parking zone
            ['maxZ'] = 36.0,  -- max height of the parking zone
        },
        label = 'BCSO GARAGE',
        showBlip = false,
        blipName = 'BCSO',
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency','car', 'motorcycle', 'other'},
        drawText = 'BCSO Parking',             
        job = 'bcso',
        debug = false,
        ['ParkingSpots'] = {
            vector4(1854.58, 3674.96, 33.06, 211.77),
            vector4(1850.77, 3673.6, 33.11, 210.63),
            vector4(1847.44, 3671.9, 33.06, 211.6),
        }
    },
    ['ballas'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(105.91556549072, -1960.0560302734),
                vector2(105.39846038818, -1952.4294433594),
                vector2(100.80292510986, -1952.1162109375),
                vector2(98.564208984375, -1951.2429199219),
                vector2(95.635391235352, -1956.0938720703),
                vector2(98.882064819336, -1959.0405273438),
                vector2(99.754028320312, -1960.0654296875)
            },
            ['minZ'] = 19.00,  -- min height of the parking zone
            ['maxZ'] = 22.00,  -- max height of the parking zone
        },
        label = 'Ballas Family Garage',
        showBlip = false,
        blipName = 'ballas',
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Ballas Family Garage', 
        job = 'ballas',
        debug = false,
        ['ParkingSpots'] = {
            vector4(103.61, -1955.79, 20.08, 356.49),
            vector4(98.88, -1954.89, 20.08, 336.35),
        }
    },
    ['gsf'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-807.84490966797, 185.82218933105),
                vector2(-810.55218505859, 191.02293395996),
                vector2(-815.87548828125, 188.98609924316),
                vector2(-813.95263671875, 183.68653869629)
            },
            ['minZ'] = 71.00,  -- min height of the parking zone
            ['maxZ'] = 75.00,  -- max height of the parking zone
        },
        label = 'Family Garage',
        showBlip = false,
        blipName = 'gsf',
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Family Garage', 
        job = 'gsf',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-812.45, 187.22, 71.83, 110.25),
        }
    },
    ['vagos'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(318.04946899414, -2014.7698974609),
                vector2(336.80111694336, -2030.8790283203),
                vector2(332.02587890625, -2036.3070068359),
                vector2(313.77713012695, -2020.2993164062)
            },
            ['minZ'] = 19.00,  -- min height of the parking zone
            ['maxZ'] = 25.09,  -- max height of the parking zone
        },
        label = 'Vagos Garage',
        showBlip = false,
        blipName = 'vagos',
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Vagos Garage', 
        job = 'vagos',
        debug = false,
        ['ParkingSpots'] = {
            vector4(318.53, -2019.89, 20.07, 140.72),
            vector4(320.85, -2022.18, 20.14, 142.06),
            vector4(323.17, -2024.07, 20.24, 140.53),
            vector4(325.37, -2026.13, 20.33, 141.15),
            vector4(327.11, -2028.62, 20.37, 140.69),
            vector4(329.53, -2030.04, 20.46, 142.76),
            vector4(332.11, -2032.04, 20.52, 140.72),
        }
    },
    ['lmc'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(956.34539794922, -138.37704467773),
                vector2(959.97369384766, -132.35931396484),
                vector2(952.06378173828, -126.98789978027),
                vector2(949.04248046875, -133.00360107422)
            },
            ['minZ'] = 73.00,  -- min height of the parking zone
            ['maxZ'] = 77.00,  -- max height of the parking zone
        },
        label = 'Lmc Garage',
        showBlip = false,
        blipName = 'lmc',
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Lmc Garage', 
        job = 'lmc',
        debug = false,
        ['ParkingSpots'] = {
            vector4(953.37, -131.42, 74.11, 328.07),
            vector4(956.74, -133.86, 74.12, 328.28)
        }
    },
    ['marabunta'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1410.8577880859, 1114.4161376953),
                vector2(1398.0087890625, 1114.5295410156),
                vector2(1398.5335693359, 1122.2736816406),
                vector2(1410.5737304688, 1122.1584472656)
            },
            ['minZ'] = 113.0,  -- min height of the parking zone
            ['maxZ'] = 117.0,  -- max height of the parking zone
        },
        label = 'Marabunta Garage',
        showBlip = false,
        blipName = 'marabunta',
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Marabunta Garage', 
        job = 'marabunta',
        debug = false,
        ['ParkingSpots'] = {
            vector4(1407.49, 1116.97, 114.2, 34.83),
            vector4(1401.41, 1116.79, 114.2, 27.82),

        }
    },
--HeliGarage
    ['helipad'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-757.8896484375, -1469.876953125),
                vector2(-744.54223632812, -1480.4110107422),
                vector2(-733.07989501954, -1467.4460449218),
                vector2(-746.4605102539, -1456.0607910156)
            },
            ['minZ'] = 4.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Heli Pad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Heli Pad',
        showBlip = true, 
        blipName = 'Heli Pad',
        blipNumber = 64,
        blipColor = 50, 
        blipcoords = vector3(-745.61, -1468.57, 4.37),
        ['ParkingSpots'] = {
            vector4(-745.53, -1468.68, 5.0, 321.19)
        },
        ParkingDistance = 100.0,
        debug = true
    },
    ['shoreheli'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1774.4047851562, 3246.9484863281),
                vector2(1762.30859375, 3244.3928222656),
                vector2(1765.3605957031, 3231.908203125),
                vector2(1777.5689697266, 3235.4580078125)
            },
            ['minZ'] = 40.0,  -- min height of the parking zone
            ['maxZ'] = 46.0,  -- max height of the parking zone
        },
        label = 'Sandy Shores Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Sandy Shores Helipad Heli Pad',
        showBlip = true, 
        blipName = 'Heli Pad',
        blipNumber = 64,
        blipColor = 50, 
        blipcoords = vector3(1769.62, 3240.14, 42.01),
        ['ParkingSpots'] = {
            vector4(1769.62, 3240.14, 42.01, 60.44),
        },
        ParkingDistance = 100.0,
        debug = true
    },
    ['intairport'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-992.59680175781, -2949.84375),
                vector2(-1030.8975830078, -3016.2927246094),
                vector2(-1030.3382568359, -3016.5925292969),
                vector2(-1029.6291503906, -3017.0434570312),
                vector2(-1028.7434082031, -3018.0705566406),
                vector2(-1022.2585449219, -3021.5798339844),
                vector2(-1021.3436279297, -3020.5522460938),
                vector2(-1016.1632080078, -3023.6635742188),
                vector2(-1016.3262329102, -3024.7385253906),
                vector2(-966.09301757812, -3052.3435058594),
                vector2(-965.42352294922, -3051.1135253906),
                vector2(-961.01477050781, -3052.7600097656),
                vector2(-923.76300048828, -2978.2124023438)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Airport Hangar', 
        type = 'public',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'Airport Hangar',
        showBlip = true, 
        blipName = 'Hangar',
        blipNumber = 372,
        blipColor = 33, 
        blipcoords = vector3(-930.23, -2995.38, 19.85),
        ParkingDistance = 100.0,
        SpawnDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-985.04, -2965.05, 14.55, 128.92),
            vector4(-964.84, -2974.78, 14.55, 125.92),
            vector4(-945.49, -2985.63, 14.55, 117.77),
            vector4(-967.17, -3034.71, 14.55, 14.16),
            vector4(-990.13, -3022.86, 14.55, 15.42),
            vector4(-1010.91, -3012.56, 14.55, 2.31),
            vector4(-968.09, -3004.59, 14.55, 62.25)

        },
    },
    ['airdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1235.3253173828, -3378.4008789062),
                vector2(-1284.2642822266, -3350.1474609375),
                vector2(-1284.5589599609, -3350.7241210938),
                vector2(-1289.5042724609, -3348.0512695312),
                vector2(-1308.7587890625, -3382.4091796875),
                vector2(-1307.0877685547, -3383.8776855469),
                vector2(-1307.6185302734, -3385.4577636719),
                vector2(-1306.0087890625, -3386.4213867188),
                vector2(-1308.2755126953, -3391.1662597656),
                vector2(-1306.2180175781, -3392.1394042969),
                vector2(-1264.1188964844, -3420.0451660156),
                vector2(-1258.6077880859, -3412.1069335938),
                vector2(-1258.1317138672, -3412.4846191406),
                vector2(-1237.5152587891, -3387.8581542969),
                vector2(-1236.4268798828, -3387.1162109375),
                vector2(-1233.0942382812, -3380.8115234375),
                vector2(-1233.4357910156, -3380.13671875),
                vector2(-1235.1755371094, -3379.1962890625)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Air Depot',
        type = 'depot',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'AIR DEPOT',
        showBlip = true, 
        blipName = 'Air Depot',
        blipNumber = 569,
        blipColor = 33, 
        blipcoords = vector3(-1274.34, -3385.97, 13.94),
        ParkingDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1286.09, -3363.24, 14.54, 275.59),
            vector4(-1292.65, -3383.11, 14.54, 280.17),
            vector4(-1252.97, -3385.7, 14.54, 11.75),
            vector4(-1268.63, -3402.56, 14.54, 14.72),
            vector4(-1280.83, -3395.7, 14.54, 330.47),

        },
    },
    ['boathouse1'] = {
        ['Zone'] = {
            ['Shape'] = { 
                vector2(-778.9291381836, -1513.3040771484),
                vector2(-803.83276367188, -1521.1665039062),
                vector2(-816.67852783204, -1493.2373046875),
                vector2(-791.34436035156, -1481.7546386718)
            },
            ['minZ'] = 0.00,
            ['maxZ'] = 5.00
        },
        label = 'Boat House',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'BOAT HOUSE',
        showBlip = true, 
        blipName = 'Boat House',
        blipNumber = 569,
        blipColor = 33, 
        blipcoords = vector3(-1274.34, -3385.97, 13.94),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-798.39, -1499.15, 0.37, 109.87),
            vector4(-797.47, -1506.73, 0.3, 114.49),
        },
        ExitWarpLocations = {
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        },
    }
}

HouseGarages = {} -- DO NOT TOUCH!