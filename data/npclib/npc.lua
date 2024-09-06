-- Function called with by the function "Npc:sayWithDelay"
local sayFunction = function(npcId, text, type, eventDelay, playerId)
	local npc = Npc(npcId)
	if not npc then
		logger.error("[sayFunction] - Npc not is valid")
		return false
	end

	npc:say(text, type, false, playerId, npc:getPosition())
	eventDelay.done = true
end

function MsgContains(message, ...)
    local keywords = {...}
    for _, keyword in ipairs(keywords) do
        local lowerMessage, lowerKeyword = message:lower(), keyword:lower()
        if lowerMessage == lowerKeyword then
            return true
        end
        local match = lowerMessage:find(lowerKeyword) and not lowerMessage:find("(%w+)" .. lowerKeyword)

        if match then return true end
    end
    return false
end

function MsgFind(message, keyword)
	local lowerMessage, lowerKeyword = message:lower(), keyword:lower()
	if lowerMessage == lowerKeyword then
		return true
	end

	return string.find(lowerMessage, lowerKeyword) and string.find(lowerMessage, lowerKeyword .. "(%w+)") and string.find(lowerMessage, "(%w+)" .. lowerKeyword)
end

-- Npc talk
-- npc:talk({text, text2}) or npc:talk(text)
function Npc:talk(player, text)
	if type(text) == "table" then
		for i = 0, #text do
			self:sendMessage(player, text[i])
		end
	else
		self:sendMessage(player, text)
	end
end

-- Npc send message to player
-- npc:sendMessage(text)
function Npc:sendMessage(player, text)
	return self:say(string.format(text or "", player:getName()), TALKTYPE_PRIVATE_NP, true, player)
end

function Npc:sayWithDelay(npcId, text, messageType, delay, eventDelay, player)
	eventDelay.done = false
	eventDelay.event = addEvent(sayFunction, delay < 1 and 1000 or delay, npcId, text, messageType, eventDelay, player)
end

function SayEvent(npcId, playerId, messageDelayed, npcHandler, textType)
	local npc = Npc(npcId)
	if not npc then
		return logger.error("[{} NpcHandler:say] - Npc parameter for npc '{}' is missing, nil or not found", npc:getName(), npc:getName())
	end

	local player = Player(playerId)
	if not player then
		return logger.error("[{} NpcHandler:say] - Player parameter for npc '{}' is missing, nil or not found", npc:getName(), npc:getName())
	end

	local parseInfo = {
		[TAG_PLAYERNAME] = player:getName(),
		[TAG_TIME] = getFormattedWorldTime(),
		[TAG_BLESSCOST] = Blessings.getBlessingsCost(player:getLevel(), false),
		[TAG_PVPBLESSCOST] = Blessings.getPvpBlessingCost(player:getLevel(), false),
	}
	npc:say(npcHandler:parseMessage(messageDelayed, parseInfo), textType or TALKTYPE_PRIVATE_NP, false, player, npc:getPosition())
end

function GetCount(string)
	local b, e = string:find("%d+")
	return b and e and tonumber(string:sub(b, e)) or -1
end

function NpcHandleCasino(cassinoConfig, npc, creature, message)
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

	local noOfferMessage = "Dont you have any money to offer? Put it in the counter ahead. The Maximum You can play is 100 cc."

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