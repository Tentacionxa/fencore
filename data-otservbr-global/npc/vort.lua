local internalNpcName = "Vort"
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
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Griish Blessing! Buy some furniture!" },
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

-- Wooden Stake
local stakeKeyword = keywordHandler:addKeyword({ "stake" }, StdModule.say, { npcHandler = npcHandler, text = "Making a stake from a chair? Are you insane??! I won't waste my chairs on you for free! You will have to pay for it, but since I consider your plan a blasphemy, it will cost 5000 gold pieces. Okay?" }, function(player)
	return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) ~= -1
end)

stakeKeyword:addChildKeyword({ "yes" }, StdModule.say, { npcHandler = npcHandler, text = "Argh... my heart aches! Alright... a promise is a promise. Here - take this wooden stake, and now get lost.", ungreet = true }, function(player)
	return player:getMoney() + player:getBankBalance() >= 5000
end, function(player)
	player:removeMoneyBank(5000)
	player:addItem(5941, 1)
end)

stakeKeyword:addChildKeyword({ "yes" }, StdModule.say, { npcHandler = npcHandler, text = "You can't even pay for that.", reset = true })
stakeKeyword:addChildKeyword({ "" }, StdModule.say, { npcHandler = npcHandler, text = "Phew. No chair-killing.", reset = true })

-- Others
npcHandler:setMessage(MESSAGE_GREET, "Griish Blessing Mister |PLAYERNAME|! Looking for furniture?")
npcHandler:setMessage(MESSAGE_FAREWELL, "See You soon...")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Have a look. Do you want to see any type of furniture?")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.currency = 46316

npcConfig.shop = {
	{ itemName = "possessed chest", clientId = 46104, buy = 500 },
	{ itemName = "rolled-up dark fur carpet", clientId = 46102, buy = 10 },
    { itemName = "corrupted mailbox", clientId = 46062, buy = 70 },
    { itemName = "draconic reward", clientId = 46058, buy = 100 },
    { itemName = "skeleton throne", clientId = 46052, buy = 100 },
    

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
