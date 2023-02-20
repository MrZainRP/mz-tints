local QBCore = exports['qb-core']:GetCoreObject()

local tradeCheck1 = false 
local talkingBusy = false 

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        CreateTintPED()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    CreateTintPED()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Wait(100)
end)

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        DeletePed(TintBoss)  
	end 
end)

function loadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(0)
	end
end

function CreateTintPED()
    if not DoesEntityExist(TintBoss) then
        RequestModel(Config.TintPED) while not HasModelLoaded(Config.TintPED) do Wait(0) end
        TintBoss = CreatePed(0, Config.TintPED, Config.TintPEDCoords, false, false)
        SetEntityAsMissionEntity(TintBoss)
        SetPedFleeAttributes(TintBoss, 0, 0)
        SetBlockingOfNonTemporaryEvents(TintBoss, true)
        SetEntityInvincible(TintBoss, true)
        FreezeEntityPosition(TintBoss, true)
        loadAnimDict("amb@world_human_leaning@female@wall@back@holding_elbow@idle_a")        
        TaskPlayAnim(TintBoss, "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", 8.0, 1.0, -1, 01, 0, 0, 0, 0)
        exports['qb-target']:AddTargetEntity(TintBoss, { 
            options = {
                { 
                    num = 1,
                    type = "client",
                    event = "mz-tints:client:TradeSkill1",
                    icon = "fas fa-paint-brush",
                    label = "Trade "..Config.Type1XP.." XP",
                },
                { 
                    num = 2,
                    type = "client",
                    event = "mz-tints:client:TradeSkill2",
                    icon = "fas fa-paint-brush",
                    label = "Trade "..Config.Type2XP.." XP",
                },
                { 
                    num = 3,
                    type = "client",
                    event = "mz-tints:client:TradeSkill3",
                    icon = "fas fa-paint-brush",
                    label = "Trade "..Config.Type3XP.." XP",
                },
                { 
                    num = 4,
                    type = "client",
                    event = "mz-tints:client:TradeSkill4",
                    icon = "fas fa-paint-brush",
                    label = "Trade "..Config.Type4XP.." XP",
                },
                { 
                    num = 5,
                    type = "client",
                    event = "mz-tints:client:TradeSkill5",
                    icon = "fas fa-paint-brush",
                    label = "Trade "..Config.Type5XP.." XP",
                },
                { 
                    num = 6,
                    type = "client",
                    event = "mz-tints:client:TradeSkill6",
                    icon = "fas fa-paint-brush",
                    label = "Trade "..Config.Type6XP.." XP",
                },
            }, 
            distance = 1.5, 
        })
    end
end

RegisterNetEvent('mz-tints:client:TradeSkill1', function()
    if not talkingBusy then 
        talkingBusy = true 
        if not tradeCheck1 then 
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Like OMG, how did you find me?', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Like OMG, how did you find me?", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: Not sure, but I heard you have something fancy for weapons?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "Not sure, but I heard you have something fancy for weapons?", 2500, "success")
            end  
            Wait(2500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "thatshot", 0.5)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: OMG that\'s hawt. Yes I do, but it\'ll cost you!', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "OMG that\'s hawt. Yes I do, but it\'ll cost you!", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: How much?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "How much?", 2500, "success")
            end  
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla:'..Config.Type1XPCost.." "..Config.Type1XP.." XP for a token. Different paints cost different tokens.", "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", Config.Type1XPCost.." "..Config.Type1XP.." XP for a token. Different paints cost different tokens.", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Select this option again to confirm.', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Select this option again to confirm.", 2500, "info")
            end
            Wait(100)
            tradeCheck1 = true 
            talkingBusy = false 
        elseif tradeCheck1 then 
            exports["mz-skills"]:CheckSkill(Config.Type1XP, Config.Type1XPCost, function(hasskill)
                if hasskill then
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OK... Here you go!', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OK... Here you go!", 2500, "info")
                    end
                    Wait(500)
                    local deteriorate = -Config.Type1XPCost
                    exports["mz-skills"]:UpdateSkill(Config.Type1XP, deteriorate)
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('-'..Config.Type1XPCost.. 'XP to '..Config.Type1XP..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("SKILLS", '-'..Config.Type1XPCost.. 'XP to '..Config.Type1XP..".", 3500, "error")
                    end   
                    Wait(750)
                    TriggerServerEvent('mz-tints:server:GiveToken')
                    Wait(500)
                    if Config.MoneyReturn then 
                        TriggerServerEvent('mz-tints:server:PayReturn1') 
                    end 
                    talkingBusy = false 
                else 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OMG you need a bit more skill than that sweety...', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OMG you need a bit more skill than that sweety...", 2500, "info")
                    end
                end
            end)
        end 
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Layla: UM, rude! I\'m talking to you!', "error", 2500)
        elseif Config.NotifyType == 'okok' then 
            exports['okokNotify']:Alert("LAYLA", "UM, rude! I\'m talking to you!", 2500, "error")
        end
    end 
