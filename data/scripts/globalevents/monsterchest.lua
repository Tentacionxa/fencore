local config = {
    bossName     = 'Monster Chest',
    spawnPositions = {
        {pos = Position(32888, 33620, 14), name = 'Archangel Spawn'},
        {pos = Position(34864, 33210, 7), name = 'Roothing Cave'},
        {pos = Position(31579, 32177, 8), name = 'Roothing Swamp'},
        {pos = Position(34290, 31042, 9), name = 'Soul War 2'},
        {pos = Position(34009, 31852, 14), name = 'Darklight Core Vemiath'},
        {pos = Position(31217, 31855, 5), name = 'Quara City'},
        {pos = Position(32050, 33730, 7), name = 'Deathling Universe'},
        {pos = Position(32024, 31614, 12), name = 'Bulltaur Underground'}
    },
    spawnIntervals = {
        {startHour = 12, endHour = 18},  -- Afternoon interval (12 PM to 6 PM)
        {startHour = 18, endHour = 24}   -- Evening interval (6 PM to 12 AM)
    },
    spawnHistory = {} -- Table to track spawn history
}

local function getRandomSpawnTime(interval)
    local startTime = interval.startHour * 60 * 60 -- Convert hours to seconds
    local endTime = interval.endHour * 60 * 60
    local randomTimeInSeconds = math.random(startTime, endTime)
    local currentHour = os.date("!%H", os.time() + randomTimeInSeconds)
    local currentMinute = os.date("!%M", os.time() + randomTimeInSeconds)
    return tonumber(currentHour), tonumber(currentMinute)
end

local function hasSpawnedToday()
    local currentDate = os.date("%Y-%m-%d")
    config.spawnHistory[currentDate] = config.spawnHistory[currentDate] or 0
    return config.spawnHistory[currentDate] >= 2
end

local function trackSpawn()
    local currentDate = os.date("%Y-%m-%d")
    config.spawnHistory[currentDate] = (config.spawnHistory[currentDate] or 0) + 1
end

local function spawnMonster()
    if hasSpawnedToday() then
        Game.broadcastMessage('The Monster Chest has already spawned twice today.', MESSAGE_EVENT_ADVANCE)
        return -- Do not spawn if already spawned twice today
    end

    local randomIndex = math.random(#config.spawnPositions)
    local chosenSpawn = config.spawnPositions[randomIndex]

    -- Attempt to spawn the monster
    local spawnSuccess = Game.createMonster(config.bossName, chosenSpawn.pos, false, true)
    if spawnSuccess then
        Game.broadcastMessage(config.bossName .. ' has spawned at ' .. chosenSpawn.name .. '!', MESSAGE_GAME_HIGHLIGHT)
        trackSpawn() -- Track the spawn if successful
    else
        Game.broadcastMessage('Failed to spawn ' .. config.bossName .. ' at ' .. chosenSpawn.name .. '.', MESSAGE_EVENT_ADVANCE)
    end
end

local Monsterchest = GlobalEvent("Monsterchest")

function Monsterchest.onTime(interval)
    spawnMonster()
    return true
end

for _, interval in ipairs(config.spawnIntervals) do
    local hour, minute = getRandomSpawnTime(interval)
    Monsterchest:time(hour, minute)
end

Monsterchest:register()
