local eventsCommand = TalkAction("!events")

local function spawnMonsters(name, count, basePosition, rangeX, rangeY)
    for i = 1, count do
        local offsetX = math.random(-rangeX, rangeX)
        local offsetY = math.random(-rangeY, rangeY)
        local spawnPosition = Position(basePosition.x + offsetX, basePosition.y + offsetY, basePosition.z)
        Game.createMonster(name, spawnPosition)
    end
end

local function startEvents(player)
    -- Spawn God Odyn and Archangels
    local godOdynPosition = Position(32945, 33474, 4)
    local archangelBasePosition = Position(32945, 33475, 4)

    Game.createMonster("God Odyn", godOdynPosition)
    spawnMonsters("Archangel", 12, archangelBasePosition, 1, 1)

    -- Broadcast message for God Odyn
    Game.broadcastMessage("God Odyn has landed in heaven. Protect the Angelic City!", MESSAGE_STATUS_WARNING)

    -- Spawn Sub bosses and Griish monsters
    local subBossesBasePosition1 = Position(32737, 33217, 6)
    local subBossesBasePosition2 = Position(32757, 33218, 6)

    spawnMonsters("Sub Terra", 5, subBossesBasePosition1, 10, 1)
    spawnMonsters("Sub Zero", 5, subBossesBasePosition1, 10, 1)
    spawnMonsters("Sub Holy", 5, subBossesBasePosition1, 10, 1)
    spawnMonsters("Sub Phys", 5, subBossesBasePosition1, 10, 1)
    spawnMonsters("Sub Flam", 5, subBossesBasePosition1, 10, 1)
    spawnMonsters("Sub Devis", 5, subBossesBasePosition1, 10, 1)

    spawnMonsters("Griish Lord", 10, subBossesBasePosition2, 20, 1)
    spawnMonsters("Griish Leader", 10, subBossesBasePosition2, 20, 1)
    spawnMonsters("Griish Mage", 10, subBossesBasePosition2, 20, 1)
    spawnMonsters("Griish Druid", 10, subBossesBasePosition2, 20, 1)

    -- Broadcast message for Griish City attack
    Game.broadcastMessage("Griish City is being attacked by Sub Elementals! Quick, protect the city!", MESSAGE_STATUS_WARNING)

    -- Spawn Whizzer
    local whizzerPosition = Position(33153, 32755, 7)
    Game.createMonster("Whizzer", whizzerPosition)

    -- Broadcast message for Whizzer
    Game.broadcastMessage("Whizzer is ready for some competition, quick, North Gate Ankrahmun!", MESSAGE_STATUS_WARNING)
end

function eventsCommand.onSay(player, words, param)
    startEvents(player)
    return false
end

-- Register command
eventsCommand:separator(" ")
eventsCommand:groupType("god")
eventsCommand:register()