end)

RegisterNetEvent('mz-tints:client:TradeSkill2', function()
    if not talkingBusy then 
        talkingBusy = true 
        if not tradeCheck2 then 
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Like OMG, how did you find me?', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Like OMG, how did you find me?", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: Not sure, but I heard you have something fancy for weapons?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "Not sure, but I heard you have something fancy for weapons?", 2500, "success")
            end  
            Wait(2500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "thatshot", 0.5)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: OMG that\'s hawt. Yes I do, but it\'ll cost you!', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "OMG that\'s hawt. Yes I do, but it\'ll cost you!", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: How much?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "How much?", 2500, "success")
            end  
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla:'..Config.Type2XPCost.." "..Config.Type2XP.." XP for a token. Different paints cost different tokens.", "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", Config.Type2XPCost.." "..Config.Type2XP.." XP for a token. Different paints cost different tokens.", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Select this option again to confirm.', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Select this option again to confirm.", 2500, "info")
            end
            Wait(100)
            tradeCheck2 = true 
            talkingBusy = false 
        elseif tradeCheck2 then 
            exports["mz-skills"]:CheckSkill(Config.Type2XP, Config.Type2XPCost, function(hasskill)
                if hasskill then
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OK... Here you go!', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OK... Here you go!", 2500, "info")
                    end
                    Wait(500)
                    local deteriorate = -Config.Type2XPCost
                    exports["mz-skills"]:UpdateSkill(Config.Type2XP, deteriorate)
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('-'..Config.Type2XPCost.. 'XP to '..Config.Type2XP..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("SKILLS", '-'..Config.Type2XPCost.. 'XP to '..Config.Type2XP..".", 3500, "error")
                    end   
                    Wait(750)
                    TriggerServerEvent('mz-tints:server:GiveToken')
                    Wait(500)
                    if Config.MoneyReturn then 
                        TriggerServerEvent('mz-tints:server:PayReturn2') 
                    end 
                    talkingBusy = false 
                else 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OMG you need a bit more skill than that sweety...', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OMG you need a bit more skill than that sweety...", 2500, "info")
                    end
                end
            end)
        end 
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Layla: UM, rude! I\'m talking to you!', "error", 2500)
        elseif Config.NotifyType == 'okok' then 
            exports['okokNotify']:Alert("LAYLA", "UM, rude! I\'m talking to you!", 2500, "error")
        end
    end 
end)

