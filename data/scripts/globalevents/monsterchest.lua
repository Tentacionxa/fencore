local config = {
    bossName     = 'Monster Chest',
    spawnPositions = {
        {pos = Position(32888, 33620, 14), name = 'Archangel Spawn'},
        {pos = Position(32935, 33899, 14), name = 'Holy Guard'},
        {pos = Position(33306, 33736, 8), name = 'Griish Knight'},
        {pos = Position(32776, 33625, 8), name = 'Griish Scout'},
        {pos = Position(33086, 33708, 8), name = 'Griish Priestess'},
        {pos = Position(32410, 33467, 8), name = 'Griish Mage'},
        {pos = Position(34864, 33210, 7), name = 'Roothing Cave'},
        {pos = Position(31579, 32177, 8), name = 'Roothing Swamp'},
        {pos = Position(34290, 31042, 9), name = 'Soul War 2'},
        {pos = Position(34227, 31017, 11), name = 'Soul War 3'},
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

-- Event registration for 07:00:00
local MonsterchestEvent1 = GlobalEvent("MonsterchestEvent1")
function MonsterchestEvent1.onTime(interval)
    spawnMonster()
    return true
end
MonsterchestEvent1:time("07:00:00")
MonsterchestEvent1:register()

-- Event registration for 11:00:00
local MonsterchestEvent2 = GlobalEvent("MonsterchestEvent2")
function MonsterchestEvent2.onTime(interval)
    spawnMonster()
    return true
end
MonsterchestEvent2:time("11:00:00")
MonsterchestEvent2:register()

-- Event registration for 13:00:00
local MonsterchestEvent3 = GlobalEvent("MonsterchestEvent3")
function MonsterchestEvent3.onTime(interval)
    spawnMonster()
    return true
end
MonsterchestEvent3:time("14:00:00")
MonsterchestEvent3:register()

-- Event registration for 15:00:00
local MonsterchestEvent4 = GlobalEvent("MonsterchestEvent4")
function MonsterchestEvent4.onTime(interval)
    spawnMonster()
    return true
end
MonsterchestEvent4:time("16:00:00")
MonsterchestEvent4:register()

-- Event registration for 19:00:00
local MonsterchestEvent5 = GlobalEvent("MonsterchestEvent5")
function MonsterchestEvent5.onTime(interval)
    spawnMonster()
    return true
end
MonsterchestEvent5:time("19:00:00")
MonsterchestEvent5:register()
