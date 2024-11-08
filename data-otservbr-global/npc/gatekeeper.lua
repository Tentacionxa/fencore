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
                local requiredStorages = {921004, 921005, 921006, 921007, 921008, 921013}
                local allStoragesSet = true
                for _, storageId in ipairs(requiredStorages) do
                    if player:getStorageValue(storageId) ~= 1 then
                        allStoragesSet = false
                        break
                    end
                end

                if allStoragesSet then
                    local currentLevel = player:getLevel() -- Define current level here
                    if vocationId == 4 or vocationId == 8 then
                        -- Knight or Elite Knight settings
                        player:setMaxHealth(currentLevel * 15 + 30000)
                        player:setMaxMana(currentLevel * 5 + 10000)

                    elseif vocationId == 2 or vocationId == 6 then
                        -- Druid or Elder Druid settings
                        if player:getStorageValue(921001) == 1 and player:getStorageValue(921012) == 1 then
                            player:setMaxHealth(currentLevel * 5 + 10000)
                            player:setMaxMana(currentLevel * 30 + 60000)
                        else
                            npcHandler:say("You haven't met all the requirements yet for Druids/Elder Druids.", npc, creature)
                            return true
                        end

                    elseif vocationId == 1 or vocationId == 5 then
                        -- Sorcerer or Master Sorcerer settings
                        if player:getStorageValue(921011) == 1 and player:getStorageValue(921002) == 1 then
                            player:setMaxHealth(currentLevel * 5 + 10000)
                            player:setMaxMana(currentLevel * 30 + 60000)
                        else
                            npcHandler:say("You haven't met all the requirements yet for Sorcerers/Master Sorcerers.", npc, creature)
                            return true
                        end

                    elseif vocationId == 3 or vocationId == 7 then
                        -- Paladin or Royal Paladin settings
                        if player:getStorageValue(921003) == 1 and player:getStorageValue(921009) == 1 and player:getStorageValue(921010) == 1 then
                            player:setMaxHealth(currentLevel * 10 + 20000)
                            player:setMaxMana(currentLevel * 15 + 30000)
                        else
                            npcHandler:say("You haven't met all the requirements yet for Paladins/Royal Paladins.", npc, creature)
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
                else
                    npcHandler:say("You haven't met all the requirements yet.", npc, creature)
                end
            end
        end
    end
    return true
end
