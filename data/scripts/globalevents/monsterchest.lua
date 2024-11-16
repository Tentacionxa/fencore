local config = {
    bossName     = 'Monster Chest',
    spawnPositions = {
        {pos = Position(32888, 33620, 14), name = 'Archangel Spawn'},
        {pos = Position(34864, 33210, 7), name = 'Roothing Cave'},
        {pos = Position(31579, 32177, 8), name = 'Roothing Swamp'},
        {pos = Position(34290, 31042, 9), name = 'Soul War 2'},re
        {pos = Position(34009, 31852, 14), name = 'Darklight Core Vemiath'},
        {pos = Position(31217, 31855, 5), name = 'Quara City'},
        {pos = Position(32050, 33730, 7), name = 'Deathling Universe'},
        {pos = Position(32024, 31614, 12), name = 'Bulltaur Underground'}
    }
}

local function spawnMonster()
    local randomIndex = math.random(#config.spawnPositions)
    local chosenSpawn = config.spawnPositions[randomIndex]
    local spawnSuccess = Game.createMonster(config.bossName, chosenSpawn.pos, false, true)

    if spawnSuccess then
        Game.broadcastMessage(config.bossName .. ' has spawned at ' .. chosenSpawn.name .. '!', MESSAGE_GAME_HIGHLIGHT)
    else
        Game.broadcastMessage('Failed to spawn ' .. config.bossName .. ' at ' .. chosenSpawn.name .. '.', MESSAGE_EVENT_ADVANCE)
    end
end

local MonsterchestEvent = GlobalEvent("MonsterchestEvent")
function MonsterchestEvent.onTime(interval)
    spawnMonster()
    return true
end

-- Register spawn times at 16:00 and 20:00
MonsterchestEvent:time("15:00:00")
MonsterchestEvent:time("19:00:00")

MonsterchestEvent:register()
