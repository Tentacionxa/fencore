local internalNpcName = "Toffee"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1751,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Food of various kinds, have a look." },
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

npcHandler:setMessage(MESSAGE_GREET, "Yammy, yammy. Want to get some {food}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your Candian path.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "May enlightenment be your Candian path.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Sure, take a look at my offers.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "wafer paper flower", clientId = 48251, sell = 15000 },
	{ itemName = "wad of fairy floss", clientId = 48544, sell = 13000 },
	{ itemName = "taiyaki ice cream", clientId = 48273, sell = 13000 },
	{ itemName = "pastry dragon", clientId = 48256, sell = 12000 },
	{ itemName = "churro heart", clientId = 48254, sell = 13000 },
	{ itemName = "brigadeiro", clientId = 48252, buy = 14000 , sell = 13000 },
	{ itemName = "beijinho", clientId = 48253, sell = 15000 },
	{ itemName = "banana", clientId = 3587, buy = 5 },
	{ itemName = "bulb of garlic", clientId = 8197, buy = 3 },
	{ itemName = "carrot", clientId = 3595, buy = 8 },
	{ itemName = "dragon ham", clientId = 3583, buy = 25 },
	{ itemName = "fish", clientId = 3578, buy = 6 },
	{ itemName = "grapes", clientId = 3592, buy = 8 },
	{ itemName = "ham", clientId = 3582, buy = 15 },
	{ itemName = "jalapeno pepper", clientId = 8016, buy = 2 },
	{ itemName = "meat", clientId = 3577, buy = 10 },
	{ itemName = "melon", clientId = 3593, buy = 13 },
	{ itemName = "onion", clientId = 8015, buy = 2 },
	{ itemName = "orange", clientId = 3586, buy = 9 },
	{ itemName = "pumpkin", clientId = 3594, buy = 10 },
	{ itemName = "salmon", clientId = 3579, buy = 7 },
	{ itemName = "tomato", clientId = 3596, buy = 10 },
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
