RegisterServerEvent("anticheat:playerKillWarning")
AddEventHandler("anticheat:playerKillWarning", function()
    local _src = source
    local playerName = GetPlayerName(_src)
    local reason = "Kill-Exploit: Mehr als 3 Kills in 0,5 Sekunden"

    if not _src or _src == 0 then return end

    local targetNetId = GetPlayerPed(_src)
    local targetIds = { GetPlayerIdentifiers(_src) }

    if not targetNetId or not targetIds or #targetIds == 0 then
        print("Fehler: Keine gültigen Identifikatoren für den Spieler gefunden.")
        return
    end

    DropPlayer(_src, reason)

    print(("^1[AntiCheat]^0 Spieler %s (ID: %d) wurde wegen %s gekickt.")
        :format(playerName, _src, reason))
end)