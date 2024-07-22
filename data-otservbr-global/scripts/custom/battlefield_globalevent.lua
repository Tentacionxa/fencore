local battlefield = GlobalEvent("Battlefield")
function battlefield.onTime(interval)
    if battlefield_totalPlayers() == 0 then
        eventsOutfit = {}
        battlefield_teleportCheck()
    else
        Spdlog.info(">> Battlefield event is already running.")
    end
    return true
end
battlefield:time("19:00:00")
battlefield:register()