RegisterNetEvent('mz-tints:client:TradeSkill3', function()
    if not talkingBusy then 
        talkingBusy = true 
        if not tradeCheck3 then 
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Like OMG, how did you find me?', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Like OMG, how did you find me?", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: Not sure, but I heard you have something fancy for weapons?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "Not sure, but I heard you have something fancy for weapons?", 2500, "success")
            end  
            Wait(2500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "thatshot", 0.5)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: OMG that\'s hawt. Yes I do, but it\'ll cost you!', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "OMG that\'s hawt. Yes I do, but it\'ll cost you!", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: How much?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "How much?", 2500, "success")
            end  
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla:'..Config.Type3XPCost.." "..Config.Type3XP.." XP for a token. Different paints cost different tokens.", "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", Config.Type3XPCost.." "..Config.Type3XP.." XP for a token. Different paints cost different tokens.", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Select this option again to confirm.', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Select this option again to confirm.", 2500, "info")
            end
            Wait(100)
            tradeCheck3 = true 
            talkingBusy = false 
        elseif tradeCheck3 then 
            exports["mz-skills"]:CheckSkill(Config.Type3XP, Config.Type3XPCost, function(hasskill)
                if hasskill then
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OK... Here you go!', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OK... Here you go!", 2500, "info")
                    end
                    Wait(500)
                    local deteriorate = -Config.Type3XPCost
                    exports["mz-skills"]:UpdateSkill(Config.Type3XP, deteriorate)
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('-'..Config.Type3XPCost.. 'XP to '..Config.Type3XP..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("SKILLS", '-'..Config.Type3XPCost.. 'XP to '..Config.Type3XP..".", 3500, "error")
                    end  
                    Wait(750)
                    TriggerServerEvent('mz-tints:server:GiveToken')
                    Wait(500)
                    if Config.MoneyReturn then 
                        TriggerServerEvent('mz-tints:server:PayReturn3') 
                    end 
                    talkingBusy = false 
                else 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OMG you need a bit more skill than that sweety...', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OMG you need a bit more skill than that sweety...", 2500, "info")
                    end
                end
            end)
        end 
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Layla: UM, rude! I\'m talking to you!', "error", 2500)
        elseif Config.NotifyType == 'okok' then 
            exports['okokNotify']:Alert("LAYLA", "UM, rude! I\'m talking to you!", 2500, "error")
        end
    end 
end)

RegisterNetEvent('mz-tints:client:TradeSkill4', function()
    if not talkingBusy then 
        talkingBusy = true 
        if not tradeCheck4 then 
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Like OMG, how did you find me?', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Like OMG, how did you find me?", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: Not sure, but I heard you have something fancy for weapons?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "Not sure, but I heard you have something fancy for weapons?", 2500, "success")
            end  
            Wait(2500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "thatshot", 0.5)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: OMG that\'s hawt. Yes I do, but it\'ll cost you!', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "OMG that\'s hawt. Yes I do, but it\'ll cost you!", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: How much?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "How much?", 2500, "success")
            end  
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla:'..Config.Type4XPCost.." "..Config.Type4XP.." XP for a token. Different paints cost different tokens.", "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", Config.Type4XPCost.." "..Config.Type4XP.." XP for a token. Different paints cost different tokens.", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Select this option again to confirm.', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Select this option again to confirm.", 2500, "info")
            end
            Wait(100)
            tradeCheck4 = true 
            talkingBusy = false 
        elseif tradeCheck4 then 
            exports["mz-skills"]:CheckSkill(Config.Type4XP, Config.Type4XPCost, function(hasskill)
                if hasskill then
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OK... Here you go!', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OK... Here you go!", 2500, "info")
                    end
                    Wait(500)
                    local deteriorate = -Config.Type4XPCost
                    exports["mz-skills"]:UpdateSkill(Config.Type4XP, deteriorate)
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('-'..Config.Type4XPCost.. 'XP to '..Config.Type4XP..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("SKILLS", '-'..Config.Type4XPCost.. 'XP to '..Config.Type4XP..".", 3500, "error")
                    end  
                    Wait(750)
                    TriggerServerEvent('mz-tints:server:GiveToken')
                    Wait(500)
                    if Config.MoneyReturn then 
                        TriggerServerEvent('mz-tints:server:PayReturn4') 
                    end 
                    talkingBusy = false 
                else 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OMG you need a bit more skill than that sweety...', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OMG you need a bit more skill than that sweety...", 2500, "info")
                    end
                end
            end)
        end 
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Layla: UM, rude! I\'m talking to you!', "error", 2500)
        elseif Config.NotifyType == 'okok' then 
            exports['okokNotify']:Alert("LAYLA", "UM, rude! I\'m talking to you!", 2500, "error")
        end
    end 
end)

