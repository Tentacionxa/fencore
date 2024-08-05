local internalNpcName = "Ash"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName
npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 137,
	lookHead = 57,
	lookBody = 2,
	lookLegs = 29,
	lookFeet = 50,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Bows, crossbows and ammunition on special sale today." },
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

npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What do you need? Distance weapons? I sell lots of them.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "blue quiver", clientId = 35848, buy = 400 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "bow", clientId = 3350, buy = 400 },
	{ itemName = "crossbow", clientId = 3349, buy = 500 },
	{ itemName = "quiver", clientId = 35562, buy = 400 },
	{ itemName = "red quiver", clientId = 35849, buy = 400 },
	{ itemName = "spear", clientId = 3277, buy = 10 },
	{ itemName = "envenomed arrow", clientId = 16143, buy = 12 },
	{ itemName = "earth arrow", clientId = 774, buy = 5 },
	{ itemName = "crystalline arrow", clientId = 15793, buy = 20 },
	{ itemName = "blue quiver", clientId = 35848, buy = 400 },
	{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
	{ itemName = "prismatic bolt", clientId = 16141, buy = 20 },
    { itemName = "power bolt", clientId = 3450, buy = 7 },
	{ itemName = "shiver arrow", clientId = 762, buy = 5 },
	{ itemName = "tarsal arrow", clientId = 14251, buy = 6 },
	{ itemName = "vortex bolt", clientId = 14252, buy = 6 },
	{ itemName = "diamond arrow", clientId = 35901, buy = 45 },
	{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
	{ itemName = "vortex bolt", clientId = 14252, buy = 6 },
	{ itemName = "drill bolt", clientId = 16142, buy = 12 },
	{ itemName = "spectral bolt", clientId = 35902, buy = 70 },
	{ itemName = "assassin star", clientId = 7368, buy = 100 },
	{ itemName = "infernal bolt", clientId = 6528, buy = 90 },
	{ itemName = "shopping bag", clientId = 21411, sell = 1 },
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

npcType:register(npcConfig)
