local internalNpcName = "Lezinho"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 700,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
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

npcConfig.currency = 46316

npcConfig.shop = {
	{ itemName = "nexus rod", clientId = 46329, buy = 500, count = 15000 },
	{ itemName = "nexus wand", clientId = 46332, buy = 500, count = 15000 },
	{ itemName = "nexus axe", clientId = 46326, buy = 500, count = 15000 },
	{ itemName = "nexus sword", clientId = 46331, buy = 500, count = 15000 },
	{ itemName = "nexus club", clientId = 46328, buy = 500, count = 15000 },
	{ itemName = "nexus bow", clientId = 46327, buy = 500, count = 15000 },
	{ itemName = "nexus shield", clientId = 46330, buy = 500, count = 15000 },
	{ itemName = "xeno rod", clientId = 46298, buy = 300, count = 15000 },
	{ itemName = "xeno wand", clientId = 46301, buy = 300, count = 15000 },
	{ itemName = "xeno axe", clientId = 46295, buy = 300, count = 15000 },
	{ itemName = "xeno sword", clientId = 46300, buy = 300, count = 15000 },
	{ itemName = "xeno club", clientId = 46297, buy = 300, count = 15000 },
	{ itemName = "xeno bow", clientId = 46296, buy = 300, count = 15000 },
	{ itemName = "xeno shield", clientId = 46299, buy = 300, count = 15000 },
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
		return npcHandler:say("I'm Lezinho. A training set seller.", npc, creature)
	elseif MsgContains(message, "job") then
		return npcHandler:say("I sell nexus and xeno generation, training equipment. And?", npc, creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Griish Blessing...")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
