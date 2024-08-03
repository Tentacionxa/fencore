local internalNpcName = "Monti"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 472,
	lookHead = 69,
	lookBody = 69,
	lookLegs = 71,
	lookFeet = 76,
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

npcConfig.shop = {
	{ itemName = "durable exercise rod", clientId = 35283, buy = 300000, count = 1800 },
	{ itemName = "durable exercise wand", clientId = 35284, buy = 300000, count = 1800 },
	{ itemName = "durable exercise axe", clientId = 35280, buy = 300000, count = 1800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 300000, count = 1800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 300000, count = 1800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 300000, count = 1800 },
	{ itemName = "durable exercise shield", clientId = 44066, buy = 300000, count = 1800 },
	{ itemName = "exercise rod", clientId = 28556, buy = 83333, count = 500 },
	{ itemName = "exercise wand", clientId = 28557, buy = 83333, count = 500 },
	{ itemName = "exercise axe", clientId = 28553, buy = 83333, count = 500 },
	{ itemName = "exercise sword", clientId = 28552, buy = 83333, count = 500 },
	{ itemName = "exercise club", clientId = 28554, buy = 83333, count = 500 },
	{ itemName = "exercise bow", clientId = 28555, buy = 83333, count = 500 },
	{ itemName = "exercise shield", clientId = 44065, buy = 83333, count = 500 },
	{ itemName = "lasting exercise rod", clientId = 35289, buy = 3000000, count = 18000 },
	{ itemName = "lasting exercise wand", clientId = 35290, buy = 3000000, count = 18000 },
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 3000000, count = 18000 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 3000000, count = 18000 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 3000000, count = 18000 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 3000000, count = 18000 },
	{ itemName = "lasting exercise shield", clientId = 44067, buy = 3000000, count = 18000 },
}
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "name") then
		return npcHandler:say("I'm Monti. A training set seller.", npc, creature)
	elseif MsgContains(message, "job") then
		return npcHandler:say("I sell training equipment. Why?", npc, creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Have a lovely day!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
