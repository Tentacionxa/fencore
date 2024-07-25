local internalNpcName = "Onkan"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 15,
	lookBody = 86,
	lookLegs = 87,
	lookFeet = 95,
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
	{ itemName = "collar of blue plasma", clientId = 23542, buy = 2500 },
    { itemName = "ring of blue plasma", clientId = 23530, buy = 2500 },
    { itemName = "collar of green plasma", clientId = 23543, buy = 2500 },
    { itemName = "ring of green plasma", clientId = 23532, buy = 2500 },
    { itemName = "collar of red plasma", clientId = 23544, buy = 2500 },
    { itemName = "ring of red plasma", clientId = 23533, buy = 2500 },
    { itemName = "prismatic ring", clientId = 16114, buy = 2500 },
    { itemName = "prismatic necklace", clientId = 16113, buy = 2500 },
    { itemName = "enchanted pendulet", clientId = 30344, buy = 100000 },
    { itemName = "enchanted sleep shawl", clientId = 30342, buy = 2000000 },
    { itemName = "enchanted turtle amulet", clientId = 39233, buy = 3000000 },
    { itemName = "gill necklace", clientId = 16108, buy = 2500 },
	{ itemName = "sacred tree amulet", clientId = 9302, buy = 1200 },
	{ itemName = "glacier amulet", clientId = 815, buy = 500 },
	{ itemName = "terra amulet", clientId = 814, buy = 500 },
	{ itemName = "magma amulet", clientId = 817, buy = 500 },
	{ itemName = "starlight vial", clientId = 25976, buy = 3400 },
	{ itemName = "sun catcher", clientId = 25977, buy = 410000 },
	{ itemName = "moon mirror", clientId = 25977, buy = 450000 },
	
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
