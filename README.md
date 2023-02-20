### MZ-TINTS - an XP sink where players exchange XP for tints + other possible rewards

### Introduction 
- Includes a modification to qb-weapons to make colourful tint sprays include a progress bar re: application and remove the item upon use;
- Players can exchange the XP of up to 6 skills (connected to mz-skills; set by config) for tint tokens to acquire temporary and permanent weapon tints;
- XP amount traded set by config;
- tint token cost set by config; 
- Resmon 0.00 idle; 
- Utilises qb-core or okokNotify notifications; 

### Dependencies

**[mz-skills](https://github.com/MrZainRP/mz-skills)**
**[progressbar](https://github.com/qbcore-framework/progressbar)**
**[qb-target](https://github.com/qbcore-framework/qb-target)**

### Installation Instruction

### A. MZ-SKILLS

1. If you do not already have mz-skills running in your server, ensure that mz-skills forms part of your running scripts. 

2. If this is your first time running mz-skills, be sure to run the "skills.sql" sql file and open the database. (This will add a data table to the existing "players" database which will hold the skill value for "Scraping" as well as other jobs)

### B. QB-WEAPONS

# 3. This resource includes a modification to qb-weapons. Either take the client and server files from the folder "weapons replacement" (and then delete that folder) OR amend your qb-weapons as follows: #

4. After line 60 of client/main.lua include the following additional functions: 

```lua
RegisterNetEvent('weapons:client:GreenTint', function(source)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
        TriggerServerEvent('weapons:server:GreenTintRemove')
        Wait(500)
        local spraytime = math.random(1500, 3500)
        QBCore.Functions.Progressbar("who_cares", "Painting weapon...", spraytime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(100)
            TriggerServerEvent('weapons:server:EquipTintGreen', source)
        end)
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You are not holding a weapon...", "primary", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED WEAPON", "You are not holding a weapon...", 3500, "info")
        end
    end 
end)

RegisterNetEvent('weapons:client:GoldTint', function(source)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
        TriggerServerEvent('weapons:server:GoldTintRemove')
        Wait(500)
        local spraytime = math.random(1500, 3500)
        QBCore.Functions.Progressbar("who_cares", "Painting weapon...", spraytime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(100)
            TriggerServerEvent('weapons:server:EquipTintGold', source)
        end)
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You are not holding a weapon...", "primary", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED WEAPON", "You are not holding a weapon...", 3500, "info")
        end
    end 
end)

RegisterNetEvent('weapons:client:PinkTint', function(source)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
        TriggerServerEvent('weapons:server:PinkTintRemove')
        Wait(500)
        local spraytime = math.random(1500, 3500)
        QBCore.Functions.Progressbar("who_cares", "Painting weapon...", spraytime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(100)
            TriggerServerEvent('weapons:server:EquipTintPink', source)
        end)
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You are not holding a weapon...", "primary", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED WEAPON", "You are not holding a weapon...", 3500, "info")
        end
    end 
end)

RegisterNetEvent('weapons:client:ArmyTint', function(source)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
        TriggerServerEvent('weapons:server:ArmyTintRemove')
        Wait(500)
        local spraytime = math.random(1500, 3500)
        QBCore.Functions.Progressbar("who_cares", "Painting weapon...", spraytime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(100)
            TriggerServerEvent('weapons:server:EquipTintArmy', source)
        end)
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You are not holding a weapon...", "primary", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED WEAPON", "You are not holding a weapon...", 3500, "info")
        end
    end 
end)

RegisterNetEvent('weapons:client:LSPDTint', function(source)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
        TriggerServerEvent('weapons:server:LSPDTintRemove')
        Wait(500)
        local spraytime = math.random(1500, 3500)
        QBCore.Functions.Progressbar("who_cares", "Painting weapon...", spraytime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(100)
            TriggerServerEvent('weapons:server:EquipTintLSPD', source)
        end)
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You are not holding a weapon...", "primary", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED WEAPON", "You are not holding a weapon...", 3500, "info")
        end
    end 
end)

RegisterNetEvent('weapons:client:OrangeTint', function(source)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
        TriggerServerEvent('weapons:server:OrangeTintRemove')
        Wait(500)
        local spraytime = math.random(1500, 3500)
        QBCore.Functions.Progressbar("who_cares", "Painting weapon...", spraytime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(100)
            TriggerServerEvent('weapons:server:EquipTintOrange', source)
        end)
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You are not holding a weapon...", "primary", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED WEAPON", "You are not holding a weapon...", 3500, "info")
        end
    end 
end)

RegisterNetEvent('weapons:client:PlatTint', function(source)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        TriggerEvent('animations:client:EmoteCommandStart', {"uncuff"})
        TriggerServerEvent('weapons:server:PlatTintRemove')
        Wait(500)
        local spraytime = math.random(1500, 3500)
        QBCore.Functions.Progressbar("who_cares", "Painting weapon...", spraytime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(100)
            TriggerServerEvent('weapons:server:EquipTintPlat', source)
        end)
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify("You are not holding a weapon...", "primary", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED WEAPON", "You are not holding a weapon...", 3500, "info")
        end
    end 
end)
```

5. Replace the --TINTS section of your server/main.lua i.e. replace lines 327-358 with the following:

```lua
-- TINTS

QBCore.Functions.CreateUseableItem('weapontint_black', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 0)
end)

---------
--GREEN--
---------

QBCore.Functions.CreateUseableItem('weapontint_green', function(source)
    TriggerClientEvent('weapons:client:GreenTint', source, 1)
    --TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

RegisterNetEvent('weapons:server:GreenTintRemove', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weapontint_green", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_green"], "remove", 1)
end)

RegisterNetEvent('weapons:server:EquipTintGreen', function(source)
    local src = source
    TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

--------
--GOLD--
--------

QBCore.Functions.CreateUseableItem('weapontint_gold', function(source)
    TriggerClientEvent('weapons:client:GoldTint', source, 1)
end)

RegisterNetEvent('weapons:server:GoldTintRemove', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weapontint_gold", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_gold"], "remove", 1)
end)

RegisterNetEvent('weapons:server:EquipTintGold', function(source)
    local src = source
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

--------
--PINK--
--------

QBCore.Functions.CreateUseableItem('weapontint_pink', function(source)
    TriggerClientEvent('weapons:client:PinkTint', source, 1)
    --TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

RegisterNetEvent('weapons:server:PinkTintRemove', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weapontint_pink", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_pink"], "remove", 1)
end)

RegisterNetEvent('weapons:server:EquipTintPink', function(source)
    local src = source
    TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

--------
--ARMY--
--------

QBCore.Functions.CreateUseableItem('weapontint_army', function(source)
    TriggerClientEvent('weapons:client:ArmyTint', source, 1)
    --TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

RegisterNetEvent('weapons:server:ArmyTintRemove', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weapontint_army", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_army"], "remove", 1)
end)

RegisterNetEvent('weapons:server:EquipTintArmy', function(source)
    local src = source
    TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

--------
--LSPD--
--------

QBCore.Functions.CreateUseableItem('weapontint_lspd', function(source)
    TriggerClientEvent('weapons:client:LSPDTint', source, 1)
end)

RegisterNetEvent('weapons:server:LSPDTintRemove', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weapontint_lspd", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_lspd"], "remove", 1)
end)

RegisterNetEvent('weapons:server:EquipTintLSPD', function(source)
    local src = source
    TriggerClientEvent('weapons:client:EquipTint', source, 5)
end)

----------
--ORANGE--
----------

QBCore.Functions.CreateUseableItem('weapontint_orange', function(source)
    TriggerClientEvent('weapons:client:OrangeTint', source, 1)
end)

RegisterNetEvent('weapons:server:OrangeTintRemove', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weapontint_orange", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_orange"], "remove", 1)
end)

RegisterNetEvent('weapons:server:EquipTintOrange', function(source)
    local src = source
    TriggerClientEvent('weapons:client:EquipTint', source, 6)
end)

------------
--PLATINUM--
------------

QBCore.Functions.CreateUseableItem('weapontint_plat', function(source)
    TriggerClientEvent('weapons:client:PlatTint', source, 1)
end)

RegisterNetEvent('weapons:server:PlatTintRemove', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weapontint_plat", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_plat"], "remove", 1)
end)

RegisterNetEvent('weapons:server:EquipTintPlat', function(source)
    local src = source
    TriggerClientEvent('weapons:client:EquipTint', source, 7)
end)
```

### C. QB-CORE/SHARED/ITEMS.LUA

5. Add the following items to qb-core/shared/items.lua (NOTE: IF YOU ARE RUNNING MZ-SCRAP THERE IS NO NEED TO ADD THE FIRST 3 ITEMS WHICH WILL ALREADY BE IN YOUR ITEMS.LUA):

```lua
	-- mz-tints
	["tinttoken"] 					 = {["name"] = "tinttoken", 					["label"] = "Tint Token", 		        ["weight"] = 200, 		["type"] = "item", 		["image"] = "tinttoken.png", 			["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A small badge like token which looks like a spray can?"},
```

### D. INVENTORY IMAGES

6. Add the images which appear in the "images" folder to your inventory images folder. If using lj-inventory, add the images to: lj-inventory/html/images/

### E. FINALISATION

7. If you attend to all of the above steps you will need to restart the server in order for the new added items to be recognised by qb-core. 

8. Please restart your server ensuring that mz-tints is ensured/starts after qb-core starts (ideally it should just form part of your [qb] folder).
