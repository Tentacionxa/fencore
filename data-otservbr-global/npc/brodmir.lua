local internalNpcName = "Brodmir"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 133,
	lookHead = 95,
	lookBody = 75,
	lookLegs = 112,
	lookFeet = 58,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
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

local items = {
	[VOCATION.BASE_ID.SORCERER] = 3074,
	[VOCATION.BASE_ID.DRUID] = 3066,
}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local itemId = items[player:getVocation():getBaseId()]
	if MsgContains(message, "first rod") or MsgContains(message, "first wand") then
		if player:isMage() then
			if player:getStorageValue(Storage.FirstMageWeapon) == -1 then
				npcHandler:say("So you ask me for a {" .. ItemType(itemId):getName() .. "} to begin your adventure?", npc, creature)
				npcHandler:setTopic(playerId, 1)
			else
				npcHandler:say("What? I have already gave you one {" .. ItemType(itemId):getName() .. "}!", npc, creature)
			end
		else
			npcHandler:say("Sorry, you aren't a druid either a sorcerer.", npc, creature)
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			player:addItem(itemId, 1)
			npcHandler:say("Here you are young adept, take care yourself.", npc, creature)
			player:setStorageValue(Storage.FirstMageWeapon, 1)
		end
		npcHandler:setTopic(playerId, 0)
	elseif MsgContains(message, "no") and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Ok then.", npc, creature)
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "energy amplification", clientId = 36739, buy = 1000000 },
    { itemName = "earth resilience", clientId = 36731, buy = 1000000 },
    { itemName = "earth amplification", clientId = 36738, buy = 1000000 },
    { itemName = "death resilience", clientId = 36734, buy = 1000000 },
    { itemName = "wealth duplex", clientId = 36727, buy = 10005500 },
    { itemName = "stamina extension", clientId = 36725, buy = 10000000 },
    { itemName = "strike enhancement", clientId = 36724, buy = 1000000 },
    { itemName = "physical resilience", clientId = 36735, buy = 1000000 },
    { itemName = "physical amplification", clientId = 36742, buy = 1000000 },
    { itemName = "ice resilience", clientId = 36730, buy = 1000000 },
    { itemName = "ice amplification", clientId = 36737, buy = 1000000 },
    { itemName = "holy resilience", clientId = 36733, buy = 1000000 },
	{ itemName = "holy amplification", clientId = 36740, buy = 1000000 },
	{ itemName = "fire resilience", clientId = 36729, buy = 1000000 },
	{ itemName = "fire amplification", clientId = 36736, buy = 1000000 },
	{ itemName = "energy resilience", clientId = 36732, buy = 1000000 },
	{ itemName = "death amplification", clientId = 36741, buy = 1000000 },
	{ itemName = "bestiary betterment", clientId = 36728, buy = 1000000 },
	{ itemName = "charm upgrade", clientId = 36726, buy = 6000000 },
}

local maxItemLimits = {
    [36739] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36731] = 50,   -- Max 5 Health Potions (itemId 7618) per transaction
	[36738] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36734] = 50,  -- Add more items with their respective limits

	[36727] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36725] = 50,   -- Max 5 Health Potions (itemId 7618) per transaction
	[36724] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36735] = 50, 

	[36742] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36730] = 50,   -- Max 5 Health Potions (itemId 7618) per transaction
	[36737] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36733] = 50, 

	[36740] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36729] = 50,   -- Max 5 Health Potions (itemId 7618) per transaction
	[36736] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36732] = 50, 

	[36741] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
    [36728] = 50,   -- Max 5 Health Potions (itemId 7618) per transaction
	[36726] = 50,  -- Max 10 Crystal Coins (itemId 2160) per transaction
}

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    -- Check the item limit
    local maxLimit = maxItemLimits[itemId]

    if maxLimit and amount > maxLimit then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only buy up to 50 of this item per transaction.")
        return false  -- Deny the transaction if the limit is exceeded
    end

    -- Proceed with the actual selling of the item
    npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)

    -- Continue with any additional logic you have for onBuyItem
    return true
end


-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