RegisterNetEvent('mz-tints:client:TradeSkill5', function()
    if not talkingBusy then 
        talkingBusy = true 
        if not tradeCheck5 then 
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Like OMG, how did you find me?', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Like OMG, how did you find me?", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: Not sure, but I heard you have something fancy for weapons?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "Not sure, but I heard you have something fancy for weapons?", 2500, "success")
            end  
            Wait(2500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "thatshot", 0.5)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: OMG that\'s hawt. Yes I do, but it\'ll cost you!', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "OMG that\'s hawt. Yes I do, but it\'ll cost you!", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: How much?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "How much?", 2500, "success")
            end  
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla:'..Config.Type5XPCost.." "..Config.Type5XP.." XP for a token. Different paints cost different tokens.", "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", Config.Type5XPCost.." "..Config.Type5XP.." XP for a token. Different paints cost different tokens.", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Select this option again to confirm.', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Select this option again to confirm.", 2500, "info")
            end
            Wait(100)
            tradeCheck5 = true 
            talkingBusy = false 
        elseif tradeCheck5 then 
            exports["mz-skills"]:CheckSkill(Config.Type5XP, Config.Type5XPCost, function(hasskill)
                if hasskill then
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OK... Here you go!', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OK... Here you go!", 2500, "info")
                    end
                    Wait(500)
                    local deteriorate = -Config.Type5XPCost
                    exports["mz-skills"]:UpdateSkill(Config.Type5XP, deteriorate)
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('-'..Config.Type5XPCost.. 'XP to '..Config.Type5XP..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("SKILLS", '-'..Config.Type5XPCost.. 'XP to '..Config.Type5XP..".", 3500, "error")
                    end  
                    Wait(750)
                    TriggerServerEvent('mz-tints:server:GiveToken')
                    Wait(500)
                    if Config.MoneyReturn then 
                        TriggerServerEvent('mz-tints:server:PayReturn5') 
                    end 
                    talkingBusy = false 
                else 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OMG you need a bit more skill than that sweety...', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OMG you need a bit more skill than that sweety...", 2500, "info")
                    end
                end
            end)
        end 
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Layla: UM, rude! I\'m talking to you!', "error", 2500)
        elseif Config.NotifyType == 'okok' then 
            exports['okokNotify']:Alert("LAYLA", "UM, rude! I\'m talking to you!", 2500, "error")
        end
    end 
end)

