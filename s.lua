RegisterServerEvent("anticheat:playerKillWarning")
AddEventHandler("anticheat:playerKillWarning", function()
    local _src = source
    local playerName = GetPlayerName(_src)
    local reason = "Kill-Exploit: More than 3 kills in 0.5 seconds"
    
    if not _src or _src == 0 then return end
    
    local targetNetId = GetPlayerPed(_src)
    local targetIds = { GetPlayerIdentifiers(_src) }
    
    if not targetNetId or not targetIds or #targetIds == 0 then
        print("Error: No valid identifiers found for the player.")
        return
    end
    
    DropPlayer(_src, reason)
    
    print(("^1[AntiCheat]^0 Player %s (ID: %d) has been kicked for %s.")
        :format(playerName, _src, reason))
    
end)