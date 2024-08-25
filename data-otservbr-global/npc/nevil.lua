local internalNpcName = "Nevil"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 78,
	lookBody = 79,
	lookLegs = 114,
	lookFeet = 76,
	lookAddons = 2,
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
	{ itemName = "carrion casserole", clientId = 29414, buy = 135000 },
    { itemName = "hydra tongue salad", clientId = 9080, buy = 120000 },
    { itemName = "sweet mangonaise elixir", clientId = 11588, buy = 145000 },
    { itemName = "svargrond salmon filet", clientId = 29413, buy = 135000 },
    { itemName = "strawberry cupcake", clientId = 28485, buy = 1000000 },
    { itemName = "rotworm stew", clientId = 9079, buy = 155000 },
    { itemName = "roasted dragon wings", clientId = 9081, buy = 145000 },
    { itemName = "lemon cupcake", clientId = 28486, buy = 125000 },
    { itemName = "haunch of boar", clientId = 12310, buy = 112000 },
    { itemName = "demon candy ball", clientId = 11587, buy = 113000 },
    { itemName = "blueberry cupcake", clientId = 28484, buy = 1000000 },
    { itemName = "bowl of glooth soup", clientId = 21144, buy = 113000 },
    { itemName = "blessed acorn", clientId = 26074, buy = 129000 },
    { itemName = "blessed steak", clientId = 9086, buy = 114000 },
    { itemName = "northern fishburger", clientId = 9088, buy = 134000 },
    { itemName = "tropical fried terrorbird", clientId = 9082, buy = 144000 },
    { itemName = "tropical marinated tiger", clientId = 29410, buy = 124000 },
    { itemName = "coconout shrimp bake", clientId = 11584, buy = 134000 },
	{ itemName = "veggie casserole", clientId = 9084, buy = 100000 },
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
