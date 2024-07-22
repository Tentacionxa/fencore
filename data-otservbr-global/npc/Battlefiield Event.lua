local internalNpcName = "Battlefiield Event"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 134,
	lookHead = 94,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 94,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Battlefield Event starts at 20:00" },
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

local price = {}

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	if Player(creature):getSex() == PLAYERSEX_FEMALE then
		npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|, are You going to the {Battlefield Event}?")
		npcHandler:setTopic(playerId, 1)
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello! It's a pleasure to meet you, |PLAYERNAME|. Waiting to join the {Battlefield Event}?")
		npcHandler:setTopic(playerId, nil)
	end
	price[playerId] = nil
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local Sex = player:getSex()
	if npcHandler:getTopic(playerId) == 4 and (MsgContains(message, "reward") or MsgContains(message, "reward")) then
		npcHandler:say("Yes, the winnin team gets rewarded with 10 crystal coins per winner.", npc, creature)
		npcHandler:setTopic(playerId, 5)
	elseif npcHandler:getTopic(playerId) == 5 and MsgContains(message, "time") then
		npcHandler:say("The event starts at 20:00. The teleport will appear here infront of me.", npc, creature)
		npcHandler:setTopic(playerId, nil)
	elseif MsgContains(message, "how") and MsgContains(message, "are") and MsgContains(message, "you") then
		npcHandler:say("Thank you very much. How kind of you to care about me. I am fine, thank you.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		price[playerId] = 5
	elseif MsgContains(message, "sell") then
		npcHandler:say("Sorry, I have nothing to sell.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		price[playerId] = 5
	elseif MsgContains(message, "Battlefield Event") then
		npcHandler:say("Yes, the Battlefield Event is a battle mode between two teams. You get randomly chosen a team. After the event starts, the wall on the main bridge will dissapear and each team will unleash their best hits until the whole enemy team dies. I suggest You get enough supplies (Mana potions and runes). The winnin team gets rewarded 10 crystal coins per player. The event starts at 20:00 and the teleport will appear here in front of me. You have to be a minimum 100 level to join. ", npc, creature)
		npcHandler:setTopic(playerId, 2)
		price[playerId] = 5
	elseif MsgContains(message, "name") then
		if Sex == PLAYERSEX_FEMALE then
			npcHandler:say("I am the Battlefield Event announcer.", npc, creature)
		else
			npcHandler:say("I am the Battlefield Event announcer", npc, creature)
		end
		npcHandler:setTopic(playerId, 2)
		price[playerId] = 5
	
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "I hope to see you soon.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|. I really hope You win this battle!")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
