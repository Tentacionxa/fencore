local internalNpcName = "Gate Keeper"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookTypeEx = 49263,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Are you ready to face your fate?" },
	{ text = "Only the honest will pass to Heaven..." },
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

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local playerId = player:getId()

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    if message == "enter" then
        -- Check if player has already completed the ritual
        if player:getStorageValue(51857) == 1 then
            npcHandler:say("You have already tried...", npc, creature)
            return true
        end

        npcHandler:say("Do You want to reborn after all of Your sins?", npc, creature)
        npcHandler:setTopic(playerId, 1)

    elseif message == "yes" then
        if npcHandler:getTopic(playerId) == 1 then
            npcHandler:setTopic(playerId, 0)  -- Reset topic

            -- Check if player has already completed the ritual
            if player:getStorageValue(51857) == 1 then
                npcHandler:say("You have already tried...", npc, creature)
                return true
            elseif player:getStorageValue(51857) <= 0 then
                local vocationId = player:getVocation():getId()
                local currentLevel = player:getLevel()

                -- Separate checks for Knight or Elite Knight
                if vocationId == 4 or vocationId == 8 then
                    local knightStorages = {921004, 921005, 921006, 921007, 921008, 921013}
                    local allKnightStoragesSet = true
                    for _, storageId in ipairs(knightStorages) do
                        if player:getStorageValue(storageId) ~= 1 then
                            allKnightStoragesSet = false
                            break
                        end
                    end
                    if allKnightStoragesSet then
                        player:setMaxHealth(currentLevel * 15 + 30000)
                        player:setMaxMana(currentLevel * 5 + 10000)
                    else
                        npcHandler:say("You haven't met all the requirements yet for Knights.", npc, creature)
                        return true
                    end

                elseif vocationId == 2 or vocationId == 6 then
                    -- Druid or Elder Druid settings
                    if player:getStorageValue(921001) == 1 and player:getStorageValue(921012) == 1 then
                        player:setMaxHealth(currentLevel * 5 + 10000)
                        player:setMaxMana(currentLevel * 30 + 60000)
                    else
                        npcHandler:say("You haven't met all the requirements yet for Druids.", npc, creature)
                        return true
                    end

                elseif vocationId == 1 or vocationId == 5 then
                    -- Sorcerer or Master Sorcerer settings
                    if player:getStorageValue(921011) == 1 and player:getStorageValue(921002) == 1 then
                        player:setMaxHealth(currentLevel * 5 + 10000)
                        player:setMaxMana(currentLevel * 30 + 60000)
                    else
                        npcHandler:say("You haven't met all the requirements yet for Sorcerers.", npc, creature)
                        return true
                    end

                elseif vocationId == 3 or vocationId == 7 then
                    -- Paladin or Royal Paladin settings
                    if player:getStorageValue(921003) == 1 and player:getStorageValue(921009) == 1 and player:getStorageValue(921010) == 1 then
                        player:setMaxHealth(currentLevel * 10 + 20000)
                        player:setMaxMana(currentLevel * 15 + 30000)
                    else
                        npcHandler:say("You haven't met all the requirements yet for Paladins.", npc, creature)
                        return true
                    end

                else
                    npcHandler:say("Only knights, druids, sorcerers, and paladins can proceed with this ritual.", npc, creature)
                    return true
                end

                -- Set storage to indicate ritual completion and teleport the player
                player:setStorageValue(51857, 1)
                player:teleportTo(Position(32945, 33497, 4))
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                npcHandler:say("You did the right thing...", npc, creature)
            end
        end
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET, "Enlightenment... Do You want to {enter}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye, |PLAYERNAME|. May your journey be safe.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, traveler.")

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