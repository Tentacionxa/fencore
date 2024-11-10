local config = {
    bossName     = 'Azel',
    spawnTime    = '14:00:00',
    spawnPosition = Position(32482, 32405, 15),  -- Spawn position for the boss
}

local AzelEvent = GlobalEvent("AzelEvent")
function AzelEvent.onTime(interval)
    -- Generate boss at the specified position
    Game.createMonster(config.bossName, config.spawnPosition, false, true)
    Game.broadcastMessage(config.bossName .. ' has awaken. Fight him on the boss arena!', MESSAGE_GAME_HIGHLIGHT)
    return true
end

AzelEvent:time(config.spawnTime)
AzelEvent:register()
