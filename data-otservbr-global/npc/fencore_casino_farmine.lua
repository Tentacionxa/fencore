local npcName = "Fencore Casino Farmine"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

local cassinoConfig = {
	availableGames = {
		-- THE ODDS IS THE AMOUNT THE PLAYER WILL RECEIVE AS REWARD FOR PLAYING THE GAME... ODDS = 1 MEANS IF THE PLAYER OFFERS 1K, HE WILL RECEIVE PLUS 1K, ODDS = 2 RECEIVES = 2K AND SO ON...
		-- JUST REMEMBER THAT IF THE PLAYER RECEIVES 1K, THEN HE WILL BE REWARDED WITH HIS OWN 1K BACK PLUS 1K FROM THE REWARD
		["HIGH_LOW"] = { enabled = true, odds = 1, howToPlay = "Just say the word high or low with the offer in the counter.", name = "High / Low", description = "You have to guess if the rolled number will be 1/2/3 (low) or 4/5/6 (high). The reward for this choice is: {odds}x"},
		["HIT_THE_NUMBER"] = { enabled = true, odds = 5, howToPlay = "Just say a number between 1 to 6 with the offer in the counter.", name = "Hit the number", description = "You have to guess the exact number within 1 to 6. The reward for this choice is: {odds}x"},
	},
	counterPosition = Position(33019, 31454, 11),
	discardOfferPosition = Position(33019, 31455, 11), --USED TO MOVE ITENS THAT ARE NOT IN THE CURRENCY LIST AWAY FROM THE COUNTER
	playerPosition = Position(33020, 31455, 11),
	coins = {
		goldCoin = {
			id = 3031,
			enabled = true
		},
		platinumCoin = {
			id = 3035,
			enabled = true
		},
		crystalCoin = {
			id = 3043,
			enabled = true
		}
	}
}

--REGISTER THE MOVEEVENT TO LET USERS TO PUT ONLY CURRENCYS IN THIS COUNTER
local event = MoveEvent()
function event.onAddItem(item, tile, pos)
	if (tile:getPosition() ~= cassinoConfig.counterPosition) then
		return true
	end

	for key, val in pairs(cassinoConfig.coins) do
		if (item:getId() == val.id) then
			return true
		end
	end

	item:moveTo(cassinoConfig.discardOfferPosition)

	return false
end
event:type("additem")
event:id(7675)
event:register()

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = {
	["lookTypeEx"] = 0,
	["lookAddons"] = 2,
	["lookType"] = 132,
	["lookLegs"] = 115,
	["lookBody"] = 120,
	["lookFeet"] = 0,
	["lookMountHead"] = 0,
	["lookMountBody"] = 0,
	["lookMountLegs"] = 0,
	["lookMountFeet"] = 0,
	["lookFamiliarsType"] = 0,
	["lookMount"] = 0,
	["lookHead"] = 114,
}

npcConfig.flags = {
	floorchange = false,
}

-- Create keywordHandler and npcHandler
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

-- onThink
npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

-- onAppear
npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

-- onDisappear
npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

-- onMove
npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

-- onSay
npcType.onSay = function(npc, creature, msgType, message)

	if MsgContains(message, "games") then
		local text = "We have the available options to play:\n"
		for key, val in pairs(cassinoConfig.availableGames) do
			if val.enabled then
				text = text .. val.name .. "\n" .. string.gsub(val.description, "{odds}", val.odds) .. "\n How to play: " .. val.howToPlay .. "\n"
			end
		end
		npc:say(text)
	end

	if creature:getPosition() ~= cassinoConfig.playerPosition then return end

	local noOfferMessage = "Dont you have any money to offer? Put it in the counter ahead."

	local offer = {}

	for key, val in pairs(cassinoConfig.coins) do
		if val.enabled then
			local item = Tile(cassinoConfig.counterPosition):getItemById(val.id)
			if item then
				table.insert(offer, item)
			end
		end
	end

	if tonumber(message) then
		local number = tonumber(message)
		if number > 6 or number < 1 then return end

		if #offer <= 0 then npc:say(noOfferMessage, TALKTYPE_SAY) return end

		local random = math.random(6)
		local winner = random == number
		
		local responseMessage = winner and "What a luck! Take your reward." or "Thanks for the money! I appreciate that."

		npc:say("You rolled " .. random .. " out of 6! " .. responseMessage, TALKTYPE_SAY)

		if winner then
			creature:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
			npc:getPosition():sendMagicEffect(CONST_ME_POFF)
			for _, reward in ipairs(offer) do
				Tile(cassinoConfig.counterPosition):addItem(reward:getId(), reward:getCount() * cassinoConfig.availableGames["HIT_THE_NUMBER"].odds)
			end
		else
			npc:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			for _, reward in ipairs(offer) do
				reward:remove()
			end
		end

		return
	end

	if MsgContains(message, "low", "high") then
		if #offer <= 0 then npc:say(noOfferMessage, TALKTYPE_SAY) return end
		
		local random = math.random(6)
		local game = MsgContains(message, "low") and "low" or "high"
		
		local winner = (game == "low" and random <= 3) or (game == "high" and random >= 4)

		local responseMessage = winner and "What a luck! Take your reward." or "Thanks for the money! I appretiate."

		npc:say("You rolled " .. random .. " out of 6! " .. responseMessage, TALKTYPE_SAY)

		if winner then
			creature:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
			npc:getPosition():sendMagicEffect(CONST_ME_POFF)
			for _, reward in ipairs(offer) do
				Tile(cassinoConfig.counterPosition):addItem(reward:getId(), reward:getCount() * cassinoConfig.availableGames["HIGH_LOW"].odds)
			end
		else
			npc:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			for _, reward in ipairs(offer) do
				reward:remove()
			end
		end
		return
	end
if MsgContains(message, "hi") then
	local text = "Hello " .. creature:getName() .. ", say {games} for a list of available games."
	npc:say(text)
	return
end
end
-- onPlayerCloseChannel
npcType.onCloseChannel = function(npc, player)
	npcHandler:onCloseChannel(npc, player)
end

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

-- Function called by the callback "npcHandler:setCallback(CALLBACK_GREET, greetCallback)" in end of file
local function greetCallback(npc, player)
	return true
end

-- On creature say callback
local function creatureSayCallback(npc, player, type, msg)
	return true
end

-- Set to local function "greetCallback"
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
-- Set to local function "creatureSayCallback"
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-- Bye message
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell!")
-- Walkaway message
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- Register npc
npcType:register(npcConfig)
