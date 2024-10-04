local SoulPit = {}

SoulPit.config = {
    centerRoom = Position(32376, 31145, 8),
    exitPosition = Position(32371, 31159, 8),
    playersPositions = {
        [1] = Position(32375, 31158, 8),
        [2] = Position(32375, 31159, 8),
        [3] = Position(32375, 31160, 8),
        [4] = Position(32375, 31161, 8),
        [5] = Position(32375, 31162, 8),
    },
    range = 10,
	rangeMonsters = 6,
    timeInMinutes = 10,
    checkMonstersInterval = 5 * 1000,
    soulPitItemId = 47360,
    firstSoulCoreItemId = 47381,
    lastSoulCoreItemId = 49163,
}

SoulPit.cache = {
    eventSoulPitClearCache = nil,
    eventSoulPitCheckMonsters = nil,
    monsterNameSoulPit = nil,
	monstersDeath = nil,
    waveIndex = nil,
}

SoulPit.waves = {
    [1] = {
        [1] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [2] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [3] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [4] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [5] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [6] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [7] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
    },
    [2] = {
        [1] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [2] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [3] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [4] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT}, 
        [5] = {stack = 5, effect = CONST_ME_ORANGETELEPORT},
        [6] = {stack = 5, effect = CONST_ME_ORANGETELEPORT},
        [7] = {stack = 5, effect = CONST_ME_ORANGETELEPORT},
    },
    [3] = {
        [1] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [2] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [3] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [4] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [5] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [6] = {stack = 15, effect = CONST_ME_REDTELEPORT},
        [7] = {stack = 15, effect = CONST_ME_REDTELEPORT},
    },
    [4] = {
        [1] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [2] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [3] = {stack = 1, effect = CONST_ME_LIGHTBLUETELEPORT},
        [4] = {stack = 5, effect = CONST_ME_ORANGETELEPORT},
        [5] = {stack = 5, effect = CONST_ME_ORANGETELEPORT},
        [6] = {stack = 5, effect = CONST_ME_ORANGETELEPORT},
        [7] = {stack = 40, effect = CONST_ME_PURPLETELEPORT},
    },
}

local zeroBestiaryStar = {}
local oneBestiaryStar = {}
local twoBestiaryStar = {}
local threeBestiaryStar = {}
local fourBestiaryStar = {}
local fiveBestiaryStar = {}

local function isSoulCoreItem(itemId)
    local itemName = ItemType(itemId):getName()
    return string.find(itemName, "soul core") ~= nil
end

SoulPit.monstersSoulCoreTable = {}

for i = SoulPit.config.firstSoulCoreItemId, SoulPit.config.lastSoulCoreItemId do
    if isSoulCoreItem(i) then
        table.insert(SoulPit.monstersSoulCoreTable, i)
    end
end

SoulPit.createMonsterTeleport = function(effectCount, spawnPosition, monsterStack, spawnEffect)
    if effectCount > 0 then
		local effectCountEvent = effectCount - 1
		if effectCountEvent <= 0 then
			effectCountEvent = 0
		end
        addEvent(SoulPit.createMonsterTeleport, 1000, effectCountEvent, spawnPosition, monsterStack, spawnEffect)
        spawnPosition:sendMagicEffect(spawnEffect)
    else
        local monster = Game.createMonster(SoulPit.cache.monsterNameSoulPit, spawnPosition)
		if monster then
            monster:registerEvent("SoulpitMonsterPrepareDeath")
            monster:setForgeStack(monsterStack)
            monster:removeIcon("forge")
            if monsterStack == 40 then
                monster:setIcon("soulpit-boss", 1, 7)
            else
                monster:setIcon("soulpit", 1, 6, monsterStack)
            end
            local addHealth = (((monsterStack * 6) + 100) / 100) * monster:getMaxHealth()
            monster:setMaxHealth(addHealth)
            monster:setHealth(addHealth)
        end
    end
end

SoulPit.spawnWave = function()
    if not SoulPit.cache.monsterNameSoulPit then
        return
    end

    local waveLevel = SoulPit.cache.waveIndex
    if waveLevel > #SoulPit.waves then
        return
    end

    local wave = SoulPit.waves[waveLevel]
    for i = 1, #wave do
        local spawnPosition = Position(
            math.random(SoulPit.config.centerRoom.x - SoulPit.config.rangeMonsters, SoulPit.config.centerRoom.x + SoulPit.config.rangeMonsters),
            math.random(SoulPit.config.centerRoom.y - SoulPit.config.rangeMonsters, SoulPit.config.centerRoom.y + SoulPit.config.rangeMonsters),
            SoulPit.config.centerRoom.z
        )
        if waveLevel == 1 then
			addEvent(SoulPit.createMonsterTeleport, 3000, 3, spawnPosition, wave[i].stack, wave[i].effect)
		else
			SoulPit.createMonsterTeleport(3, spawnPosition, wave[i].stack, wave[i].effect)
		end
    end

	SoulPit.cache.monstersDeath = #wave
    SoulPit.cache.waveIndex = waveLevel + 1
