local killLog = {}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50) 

        local playerPed = PlayerPedId()
        for _, playerId in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(playerId)
            if DoesEntityExist(targetPed) and IsPedAPlayer(targetPed) then
                local killer = GetPedSourceOfDeath(targetPed)

                if killer == playerPed then
                    trackKill()
                end
            end
        end
    end
end)

function trackKill()
    local currentTime = GetGameTimer()

    for i = #killLog, 1, -1 do
        if (currentTime - killLog[i]) > 300 then
            table.remove(killLog, i)
        end
    end

    table.insert(killLog, currentTime)

    if #killLog >= 3 then
        TriggerServerEvent("anticheat:playerKillWarning")
    end
end
