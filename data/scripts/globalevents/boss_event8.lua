local config = {
    bossName     = 'Ferumbras',
    spawnTime    = '20:00:00',
    monsterName  = 'Fake Ferumbras',
    arenaTopLeft = Position(32459, 32389, 15),  -- Top left corner of the arena
    arenaBottomRight = Position(32496, 32436, 15),  -- Bottom right corner of the arena
    numMonsters  = 15
}

-- Function to generate random positions within the specified arena
local function getRandomPositionWithinArena()
    local randomX = math.random(config.arenaTopLeft.x, config.arenaBottomRight.x)
    local randomY = math.random(config.arenaTopLeft.y, config.arenaBottomRight.y)
    return Position(randomX, randomY, config.arenaTopLeft.z)
end

local FakeFeru = GlobalEvent("FakeFeru")
function FakeFeru.onTime(interval)
    local currentDay = os.date("%A")
    if currentDay == "Sunday" then
        -- Generate random position for the boss
        local bossPosition = getRandomPositionWithinArena()
        Game.createMonster(config.bossName, bossPosition, false, true)
        Game.broadcastMessage(config.bossName .. ' has spawned at (' .. bossPosition.x .. ', ' .. bossPosition.y .. ', ' .. bossPosition.z .. ')!', MESSAGE_EVENT_ADVANCE)

        -- Generate random positions and spawn monsters
        for i = 1, config.numMonsters do
            local monsterPosition = getRandomPositionWithinArena()
            local success = Game.createMonster(config.monsterName, monsterPosition, false, true)
            if success then
                Game.broadcastMessage(config.monsterName .. ' spawned at (' .. monsterPosition.x .. ', ' .. monsterPosition.y .. ', ' .. monsterPosition.z .. ')!', MESSAGE_EVENT_ADVANCE)
            else
                Game.broadcastMessage('Failed to spawn ' .. config.monsterName .. ' at (' .. monsterPosition.x .. ', ' .. monsterPosition.y .. ', ' .. monsterPosition.z .. ')', MESSAGE_EVENT_ADVANCE)
            end
        end

        Game.broadcastMessage(config.bossName .. ' and his clones have landed on the Boss Arena! Enter The Thais Temple Teleport!', MESSAGE_GAME_HIGHLIGHT)
    end
    return true
end

FakeFeru:time(config.spawnTime)
FakeFeru:register()
