local config = {
    bossPosition = Position(32927, 33447, 4),
    bossName     = 'Azazel',
    spawnTime    = '17:00:00',
    monsterName  = 'Hells Core',
    monsterSpawnPositions = {
        Position(32926, 33449, 4),
        Position(32927, 33450, 4),
        Position(32926, 33451, 4),
        Position(32928, 33453, 4),
        Position(32925, 33448, 4),
        Position(32925, 33453, 4),
        Position(32930, 33456, 4),
        Position(32931, 33448, 4),
        Position(32923, 33448, 4),
        Position(32925, 33456, 4)
    }
}

local AzazelRespawn = GlobalEvent("AzazelRespawn")
function AzazelRespawn.onTime(interval)
    local currentDay = os.date("%A")
    if currentDay == "Saturday" then
        -- Spawn the boss
        Game.createMonster(config.bossName, config.bossPosition, false, true)

        -- Spawn 10 monsters called "Archangel"
        for i, spawnPos in ipairs(config.monsterSpawnPositions) do
            Game.createMonster(config.monsterName, spawnPos, false, true)
        end

        Game.broadcastMessage(config.bossName .. ' and his slaves landed in Heaven to destroy the Heavens World!', MESSAGE_GAME_HIGHLIGHT)
    end
    return true
end

AzazelRespawn:time(config.spawnTime)
AzazelRespawn:register()
