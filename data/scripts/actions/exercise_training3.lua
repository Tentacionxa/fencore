local exhaustionTime = 10

local exerciseWeaponsTable = {
	-- MELE
	[46300] = { skill = SKILL_SWORD },
	[46295] = { skill = SKILL_AXE },
	[46297] = { skill = SKILL_CLUB },
	[46299] = { skill = SKILL_SHIELD },

	-- ROD
	[46298] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_SMALLICE, allowFarUse = true },
	-- RANGE
	[46296] = { skill = SKILL_DISTANCE, effect = CONST_ANI_SIMPLEARROW, allowFarUse = true },
	-- WAND
	[46301] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_FIRE, allowFarUse = true },
}

local dummies = Game.getDummies()

local function leaveExerciseTraining(playerId)
	if _G.OnExerciseTraining[playerId] then
		stopEvent(_G.OnExerciseTraining[playerId].event)
		_G.OnExerciseTraining[playerId] = nil
	end

	local player = Player(playerId)
	if player then
		player:setTraining(false)
	end
	return
end

local function exerciseTrainingEvent(playerId, tilePosition, weaponId, dummyId)
	local player = Player(playerId)
	if not player then
		return leaveExerciseTraining(playerId)
	end

	if player:isTraining() == 0 then
		player:sendTextMessage(MESSAGE_FAILURE, "You have stopped training.")
		return leaveExerciseTraining(playerId)
	end

	if not Tile(tilePosition):getItemById(dummyId) then
		player:sendTextMessage(MESSAGE_FAILURE, "Someone has moved the dummy, the training has stopped.")
		leaveExerciseTraining(playerId)
		return false
	end

	local playerPosition = player:getPosition()
	if not playerPosition:isProtectionZoneTile() then
		player:sendTextMessage(MESSAGE_FAILURE, "You are no longer in a protection zone, the training has stopped.")
		leaveExerciseTraining(playerId)
		return false
	end

	if player:getItemCount(weaponId) <= 0 then
		player:sendTextMessage(MESSAGE_FAILURE, "You need the training weapon in the backpack, the training has stopped.")
		leaveExerciseTraining(playerId)
		return false
	end

	local weapon = player:getItemById(weaponId, true)
    if not weapon then
        player:sendTextMessage(MESSAGE_FAILURE, "Unable to find your training weapon... Leaving the training.")
        leaveExerciseTraining(playerId)
        return false
    end
	if (not weapon:isItem()) or (not weapon:hasAttribute(ITEM_ATTRIBUTE_CHARGES)) then
		player:sendTextMessage(MESSAGE_FAILURE, "The selected item is not a training weapon, the training has stopped.")
		leaveExerciseTraining(playerId)
		return false
	end

	local weaponCharges = weapon:getAttribute(ITEM_ATTRIBUTE_CHARGES)
	if not weaponCharges or weaponCharges <= 0 then
		weapon:remove(1)
        
        weapon = player:getItemById(weaponId, true)
        if weapon then
            weaponCharges = weapon:getAttribute(ITEM_ATTRIBUTE_CHARGES)
            
            if not weaponCharges or weaponCharges <= 0 then
                leaveExerciseTraining(playerId)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training weapon has disappeared.")
                return false
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training weapon has disappeared. Using the next one.")
            end
        else
            leaveExerciseTraining(playerId)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training weapon has disappeared.")
            return false
        end
	end

	if not dummies[dummyId] then
		return false
	end

	local rate = dummies[dummyId] / 100
	local isMagic = exerciseWeaponsTable[weaponId].skill == SKILL_MAGLEVEL
	if isMagic then
		player:addManaSpent(500 * rate)
	else
		player:addSkillTries(exerciseWeaponsTable[weaponId].skill, 7 * rate)
	end

	weapon:setAttribute(ITEM_ATTRIBUTE_CHARGES, (weaponCharges - 1))
	tilePosition:sendMagicEffect(CONST_ME_HITAREA)

	if exerciseWeaponsTable[weaponId].effect then
		playerPosition:sendDistanceEffect(tilePosition, exerciseWeaponsTable[weaponId].effect)
	end

	local vocation = player:getVocation()
	_G.OnExerciseTraining[playerId].event = addEvent(exerciseTrainingEvent, vocation:getBaseAttackSpeed() / 2, playerId, tilePosition, weaponId, dummyId)
	return true
end

local function isDummy(id)
	return dummies[id] and dummies[id] > 0
end

local exerciseTraining = Action()

function exerciseTraining.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or type(target) == "table" or not target:getId() then
		return true
	end
    
	local playerId = player:getId()
	local targetId = target:getId()
    
	if target:isItem() and isDummy(targetId) then
		if _G.OnExerciseTraining[playerId] then
			player:sendTextMessage(MESSAGE_FAILURE, "You are already training!")
			return true
		end
        
		local playerPos = player:getPosition()
		if not exerciseWeaponsTable[item.itemid].allowFarUse and (playerPos:getDistance(target:getPosition()) > 1) then
			player:sendTextMessage(MESSAGE_FAILURE, "Get closer to the dummy.")
			return true
		end

		if not playerPos:isProtectionZoneTile() then
			player:sendTextMessage(MESSAGE_FAILURE, "You need to be in a protection zone.")
			return true
		end
        
		local playerHouse = player:getTile():getHouse()
		local targetPos = target:getPosition()
		local targetHouse = Tile(targetPos):getHouse()

		if targetHouse and isDummy(targetId) then
			if playerHouse ~= targetHouse then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must be inside the house to use this dummy.")
				return true
			end

			local playersOnDummy = 0
			for _, playerTraining in pairs(_G.OnExerciseTraining) do
				if playerTraining.dummyPos == targetPos then
					playersOnDummy = playersOnDummy + 1
				end

				if playersOnDummy >= configManager.getNumber(configKeys.MAX_ALLOWED_ON_A_DUMMY) then
					player:sendTextMessage(MESSAGE_FAILURE, "That exercise dummy is busy.")
					return true
				end
			end
		end

		if player:hasExhaustion("training-exhaustion") then
			player:sendTextMessage(MESSAGE_FAILURE, "This exercise dummy can only be used after a " .. exhaustionTime .. " seconds cooldown.")
			return true
		end

		_G.OnExerciseTraining[playerId] = {}
		if not _G.OnExerciseTraining[playerId].event then
			_G.OnExerciseTraining[playerId].event = addEvent(exerciseTrainingEvent, 0, playerId, targetPos, item.itemid, targetId)
			_G.OnExerciseTraining[playerId].dummyPos = targetPos
			player:setTraining(true)
			player:setExhaustion("training-exhaustion", exhaustionTime)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have started training on an exercise dummy.")
		end

        local modal = ModalWindow {
            title = "Training mode!",
            message = "Your next weapon will be used automaticaly! Don't forget to leave the training weapons in your backpack."
        }
    
        modal:addButton('Confirm')
        modal:sendToPlayer(player)
		return true
	end
	return false
end

for weaponId, weapon in pairs(exerciseWeaponsTable) do
	exerciseTraining:id(weaponId)
	if weapon.allowFarUse then
		exerciseTraining:allowFarUse(true)
	end
end

exerciseTraining:register()
