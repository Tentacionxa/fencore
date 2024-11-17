local config = {
    bossName     = 'Whizzer',
    spawnTime    = '17:00:00',
    spawnPosition = Position(32482, 32405, 15),  -- Spawn position for the boss
}

local WhizzerEvent = GlobalEvent("WhizzerEvent")
function WhizzerEvent.onTime(interval)
    -- Generate boss at the specified position
    Game.createMonster(config.bossName, config.spawnPosition, false, true)
    Game.broadcastMessage(config.bossName .. ' has entered the Boss Arena. Catch him if You can!', MESSAGE_GAME_HIGHLIGHT)
    return true
end

WhizzerEvent:time(config.spawnTime)
WhizzerEvent:register()
