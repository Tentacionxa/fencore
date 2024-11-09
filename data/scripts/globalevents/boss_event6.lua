local config = {
    bossPosition = Position(32945, 33474, 4),
    bossName     = 'God Odyn',
    spawnTime    = '20:00:00',
    monsterName  = 'Archangel',
    monsterSpawnPositions = {
        Position(32943, 33472, 4),
        Position(32946, 33475, 4),
        Position(32947, 33472, 4),
        Position(32944, 33476, 4),
        Position(32948, 33474, 4),
        Position(32948, 33472, 4),
        Position(32942, 33473, 4),
        Position(32950, 33475, 4),
        Position(32948, 33472, 4),
        Position(32946, 33469, 4)
    }
}

local GodOdynRespawn = GlobalEvent("GodOdynRespawn")
function GodOdynRespawn.onTime(interval)
    local currentDay = os.date("%A")
    if currentDay == "Friday" then
        -- Spawn the boss
        Game.createMonster(config.bossName, config.bossPosition, false, true)

        -- Spawn 10 monsters called "Archangel"
        for i, spawnPos in ipairs(config.monsterSpawnPositions) do
            Game.createMonster(config.monsterName, spawnPos, false, true)
        end

        Game.broadcastMessage(config.bossName .. ' and his Archangels landed in Heaven to fight against injustice!', MESSAGE_GAME_HIGHLIGHT)
    end
    return true
end

GodOdynRespawn:time(config.spawnTime)
GodOdynRespawn:register()
