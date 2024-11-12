local config = {
    bossName     = 'Gokushabaal',
    spawnTime    = '16:00:00',
    spawnPosition = Position(32476, 32407, 15),  -- Spawn position for the boss
}

local GokushabaalEvent = GlobalEvent("GokushabaalEvent")
function GokushabaalEvent.onTime(interval)
    -- Generate boss at the specified position
    Game.createMonster(config.bossName, config.spawnPosition, false, true)
    Game.broadcastMessage(config.bossName .. ' has entered the Boss Arena! Players, protect others from him!', MESSAGE_GAME_HIGHLIGHT)
    return true
end

GokushabaalEvent:time(config.spawnTime)
GokushabaalEvent:register()