end

SoulPit.checkMonsters = function()
    local monster = false
    local player = false
    local spectators = Game.getSpectators(SoulPit.config.centerRoom, false, false, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range)
    for _, spectator in ipairs(spectators) do
        if spectator:isMonster() and not spectator:getMaster() then
            monster = true
        elseif spectator:isPlayer() then
            player = true
        end
    end

    if not player then
        return
    end

    if not monster then
        if SoulPit.cache.waveIndex <= #SoulPit.waves then
            SoulPit.spawnWave()
        else
            local spectators = Game.getSpectators(SoulPit.config.centerRoom, false, false, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range)
            for _, spectator in ipairs(spectators) do
                if spectator:isPlayer() then
                    spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have defeated the core of the " .. SoulPit.cache.monsterNameSoulPit .. " soul and unlocked its animus mastery!")
                    local monsterType = MonsterType(SoulPit.cache.monsterNameSoulPit)
                    if monsterType then
                        local raceId = monsterType:raceId()
                        if spectator:getAnimusMasteryBonus(raceId) == 0 then
                            spectator:setActivedAnimusMasteryBonus(raceId)
                            local oldPoints = spectator:kv():scoped("animus-mastery"):get("points") or 0
                            if oldPoints then
                                spectator:kv():scoped("animus-mastery"):set("points", oldPoints + 1)
                            end
                        end
                    end
                end
            end
            stopEvent(SoulPit.cache.eventSoulPitClearCache)
			SoulPit.cache.eventSoulPitClearCache = addEvent(SoulPit.clearSoulPit, 2000, false)
        end
    else
        if SoulPit.cache.waveIndex <= #SoulPit.waves then
            SoulPit.cache.eventSoulPitCheckMonsters = addEvent(SoulPit.checkMonsters, SoulPit.config.checkMonstersInterval)
        end
    end
end

SoulPit.clearSoulPit = function(timeoutMessage)
    stopEvent(SoulPit.cache.eventSoulPitClearCache)
    local spectators = Game.getSpectators(SoulPit.config.centerRoom, false, false, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range)
    for _, spectator in ipairs(spectators) do
        if spectator:isPlayer() then
            spectator:teleportTo(SoulPit.config.exitPosition)
            spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			if timeoutMessage then
            	spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
			end
        elseif spectator:isMonster() then
            spectator:remove()
        end
    end
end

local SoulPitAction = Action()

function SoulPitAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if table.contains(SoulPit.monstersSoulCoreTable, target.itemid) then
        if player:getPosition() ~= SoulPit.config.playersPositions[1] then
            return true
        end

        local spectators = Game.getSpectators(SoulPit.config.centerRoom, false, false, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range, SoulPit.config.range)
        for _, spectator in ipairs(spectators) do
            if spectator:isPlayer() then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There's someone fighting with Boss.")
                -- colocar coodown para nao ficar clicando e ativando o getSpectators ???
                return true
            end
        end

        for _, spectator in ipairs(spectators) do
            if spectator:isMonster() then
                spectator:remove()
            end
        end

        local players = false
        for i = 1, #SoulPit.config.playersPositions do
            local playerTile = Tile(SoulPit.config.playersPositions[i]):getTopCreature()
            if playerTile and playerTile:isPlayer() then
                playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
                playerTile:teleportTo(SoulPit.config.centerRoom)
                playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				playerTile:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Prepare yourself! Four layers ofdeath will unfold upon you, each more devastating than the last.")
                players = true
            end
        end

        if not players then
            return true
        end

        stopEvent(SoulPit.cache.eventSoulPitClearCache)

        local itemName = target:getName()
        local itemId = target:getId()
        if not table.contains(SoulPit.monstersSoulCoreTable, itemId) then
            return false
        end
        local monsterName = string.gsub(itemName, "soul core", ""):gsub("^%s*(.-)%s*$", "%1")
        if not monsterName then
            return false
        end

        SoulPit.cache.monsterNameSoulPit = monsterName
        SoulPit.cache.waveIndex = 1
        SoulPit.cache.eventSoulPitCheckMonsters = nil
        SoulPit.cache.eventSoulPitClearCache = nil

        SoulPit.cache.eventSoulPitClearCache = addEvent(SoulPit.clearSoulPit, 60 * SoulPit.config.timeInMinutes * 1000, true)

        SoulPit.spawnWave()

        target:remove(1)
    end
    return true
end

SoulPitAction:id(SoulPit.config.soulPitItemId)
SoulPitAction:register()

local SoulCoresAction = Action()

function SoulCoresAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local targetSoulCore = target:getId()
    if table.contains(SoulPit.monstersSoulCoreTable, targetSoulCore) then
	    local useSoulCore = item:getId()
        if useSoulCore == targetSoulCore then
            return false
        end

        if item:remove(1) and target:remove(1) then
            local newSoulCore = 0
            repeat
                local table = SoulPit.monstersSoulCoreTable
                newSoulCore = SoulPit.monstersSoulCoreTable[math.random(#table)]
            until (newSoulCore ~= useSoulCore and newSoulCore ~= targetSoulCore)

            player:addItem(newSoulCore, 1)
        end
    end
    return true
end

for k, v in pairs(SoulPit.monstersSoulCoreTable) do
    SoulCoresAction:id(v)
end

SoulCoresAction:register()

local SoulpitMonsterPrepareDeath = CreatureEvent("SoulpitMonsterPrepareDeath")

function SoulpitMonsterPrepareDeath.onPrepareDeath(creature)
    creature:remove()

	--[[local lastKills = SoulPit.cache.monstersDeath
    if not lastKills then
        lastKills = 4
    end

	SoulPit.cache.monstersDeath = lastKills - 1
	if lastKills == 1 then]]--
		stopEvent(SoulPit.cache.eventSoulPitCheckMonsters)
		SoulPit.cache.eventSoulPitCheckMonsters = nil
		SoulPit.checkMonsters()
	--end

	return false
end

SoulpitMonsterPrepareDeath:register()

local changeSoulCoreAction = Action()

function changeSoulCoreAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if table.contains(SoulPit.monstersSoulCoreTable, target.itemid) then
        local monsterName = string.gsub(target:getName(), "soul core", ""):gsub("^%s*(.-)%s*$", "%1")
        if not monsterName then
            return false
        end

        local monsterType = MonsterType(monsterName)
        if monsterType then
            local newBestiaryStar = monsterType:BestiaryStars()
            if item.itemid == 49164 then
                if newBestiaryStar < 5 then
                    newBestiaryStar = newBestiaryStar + 1
                end
            elseif item.itemid == 37110 then
                if newBestiaryStar > 0 then
                    newBestiaryStar = newBestiaryStar - 1
                end
            end

            if #zeroBestiaryStar == 0 then
                for _, itemId in pairs(SoulPit.monstersSoulCoreTable) do
                    local itemType = ItemType(itemId)
                    if itemType then
                        local monsterNameNew = string.gsub(itemType:getName(), "soul core", ""):gsub("^%s*(.-)%s*$", "%1")
                        if monsterNameNew then
                            local monsterTypeNew = MonsterType(monsterNameNew)
                            if monsterTypeNew then
                                local star = monsterTypeNew:BestiaryStars()
                                if star then
                                    if star == 0 then
                                        table.insert(zeroBestiaryStar, itemId)
                                    elseif star == 1 then
                                        table.insert(oneBestiaryStar, itemId)
                                    elseif star == 2 then
                                        table.insert(twoBestiaryStar, itemId)
                                    elseif star == 3 then
                                        table.insert(threeBestiaryStar, itemId)
                                    elseif star == 4 then
                                        table.insert(fourBestiaryStar, itemId)
                                    elseif star == 5 then
                                        table.insert(fiveBestiaryStar, itemId)
                                    end
                                end
                            end
                        end
                    end
                end
            end


            local newSoulCoreItemId = 0
            local currentSoulCoreItemId = target:getId()
            repeat
                if newBestiaryStar == 0 then
                    newSoulCoreItemId = zeroBestiaryStar[math.random(#zeroBestiaryStar)]
                elseif newBestiaryStar == 1 then
                    newSoulCoreItemId = oneBestiaryStar[math.random(#oneBestiaryStar)]
                elseif newBestiaryStar == 2 then
                    newSoulCoreItemId = twoBestiaryStar[math.random(#twoBestiaryStar)]
                elseif newBestiaryStar == 3 then
                    newSoulCoreItemId = threeBestiaryStar[math.random(#threeBestiaryStar)]
                elseif newBestiaryStar == 4 then
                    newSoulCoreItemId = fourBestiaryStar[math.random(#fourBestiaryStar)]
                elseif newBestiaryStar == 5 then
                    newSoulCoreItemId = fiveBestiaryStar[math.random(#fiveBestiaryStar)]
                end
            until (currentSoulCoreItemId ~= newSoulCoreItemId)
            if newSoulCoreItemId ~= 0 then
                if item:remove(1) and target:remove(1) then
                    player:addItem(newSoulCoreItemId, 1)
                end
            end
        end
    end
    return true
end

changeSoulCoreAction:id(49164, 37110)
changeSoulCoreAction:register()

--[[
local createItemSoulcoreTestSV = TalkAction("!soulcore")

function createItemSoulcoreTestSV.onSay(player, words, param)
	local split = param:split(",")
	local monsterName = split[1]:trim()
	local itemName = monsterName .. " soul core"

	local itemType = ItemType(itemName)
	if itemType:getId() == 0 then
		itemType = ItemType(tonumber(itemName))
		if not tonumber(itemName) or itemType:getId() == 0 then
			player:sendCancelMessage("There is no item with that name or ID.")
			return false
		end
	end

    player:addItem(itemType:getId(), 1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return false
end

createItemSoulcoreTestSV:separator(" ")
createItemSoulcoreTestSV:groupType("normal")
createItemSoulcoreTestSV:register()
]]--