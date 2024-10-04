local config = {
    state = "IDLE",
    sqmTrigger = Position(32712, 33337, 7), -- SQM WHERE THE PLAYERS WILL STEP IN TO TELEPORT TO THE EVENT
    teleportInPosition = Position(32710, 33324, 7), --SQM WHERE PLAYERS WILL TELEPORT TO
    timeToKick = 3, -- TIME IN MINUTES TO DETERMINE IF THE PLAYERS HAVE CONCLUDED OR NOT
    timeToTeleportOnSuccess = 60, --TIME IN SECONDS TO TELEPORT THE WINNERS TO ANOTHER PLACE
    teleportPositionOnSuccess = Position(32705, 33287, 7), -- POSITION WHERE THE WINNERS OF THE EVENT WILL BE TELEPORTED TO
    waitingRoomTime = 1, -- TIME IN MINUTES AFTER THE FIRST PLAYER ENTER IN THE EVENT TO START SPAWNING THE WAVES
    kickPosition = Position(31491, 31738, 7), -- SQM WHERE PLAYERS THAT GET KICKED FROM THE EVENT WILL BE TELEPORTED TO
    completedStorage = 410857, --STORAGE USED TO CHECK IF PLAYER HAS ALREADY COMPLETED THE EVENT OR NOT
    spawningWave = false, -- INTERNAL, USED TO CHECK IF THE WAVE IS SPAWNING
    complete = {
        npcName = "Soul Bleeder",
        npcPosition = Position(32706, 33267, 7)
    },
    waves = { --ADD AS MANY WAVES AS YOU WANT TO
        {
            { name = "Griish Lord", qtt = 5, delay = 2000, position = Position(32706, 33322, 7) },
            { name = "Griish Knight", qtt = 2, delay = 4000, position = Position(32712, 33322, 7) },
            { name = "Griish Scout", qtt = 2, delay = 6000, position = Position(32707, 33328, 7)},
            { name = "Griish Leader", qtt = 2, delay = 4000, position = Position(32713, 33330, 7) },
            { name = "Griish Leader", qtt = 2, delay = 6000, position = Position(32707, 33329, 7)},
            { name = "Griish Scout", qtt = 2, delay = 6000, position = Position(32708, 33324, 7)},
            { name = "Griish Scout", qtt = 2, delay = 6000, position = Position(32704, 33321, 7)},
            { name = "Griish Leader", qtt = 2, delay = 6000, position = Position(32716, 33332, 7)},
            { name = "Griish Lord", qtt = 2, delay = 6000, position = Position(32709, 33331, 7)},
            { name = "Griish Leader", qtt = 2, delay = 6000, position = Position(32707, 33329, 7)},
            { name = "Griish Lord", qtt = 2, delay = 6000, position = Position(32709, 33323, 7)},
            { name = "Griish Leader", qtt = 2, delay = 6000, position = Position(32711, 33325, 7)},

        },
        {
            { name = "Griish Sorcereress", qtt = 5, delay = 2000, position = Position(32706, 33322, 7) },
            { name = "Griish Mage", qtt = 2, delay = 4000, position = Position(32712, 33322, 7) },
            { name = "Griish Sorcereress", qtt = 2, delay = 6000, position = Position(32707, 33328, 7)},
            { name = "Griish Druid", qtt = 2, delay = 4000, position = Position(32713, 33330, 7) },
            { name = "Griish Druid", qtt = 2, delay = 6000, position = Position(32707, 33329, 7)},
            { name = "Griish Priestess", qtt = 2, delay = 6000, position = Position(32708, 33324, 7)},
            { name = "Griish Mage", qtt = 2, delay = 6000, position = Position(32704, 33321, 7)},
            { name = "Griish Druid", qtt = 2, delay = 6000, position = Position(32716, 33332, 7)},
            { name = "Griish Mage", qtt = 2, delay = 6000, position = Position(32709, 33331, 7)},
            { name = "Griish Sorcereress", qtt = 2, delay = 6000, position = Position(32707, 33329, 7)},
            { name = "Griish Druid", qtt = 2, delay = 6000, position = Position(32709, 33323, 7)},
            { name = "Griish Priestess", qtt = 2, delay = 6000, position = Position(32711, 33325, 7)},
        },
        {
            { name = "Griish Lord", qtt = 5, delay = 2000, position = Position(32706, 33322, 7) },
            { name = "Griish Knight", qtt = 2, delay = 4000, position = Position(32712, 33322, 7) },
            { name = "Griish Scout", qtt = 2, delay = 6000, position = Position(32707, 33328, 7)},
            { name = "Griish Leader", qtt = 2, delay = 4000, position = Position(32713, 33330, 7) },
            { name = "Griish Leader", qtt = 2, delay = 6000, position = Position(32707, 33329, 7)},
            { name = "Griish Priestess", qtt = 2, delay = 6000, position = Position(32708, 33324, 7)},
            { name = "Griish Mage", qtt = 2, delay = 6000, position = Position(32704, 33321, 7)},
            { name = "Griish Druid", qtt = 2, delay = 6000, position = Position(32716, 33332, 7)},
            { name = "Griish Mage", qtt = 2, delay = 6000, position = Position(32709, 33331, 7)},
            { name = "Griish Sorcereress", qtt = 2, delay = 6000, position = Position(32707, 33329, 7)},
            { name = "Griish Druid", qtt = 2, delay = 6000, position = Position(32709, 33323, 7)},
            { name = "Griish Priestess", qtt = 2, delay = 6000, position = Position(32711, 33325, 7)},
        }
    }
}

