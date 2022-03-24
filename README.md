# qb-garages

**BAMA94#1994 Edits:**
If you dont already have it, you need to add the following to your qb-radialmenu for this to work:
```
exports('AddOption', function(id, data)
    Config.MenuItems[id] = data
end)

exports('RemoveOption', function(id)
    Config.MenuItems[id] = nil
end)
```

**Public Garages**
* Park owned cars in public garages.
* You can only parks vehicles that you own in public garages. 

![image](https://user-images.githubusercontent.com/82112471/149678987-02ec660f-76c9-4414-af7b-bac284ed58b7.png)

![image](https://user-images.githubusercontent.com/82112471/149678977-2a574ee9-8ecc-494f-a845-e17281a74594.png)



**House Garages**
* Park owned cars in house garages. To add a house garage, you must have the realestate job and do /addgarage.
* You can only parks vehicles from persons that have the key in a house garage. 
* You can take every vehicle from the house garages to which you have the key. 
* You can only parks ground vehicles in house garages. 

**Gang Garages**
* Allows for gangs to have their own garages.
* You can parks every vehicle that is owned by gang members in gang garages. 
* You can take every vehicle from the gang garages. 

**Job Garages**
* Allows jobs to have garage specific.
* You can parks every vehicle that is owned by someone in job garages. 
* You can take every vehicle from the job garages. 

**Depot Garages**
* Allows depot cars to be retreived from here. Cops can do /depot [price] to send a car to the depot.

**Auto Respawn Config**
* If set to true, cars that are currently outside will be placed in the last garage used.
* If set to false, cars that are currently outside will be placed in the depot.

**Shared garages Config**
* If set to true, Gang and job garages are shared.
* If set to false, Gang and Job garages are personal.

**Configurations**
* You can only parks ground vehicles in garages of type "car" in config. 
* You can only parks water vehicles in garages of type "sea" in config. 
* You can only parks air vehicles in garages of type "air" in config. 
* Vehicle types and jobs or gang can be mixed in config.

**Blips and names**
* Blips and names are modifiable for each garage. 


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

