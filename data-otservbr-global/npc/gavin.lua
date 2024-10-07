local internalNpcName = "Gavin"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 705,
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
	{ text = "Runes, Magic... All You need!" },
}

npcConfig.currency = 46316

npcConfig.shop = {
	{ name = "flameheart elixir", clientId = 46389, buy = 1 },
	{ name = "taint elixir", clientId = 46390, buy = 1 },
	{ name = "magician elixir", clientId = 46391, buy = 1 },
	{ name = "eternal supreme health potion", clientId = 46393, buy = 1 },
	{ name = "eternal ultimate mana potion", clientId = 46394, buy = 1 },
	{ name = "eternal ultimate spirit potion", clientId = 46395, buy = 1 },
	{ name = "charged Terramorfo rune", clientId = 46243, buy = 1 },
	{ name = "charged Celestius rune", clientId = 46244, buy = 1 },
	{ name = "charged Glacialon rune", clientId = 46245, buy = 1 },
	{ name = "charged Necroshade rune", clientId = 46246, buy = 1 },
	{ name = "charged Infernatus rune", clientId = 46247, buy = 1 },
	{ name = "charged Voltagor rune", clientId = 46248, buy = 1 },
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


local answerType = {}
local answerLevel = {}

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

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	npcHandler:setTopic(playerId, 0)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "information") then
		npcHandler:say({ "Magic, runes, all You need, is in my store... Have a look" }, npc, creature)
	elseif MsgContains(message, "runes") then
		-- to do: check if Heart of Destruction was killed
		-- after kill message: 'You disrupted the Heart of Destruction, defeated the World Devourer and bought our world some time. You have proven your worth.'
		npcHandler:say({ "Yes, powerfull weapons, in hands of any druid or sorcerer..." }, npc, creature)
	elseif MsgContains(message, "trade") then
		npc:openShopWindow(creature)
		npcHandler:say("Souly Heads! These are my offers.", npc, creature)
		elseif MsgContains(message, "no") then
			npcHandler:say("Your decision. Come back if you have changed your mind.", npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	end



npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, false)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
