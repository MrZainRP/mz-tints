local QBCore = exports['qb-core']:GetCoreObject()

local ItemList = {
    ["tinttoken"] = "tinttoken",
}

RegisterServerEvent('mz-tints:server:GiveToken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(QBCore.Shared.Items["tinttoken"].name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["tinttoken"], "add", 1)
end)

------------------------
--GET TERMPORARY TINTS--
------------------------

RegisterServerEvent('mz-tints:server:GetTint1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.GreenCost then 
                Player.Functions.RemoveItem("tinttoken", Config.GreenCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.GreenCost)
                Player.Functions.AddItem(QBCore.Shared.Items["weapontint_green"].name, Config.CansReturned)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_green"], "add", Config.CansReturned)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for these spray cans... (Need: "..Config.GreenCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for these spray cans... (Need: "..Config.GreenCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetTint2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.GoldCost then 
                Player.Functions.RemoveItem("tinttoken", Config.GoldCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.GoldCost)
                Player.Functions.AddItem(QBCore.Shared.Items["weapontint_gold"].name, Config.CansReturned)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_gold"], "add", Config.CansReturned)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for these spray cans... (Need: "..Config.GoldCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for these spray cans... (Need: "..Config.GoldCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetTint3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.PinkCost then 
                Player.Functions.RemoveItem("tinttoken", Config.PinkCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.PinkCost)
                Player.Functions.AddItem(QBCore.Shared.Items["weapontint_pink"].name, Config.CansReturned)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_pink"], "add", Config.CansReturned)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for these spray cans... (Need: "..Config.PinkCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for these spray cans... (Need: "..Config.PinkCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetTint4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.ArmyCost then 
                Player.Functions.RemoveItem("tinttoken", Config.ArmyCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.ArmyCost)
                Player.Functions.AddItem(QBCore.Shared.Items["weapontint_army"].name, Config.CansReturned)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_army"], "add", Config.CansReturned)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for these spray cans... (Need: "..Config.ArmyCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for these spray cans... (Need: "..Config.ArmyCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetTint5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.PoliceCost then 
                Player.Functions.RemoveItem("tinttoken", Config.PoliceCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.PoliceCost)
                Player.Functions.AddItem(QBCore.Shared.Items["weapontint_lspd"].name, Config.CansReturned)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_lspd"], "add", Config.CansReturned)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for these spray cans... (Need: "..Config.PoliceCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for these spray cans... (Need: "..Config.PoliceCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetTint6', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.OrangeCost then 
                Player.Functions.RemoveItem("tinttoken", Config.OrangeCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.OrangeCost)
                Player.Functions.AddItem(QBCore.Shared.Items["weapontint_orange"].name, Config.CansReturned)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_orange"], "add", Config.CansReturned)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for these spray cans... (Need: "..Config.OrangeCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for these spray cans... (Need: "..Config.OrangeCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetTint7', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.PlatinumCost then 
                Player.Functions.RemoveItem("tinttoken", Config.PlatinumCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.PlatinumCost)
                Player.Functions.AddItem(QBCore.Shared.Items["weapontint_plat"].name, Config.CansReturned)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapontint_plat"], "add", Config.CansReturned)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for these spray cans... (Need: "..Config.PlatinumCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for these spray cans... (Need: "..Config.PlatinumCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterNetEvent('mz-tints:server:PayReturn1', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Config.MoneyType == "dirtymoney" then 
        local amount = math.random(Config.Type1XPReturnLow, Config.Type1XPReturnHigh)
        Player.Functions.AddItem('dirtymoney', amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", amount)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "markedbills" then
        local info = {
            worth = math.random(Config.Type1XPReturnLow, Config.Type1XPReturnHigh)
        }
        Player.Functions.AddItem('markedbills', 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..info.worth.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..info.worth.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "cash" then
        local cleanmoney = math.random(Config.Type1XPReturnLow, Config.Type1XPReturnHigh)
        Player.Functions.AddMoney('cash', cleanmoney)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    else
        print("You have not properly configured 'Config.MoneyType', please refer to config.lua")
    end
end)

RegisterNetEvent('mz-tints:server:PayReturn2', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Config.MoneyType == "dirtymoney" then 
        local amount = math.random(Config.Type2XPReturnLow, Config.Type2XPReturnHigh)
        Player.Functions.AddItem('dirtymoney', amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", amount)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "markedbills" then
        local info = {
            worth = math.random(Config.Type2XPReturnLow, Config.Type2XPReturnHigh)
        }
        Player.Functions.AddItem('markedbills', 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..info.worth.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..info.worth.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "cash" then
        local cleanmoney = math.random(Config.Type2XPReturnLow, Config.Type2XPReturnHigh)
        Player.Functions.AddMoney('cash', cleanmoney)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    else
        print("You have not properly configured 'Config.MoneyType', please refer to config.lua")
    end
end)

RegisterNetEvent('mz-tints:server:PayReturn3', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Config.MoneyType == "dirtymoney" then 
        local amount = math.random(Config.Type3XPReturnLow, Config.Type3XPReturnHigh)
        Player.Functions.AddItem('dirtymoney', amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", amount)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "markedbills" then
        local info = {
            worth = math.random(Config.Type3XPReturnLow, Config.Type3XPReturnHigh)
        }
        Player.Functions.AddItem('markedbills', 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..info.worth.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..info.worth.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "cash" then
        local cleanmoney = math.random(Config.Type3XPReturnLow, Config.Type3XPReturnHigh)
        Player.Functions.AddMoney('cash', cleanmoney)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    else
        print("You have not properly configured 'Config.MoneyType', please refer to config.lua")
    end
end)

RegisterNetEvent('mz-tints:server:PayReturn4', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Config.MoneyType == "dirtymoney" then 
        local amount = math.random(Config.Type4XPReturnLow, Config.Type4XPReturnHigh)
        Player.Functions.AddItem('dirtymoney', amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", amount)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "markedbills" then
        local info = {
            worth = math.random(Config.Type4XPReturnLow, Config.Type4XPReturnHigh)
        }
        Player.Functions.AddItem('markedbills', 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..info.worth.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..info.worth.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "cash" then
        local cleanmoney = math.random(Config.Type4XPReturnLow, Config.Type4XPReturnHigh)
        Player.Functions.AddMoney('cash', cleanmoney)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    else
        print("You have not properly configured 'Config.MoneyType', please refer to config.lua")
    end
end)

RegisterNetEvent('mz-tints:server:PayReturn5', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Config.MoneyType == "dirtymoney" then 
        local amount = math.random(Config.Type5XPReturnLow, Config.Type5XPReturnHigh)
        Player.Functions.AddItem('dirtymoney', amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", amount)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "markedbills" then
        local info = {
            worth = math.random(Config.Type5XPReturnLow, Config.Type5XPReturnHigh)
        }
        Player.Functions.AddItem('markedbills', 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..info.worth.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..info.worth.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "cash" then
        local cleanmoney = math.random(Config.Type5XPReturnLow, Config.Type5XPReturnHigh)
        Player.Functions.AddMoney('cash', cleanmoney)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    else
        print("You have not properly configured 'Config.MoneyType', please refer to config.lua")
    end
end)

RegisterNetEvent('mz-tints:server:PayReturn6', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Config.MoneyType == "dirtymoney" then 
        local amount = math.random(Config.Type6XPReturnLow, Config.Type6XPReturnHigh)
        Player.Functions.AddItem('dirtymoney', amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", amount)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "markedbills" then
        local info = {
            worth = math.random(Config.Type6XPReturnLow, Config.Type6XPReturnHigh)
        }
        Player.Functions.AddItem('markedbills', 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..info.worth.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..info.worth.. "!", 4500, 'success')
        end
    elseif Config.MoneyType == "cash" then
        local cleanmoney = math.random(Config.Type6XPReturnLow, Config.Type6XPReturnHigh)
        Player.Functions.AddMoney('cash', cleanmoney)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "You exchanged your XP for $" ..amount.. "!", 'success', 4500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "XP EXCHANGED", "You exchanged your XP for $" ..amount.. "!", 4500, 'success')
        end
    else
        print("You have not properly configured 'Config.MoneyType', please refer to config.lua")
    end
end)

-----------------------
--GET PERMANENT TINTS--
-----------------------

RegisterServerEvent('mz-tints:server:GetPistolFinish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.PistolFinishCost then 
                Player.Functions.RemoveItem("tinttoken", Config.PistolFinishCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.PistolFinishCost)
                Player.Functions.AddItem(QBCore.Shared.Items["pistol_luxuryfinish"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pistol_luxuryfinish"], "add", 1)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for this luxury finish... (Need: "..Config.PistolFinishCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for this luxury finish... (Need: "..Config.PistolFinishCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetAPPistolFinish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.APPistolFinishCost then 
                Player.Functions.RemoveItem("tinttoken", Config.APPistolFinishCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.APPistolFinishCost)
                Player.Functions.AddItem(QBCore.Shared.Items["appistol_luxuryfinish"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["appistol_luxuryfinish"], "add", 1)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for this luxury finish... (Need: "..Config.APPistolFinishCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for this luxury finish... (Need: "..Config.APPistolFinishCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetPistol50Finish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.Pistol50FinishCost then 
                Player.Functions.RemoveItem("tinttoken", Config.Pistol50FinishCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.Pistol50FinishCost)
                Player.Functions.AddItem(QBCore.Shared.Items["pistol50_luxuryfinish"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pistol50_luxuryfinish"], "add", 1)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for this luxury finish... (Need: "..Config.Pistol50FinishCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for this luxury finish... (Need: "..Config.Pistol50FinishCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetMicroSMGFinish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.MicroSMGFinishCost then 
                Player.Functions.RemoveItem("tinttoken", Config.MicroSMGFinishCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.MicroSMGFinishCost)
                Player.Functions.AddItem(QBCore.Shared.Items["microsmg_luxuryfinish"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["microsmg_luxuryfinish"], "add", 1)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for this luxury finish... (Need: "..Config.MicroSMGFinishCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for this luxury finish... (Need: "..Config.MicroSMGFinishCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetSMGFinish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.SMGFinishCost then 
                Player.Functions.RemoveItem("tinttoken", Config.SMGFinishCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.SMGFinishCost)
                Player.Functions.AddItem(QBCore.Shared.Items["smg_luxuryfinish"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["smg_luxuryfinish"], "add", 1)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for this luxury finish... (Need: "..Config.SMGFinishCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for this luxury finish... (Need: "..Config.SMGFinishCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetAssaultRifleFinish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.AssaultRifleFinishCost then 
                Player.Functions.RemoveItem("tinttoken", Config.AssaultRifleFinishCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.AssaultRifleFinishCost)
                Player.Functions.AddItem(QBCore.Shared.Items["assaultrifle_luxuryfinish"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["assaultrifle_luxuryfinish"], "add", 1)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for this luxury finish... (Need: "..Config.AssaultRifleFinishCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for this luxury finish... (Need: "..Config.AssaultRifleFinishCost..".)", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-tints:server:GetSpecialCarbineFinish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tinttoken = Player.Functions.GetItemByName('tinttoken')
    if Player.PlayerData.items ~= nil then 
        if tinttoken ~= nil then 
            if tinttoken.amount >= Config.SpecialCarbineFinishCost then 
                Player.Functions.RemoveItem("tinttoken", Config.SpecialCarbineFinishCost)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tinttoken'], "remove", Config.SpecialCarbineFinishCost)
                Player.Functions.AddItem(QBCore.Shared.Items["specialcarbine_luxuryfinish"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["specialcarbine_luxuryfinish"], "add", 1)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough tokens for this luxury finish... (Need: "..Config.SpecialCarbineFinishCost..".)", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED TINT TOKENS", "You do not have enough tokens for this luxury finish... (Need: "..Config.SpecialCarbineFinishCost..".)", 3500, 'error')
                end
            end
        end
    end
end)