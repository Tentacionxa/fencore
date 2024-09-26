local internalNpcName = "Lucyna"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 140,
    lookHead = 114,
    lookBody = 0,
    lookLegs = 76,
    lookFeet = 94,
    lookAddons = 3
}


npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Fragments! Bring your fragments!" },
}

npcConfig.currency = 46626

npcConfig.shop = {
	 { itemName = "lesser fragments", clientId = 46625, buy = 1},

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

	if MsgContains(message, "baxt") then
		npcHandler:say({ "{Tokens} are small objects made of metal or other materials. You can use them to buy superior equipment from token traders like me.", "There are several ways to obtain the tokens I'm interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items." }, npc, creature)
	elseif MsgContains(message, "xten") then
		-- to do: check if Heart of Destruction was killed
		-- after kill message: 'You disrupted the Heart of Destruction, defeated the World Devourer and bought our world some time. You have proven your worth.'
		npcHandler:say({ "Disrupt the Heart of Destruction, fell the World Devourer to prove your worth and you will be granted the power to imbue 'Powerful Strike', 'Powerful Void' and --'Powerful Vampirism'." }, npc, creature)
	elseif MsgContains(message, "trade") then
		npc:openShopWindow(creature)
		npcHandler:say("If you have any greater fragments with you, let's have a look! These are my offers.", npc, creature)
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