local function startWave()
    local wavePlace = config.wave == 1 and "st" or config.wave == 2 and "nd" or config.wave == 3 and "rd" or "th"
    for _, player in pairs(config.participants) do
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Starting the " .. config.wave .. wavePlace .. " wave!")
    end

    config.spawningWave = true
    for index, monster in ipairs(config.waves[config.wave]) do
        addEvent(
            function(name, position, qtt, stopWave)
                if config.state == 'IDLE' then return end
                for i = 1, qtt do
                    local tempMonster = Game.createMonster(name, position)
                    if tempMonster then
                        config.monsters[tempMonster:getId()] = tempMonster
                        tempMonster:registerEvent("wavesRaidMonsterDeathHandler")
                    end
                end

                if stopWave then
                    config.spawningWave = false
                end
            end,
            monster.delay,
            monster.name,
            monster.position,
            monster.qtt,
            index == #config.waves[config.wave]
        )
    end

    config.wave = config.wave + 1
end

local function finishEvent()
    logger.debug("Finishing the event")
    for _, player in pairs(config.participants) do
        player:teleportTo(config.kickPosition)
    end
    config.participants = nil

    for _, monster in pairs(config.monsters) do
        config.monsters[monster:getId()] = nil
        monster:remove()
    end

    if config.npc then
        config.npc:remove()
        config.npc = nil
    end
    
    config.state = "IDLE"
end

local wavesRaidPlayerDeathHandler = CreatureEvent("wavesRaidPlayerDeathHandler")
function wavesRaidPlayerDeathHandler.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    config.participants[creature:getId()] = nil
    creature:unregisterEvent("wavesRaidPlayerDeathHandler")

    local remainingPlayers = 0
    for _, player in pairs(config.participants) do
        remainingPlayers = remainingPlayers + 1
    end

    if remainingPlayers == 0 then
        finishEvent()
    end
end
wavesRaidPlayerDeathHandler:register()

local wavesRaidMonsterDeathHandler = CreatureEvent("wavesRaidMonsterDeathHandler")
function wavesRaidMonsterDeathHandler.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    config.monsters[creature:getId()] = nil

    local monstersRemaining = 0
    for _, monster in pairs(config.monsters) do
        monstersRemaining = monstersRemaining + 1
    end

    if monstersRemaining <= 0 and not config.spawningWave then
        if config.wave > #config.waves then
            local npc = Game.createNpc(config.complete.npcName, config.complete.npcPosition)
            config.npc = npc

            config.state = "CONCLUDED"

            for _, player in pairs(config.participants) do
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You have won the event. All the remaining alive players will be teleported to the exit.")
            end

            addEvent(
                function()
                    for _, player in pairs(config.participants) do
                        local player = Player(player)
                        if not player then return end

                        player:teleportTo(config.teleportPositionOnSuccess)
                    end
                end,
                config.timeToTeleportOnSuccess * 1000
            )
        else
            startWave()
        end
    end
end
wavesRaidMonsterDeathHandler:register()

local function kickPlayers()
    finishEvent()
end

local function eventStart()
    for _, player in pairs(config.participants) do
        player:sendTextMessage(MESSAGE_ADMINISTRATOR, string.format("The raid event just started! Get ready to die!! You have %s minutes to finish the event!", config.timeToKick))
    end
    addEvent(
        finishEvent,
        config.timeToKick * 60 * 1000
    )

    config.wave = 1
    config.monsters = {}
    if config.npc then
        config.npc:remove()
        config.npc = nil
    end

    config.state = "RUNNING"
    startWave()
end

local stepInMoveEvent = MoveEvent()
function stepInMoveEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return end

    if config.state == "RUNNING" then
        player:sendCancelMessage(string.format("There are people facing this raid at this moment! Try again later, the max time is %s minutes", config.timeToKick))
        player:teleportTo(fromPosition)
        return
    end

    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:teleportTo(config.teleportInPosition)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:registerEvent("wavesRaidPlayerDeathHandler")
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Welcome to the event! Please wait that the event will start soon.")
    
    if config.participants == nil then config.participants = {} end
    config.participants[player:getId()] = player

    if config.state == "IDLE" then
        config.state = "STARTING"
        addEvent(
            eventStart,
            config.waitingRoomTime * 1
        )
    end
end
stepInMoveEvent:position(config.sqmTrigger)
stepInMoveEvent:register()

--CREATE THE NPC THAT WILL TALK TO PLAYER AFTER THE RAID COMPLETE

local internalNpcName = "Soul Bleeder"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeEx = 49280,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, msg)
    local player = creature:getPlayer()
    if not player then return end

    if MsgContains(msg, "demands") then
        if player:getStorageValue(config.completedStorage) == -1 then
            npcHandler:say(
                "So the souls say... I shall take, some of your souls away and let you pass to the Griish Underworld!",
                npc,
                player
            )
            player:setLevel(player:getLevel() - 600)
	player:teleportTo(Position(32705, 33259, 7))
            player:setStorageValue(config.completedStorage, 1)
            return true
        else
            npcHandler:say(
                "Seems like you have already been here... Why are you here again??",
                npc,
                player
            )
            return true
        end
    end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Souls awaken.\nDid you complete our {demands}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)