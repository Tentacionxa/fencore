local internalNpcName = "Coco"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1747,
	lookHead = 38,
	lookBody = 113,
	lookLegs = 67,
	lookFeet = 95,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Hello there, adventurer! Need a deal in weapons or armor? I'm your man!" },
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "adorn") or MsgContains(message, "outfit") or MsgContains(message, "addon") then
		local addonProgress = player:getStorageValue(Storage.OutfitQuest.Knight.AddonHelmet)
		if addonProgress == 5 then
			player:setStorageValue(Storage.OutfitQuest.Knight.MissionHelmet, 6)
			player:setStorageValue(Storage.OutfitQuest.Knight.AddonHelmet, 6)
			player:setStorageValue(Storage.OutfitQuest.Knight.AddonHelmetTimer, os.time() + 7200)
			npcHandler:say("Oh, Gregor sent you? I see. It will be my pleasure to adorn your helmet. Please give me some time to finish it.", npc, creature)
		elseif addonProgress == 6 then
			if player:getStorageValue(Storage.OutfitQuest.Knight.AddonHelmetTimer) < os.time() then
				player:setStorageValue(Storage.OutfitQuest.Knight.MissionHelmet, 0)
				player:setStorageValue(Storage.OutfitQuest.Knight.AddonHelmet, 7)
				player:setStorageValue(Storage.OutfitQuest.Ref, math.min(0, player:getStorageValue(Storage.OutfitQuest.Ref) - 1))
				player:addOutfitAddon(131, 2)
				player:addOutfitAddon(139, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("Just in time, |PLAYERNAME|. Your helmet is finished, I hope you like it.", npc, creature)
			else
				npcHandler:say("Please have some patience, |PLAYERNAME|. Forging is hard work!", npc, creature)
			end
		elseif addonProgress == 7 then
			npcHandler:say("I think it's one of my masterpieces.", npc, creature)
		else
			npcHandler:say("Sorry, but without the permission of Gregor I cannot help you with this matter.", npc, creature)
		end
	elseif MsgContains(message, "old backpack") or MsgContains(message, "backpack") then
		if player:getStorageValue(Storage.SamsOldBackpack) < 1 then
			npcHandler:say("What? Are you telling me you found my old adventurer's backpack that I lost years ago??", npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
	elseif MsgContains(message, "2000 steel shields") then
		if player:getStorageValue(Storage.WhatAFoolish.Questline) ~= 29 or player:getStorageValue(Storage.WhatAFoolish.Contract) == 2 then
			npcHandler:say("My offers are weapons, armors, helmets, legs, and shields. If you'd like to see my offers, ask me for a {trade}.", npc, creature)
			return true
		end

		npcHandler:say("What? You want to buy 2000 steel shields??", npc, creature)
		npcHandler:setTopic(playerId, 2)
	elseif MsgContains(message, "contract") then
		if player:getStorageValue(Storage.WhatAFoolish.Contract) == 0 then
			npcHandler:say("Have you signed the contract?", npc, creature)
			npcHandler:setTopic(playerId, 4)
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			if player:removeItem(3244, 1) then
				npcHandler:say({
					"Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend Kroox to provide you a special dwarven armor. ...",
					"I will mail him about you immediately. Just tell him, his old buddy Sam is sending you.",
				}, npc, creature)
				player:setStorageValue(Storage.SamsOldBackpack, 1)
				player:addAchievement("Backpack Tourist")
			else
				npcHandler:say("You don't have it...", npc, creature)
			end
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 2 then
			npcHandler:say("I can't believe it. Finally I will be rich! I could move to Edron and enjoy my retirement! But ... wait a minute! I will not start working without a contract! Are you willing to sign one?", npc, creature)
			npcHandler:setTopic(playerId, 3)
		elseif npcHandler:getTopic(playerId) == 3 then
			player:addItem(129, 1)
			player:setStorageValue(Storage.WhatAFoolish.Contract, 1)
			npcHandler:say("Fine! Here is the contract. Please sign it. Talk to me about it again when you're done.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 4 then
			if not player:removeItem(128, 1) then
				npcHandler:say("You don't have a signed contract.", npc, creature)
				npcHandler:setTopic(playerId, 0)
				return true
			end

			player:setStorageValue(Storage.WhatAFoolish.Contract, 2)
			npcHandler:say("Excellent! I will start working right away! Now that I am going to be rich, I will take the opportunity to tell some people what I REALLY think about them!", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, "no") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("Then no.", npc, creature)
		elseif table.contains({ 2, 3, 4 }, npcHandler:getTopic(playerId)) then
			npcHandler:say("This deal sounded too good to be true anyway.", npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am a proud worker of Candia." })

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my shop, adventurer |PLAYERNAME|! I {trade} various items.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "ring of temptation", clientId = 45642, buy = 30000 },
	{ itemName = "peppermint backpack", clientId = 48114, buy = 1500000 },
	{ itemName = "biscuit barrier", clientId = 45643, buy = 9000000 },
	{ itemName = "candy necklace", clientId = 45641, buy = 400000 },
	{ itemName = "candy-coated quiver", clientId = 45644, buy = 500000 },
	{ itemName = "lime tart", clientId = 48255, buy = 75, sell = 50000 },
	{ itemName = "milk chocolate coin", clientId = 48249, sell = 40000 },
	{ itemName = "dark chocolate coin", clientId = 48250, sell = 40000 },
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
