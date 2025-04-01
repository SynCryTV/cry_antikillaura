local killLog = {}
local checkedDeaths = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50) 

        local playerPed = PlayerPedId()
        for _, playerId in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(playerId)
            if DoesEntityExist(targetPed) and IsPedAPlayer(targetPed) then
                local targetServerId = GetPlayerServerId(playerId)
                
                if IsEntityDead(targetPed) then
                    local killer = GetPedSourceOfDeath(targetPed)
                    
                    if killer == playerPed and not checkedDeaths[targetServerId] then
                        checkedDeaths[targetServerId] = true
                        trackKill()
                        
                        Citizen.SetTimeout(30000, function()
                            checkedDeaths[targetServerId] = nil
                        end)
                    end
                end
            end
        end
    end
end)

function trackKill()
    local currentTime = GetGameTimer()
    
    table.insert(killLog, currentTime)
    
    for i = #killLog, 1, -1 do
        if (currentTime - killLog[i]) > 500 then
            table.remove(killLog, i)
        end
    end

    if #killLog >= 3 then
        TriggerServerEvent("anticheat:playerKillWarning")
    end
end