RegisterNetEvent('mz-tints:client:TradeSkill6', function()
    if not talkingBusy then 
        talkingBusy = true 
        if not tradeCheck6 then 
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Like OMG, how did you find me?', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Like OMG, how did you find me?", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: Not sure, but I heard you have something fancy for weapons?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "Not sure, but I heard you have something fancy for weapons?", 2500, "success")
            end  
            Wait(2500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "thatshot", 0.5)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: OMG that\'s hawt. Yes I do, but it\'ll cost you!', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "OMG that\'s hawt. Yes I do, but it\'ll cost you!", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify("You: How much?", "success", 2500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("YOU", "How much?", 2500, "success")
            end  
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla:'..Config.Type6XPCost.." "..Config.Type6XP.." XP for a token. Different paints cost different tokens.", "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", Config.Type6XPCost.." "..Config.Type6XP.." XP for a token. Different paints cost different tokens.", 2500, "info")
            end
            Wait(2500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Layla: Select this option again to confirm.', "primary", 2500)
            elseif Config.NotifyType == 'okok' then 
                exports['okokNotify']:Alert("LAYLA", "Select this option again to confirm.", 2500, "info")
            end
            Wait(100)
            tradeCheck6 = true 
            talkingBusy = false 
        elseif tradeCheck6 then 
            exports["mz-skills"]:CheckSkill(Config.Type6XP, Config.Type6XPCost, function(hasskill)
                if hasskill then
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OK... Here you go!', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OK... Here you go!", 2500, "info")
                    end
                    Wait(500)
                    local deteriorate = -Config.Type6XPCost
                    exports["mz-skills"]:UpdateSkill(Config.Type6XP, deteriorate)
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('-'..Config.Type6XPCost.. 'XP to '..Config.Type6XP..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("SKILLS", '-'..Config.Type6XPCost.. 'XP to '..Config.Type6XP..".", 3500, "error")
                    end  
                    Wait(750)
                    TriggerServerEvent('mz-tints:server:GiveToken')
                    Wait(500)
                    if Config.MoneyReturn then 
                        TriggerServerEvent('mz-tints:server:PayReturn6') 
                    end 
                    talkingBusy = false 
                else 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('Layla: OMG you need a bit more skill than that sweety...', "primary", 2500)
                    elseif Config.NotifyType == 'okok' then 
                        exports['okokNotify']:Alert("LAYLA", "OMG you need a bit more skill than that sweety...", 2500, "info")
                    end
                end
            end)
        end 
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Layla: UM, rude! I\'m talking to you!', "error", 2500)
        elseif Config.NotifyType == 'okok' then 
            exports['okokNotify']:Alert("LAYLA", "UM, rude! I\'m talking to you!", 2500, "error")
        end
    end 
end)

-----------------------
--GET TEMPORARY TINTS--
-----------------------

CreateThread(function()
    exports['qb-target']:AddBoxZone("getTints1", vector3(-206.25, -1341.65, 34.89), 1.2, 0.4, {
        name = "getTints1",
        heading = 45,
        debugPoly = false,
        minZ = 32.09,
        maxZ = 36.09,
        }, {
            options = { 
            {
                num = 1, 
                type = "client",
                event = "mz-tints:client:getTint1",
                icon = 'fas fa-paint-brush',
                label = 'Get Green Tint (Cost:'..Config.GreenCost..' token)'
            },
            {
                num = 2, 
                type = "client",
                event = "mz-tints:client:getTint2",
                icon = 'fas fa-paint-brush',
                label = 'Get Gold Tint (Cost:'..Config.GoldCost..' token)'
            },
            {
                num = 3, 
                type = "client",
                event = "mz-tints:client:getTint3",
                icon = 'fas fa-paint-brush',
                label = 'Get Pink Tint (Cost:'..Config.PinkCost..' token)'
            },
            {
                num = 4, 
                type = "client",
                event = "mz-tints:client:getTint4",
                icon = 'fas fa-paint-brush',
                label = 'Get Army Tint (Cost:'..Config.ArmyCost..' token)'
            },
            {
                num = 5, 
                type = "client",
                event = "mz-tints:client:getTint5",
                icon = 'fas fa-paint-brush',
                label = 'Get Police Tint (Cost:'..Config.PoliceCost..' token)'
            },
            {
                num = 6, 
                type = "client",
                event = "mz-tints:client:getTint6",
                icon = 'fas fa-paint-brush',
                label = 'Get Orange Tint (Cost:'..Config.OrangeCost..' token)'
            },
            {
                num = 7, 
                type = "client",
                event = "mz-tints:client:getTint7",
                icon = 'fas fa-paint-brush',
                label = 'Get Platinum Tint (Cost:'..Config.PlatinumCost..' token)'
            },
        },
        distance = 1.5, 
     })
end)

RegisterNetEvent('mz-tints:client:getTint1', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetTint1")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.GreenCost..' tokens for '..Config.CansReturned.. 'spray cans', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.GreenCost..' tokens for '..Config.CansReturned.. 'spray cans', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getTint2', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetTint2")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.GoldCost..' tokens for '..Config.CansReturned.. 'spray cans', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.GoldCost..' tokens for '..Config.CansReturned.. 'spray cans', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getTint3', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetTint3")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.PinkCost..' tokens for '..Config.CansReturned.. 'spray cans', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.PinkCost..' tokens for '..Config.CansReturned.. 'spray cans', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getTint4', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetTint4")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.ArmyCost..' tokens for '..Config.CansReturned.. 'spray cans', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.ArmyCost..' tokens for '..Config.CansReturned.. 'spray cans', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getTint5', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetTint5")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.PoliceCost..' tokens for '..Config.CansReturned.. 'spray cans', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.PoliceCost..' tokens for '..Config.CansReturned.. 'spray cans', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getTint6', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetTint6")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.OrangeCost..' tokens for '..Config.CansReturned.. 'spray cans', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.OrangeCost..' tokens for '..Config.CansReturned.. 'spray cans', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getTint7', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetTint7")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.PlatinumCost..' tokens for '..Config.CansReturned.. 'spray cans', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.PlatinumCost..' tokens for '..Config.CansReturned.. 'spray cans', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

-----------------------
--GET PERMANENT TINTS--
-----------------------

CreateThread(function()
    exports['qb-target']:AddBoxZone("getTintsPremium", vector3(-1812.73, 3092.03, 32.84), 1.2, 0.4, {
        name = "getTintsPremium",
        heading = 45,
        debugPoly = false,
        minZ = 30.04,
        maxZ = 34.04,
        }, {
            options = { 
            {
                num = 1, 
                type = "client",
                event = "mz-tints:client:getPistolFinish",
                icon = 'fas fa-paint-brush',
                label = 'Get Pistol Luxury Finish'
            },
            {
                num = 2, 
                type = "client",
                event = "mz-tints:client:getAPPistolFinish",
                icon = 'fas fa-paint-brush',
                label = 'Get AP Pistol Luxury Finish'
            },
            {
                num = 3, 
                type = "client",
                event = "mz-tints:client:getPistol50Finish",
                icon = 'fas fa-paint-brush',
                label = 'Get Pistol 50 Luxury Finish'
            },
            {
                num = 4, 
                type = "client",
                event = "mz-tints:client:getMicroSMGFinish",
                icon = 'fas fa-paint-brush',
                label = 'Get Micro SMG Luxury Finish'
            },
            {
                num = 5, 
                type = "client",
                event = "mz-tints:client:getSMGFinish",
                icon = 'fas fa-paint-brush',
                label = 'Get SMG Luxury Finish'
            },
            {
                num = 6, 
                type = "client",
                event = "mz-tints:client:getAssaultRifleFinish",
                icon = 'fas fa-paint-brush',
                label = 'Get Assault Rifle Luxury Finish'
            },
            {
                num = 7, 
                type = "client",
                event = "mz-tints:client:getSpecialCarbineFinish",
                icon = 'fas fa-paint-brush',
                label = 'Get Special Carbine Luxury Finish'
            },
        },
        distance = 1.5, 
     })
end)

RegisterNetEvent('mz-tints:client:getPistolFinish', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetPistolFinish")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.PistolFinishCost..' tokens for a pistol luxury finish', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.PistolFinishCost..' tokens for a pistol luxury finish', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getAPPistolFinish', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetAPPistolFinish")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.APPistolFinishCost..' tokens for an AP pistol luxury finish', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.APPistolFinishCost..' tokens for an AP pistol luxury finish', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getPistol50Finish', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetPistol50Finish")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.Pistol50FinishCost..' tokens for a pistol 50 luxury finish', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.Pistol50FinishCost..' tokens for a pistol 50 luxury finish', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getMicroSMGFinish', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetMicroSMGFinish")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.MicroSMGFinishCost..' tokens for a Micro SMG luxury finish', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.MicroSMGFinishCost..' tokens for a Micro SMG luxury finish', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getSMGFinish', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetSMGFinish")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.SMGFinishCost..' tokens for a SMG luxury finish', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.SMGFinishCost..' tokens for a SMG luxury finish', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getAssaultRifleFinish', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetAssaultRifleFinish")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.AssaultRifleFinishCost..' tokens for an Assault Rifle luxury finish', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.AssaultRifleFinishCost..' tokens for an Assault Rifle luxury finish', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)

RegisterNetEvent('mz-tints:client:getSpecialCarbineFinish', function()
    if QBCore.Functions.HasItem("tinttoken") then
        TriggerServerEvent("mz-tints:server:GetSpecialCarbineFinish")
    else
        local requiredItems = {
            [1] = {name = QBCore.Shared.Items["tinttoken"]["name"], image = QBCore.Shared.Items["tinttoken"]["image"]}, 
        }  
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You need '..Config.SpecialCarbineFinishCost..' tokens for a Special Carbine luxury finish', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("NEED TINT TOKENS", 'You need '..Config.SpecialCarbineFinishCost..' tokens for a Special Carbine luxury finish', 3500, "error")
        end   
        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
        Wait(3000)
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
end)