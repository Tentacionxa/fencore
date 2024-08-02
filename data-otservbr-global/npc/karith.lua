local internalNpcName = "Karith"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 159,
	lookHead = 79,
	lookBody = 3,
	lookLegs = 93,
	lookFeet = 12,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "This weather is killing me. If I only had enough money to retire." },
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

-- Travel
local function addTravelKeyword(keyword, cost, destination, action, condition)
	if condition then
		keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "I'm sorry but I don't sail there." }, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "Do you seek a passage to " .. keyword:titleCase() .. " for |TRAVELCOST|?", cost = cost, discount = "postman" })
	travelKeyword:addChildKeyword({ "yes" }, StdModule.travel, { npcHandler = npcHandler, premium = false, cost = cost, discount = "postman", destination = destination }, nil, action)
	travelKeyword:addChildKeyword({ "no" }, StdModule.say, { npcHandler = npcHandler, text = "We would like to serve you some time.", reset = true })
end

addTravelKeyword("carlin", 110, Position(32387, 31820, 6))
addTravelKeyword("thais", 200, Position(32311, 32211, 6))
addTravelKeyword("ab'dendriel", 130, Position(32734, 31668, 6))
addTravelKeyword("edron", 160, Position(33175, 31764, 6))
addTravelKeyword("venore", 170, Position(32954, 32022, 6))
addTravelKeyword("port hope", 160, Position(32527, 32784, 6))
addTravelKeyword("roshamuul", 210, Position(33494, 32567, 7))
addTravelKeyword("svargrond", 180, Position(32341, 31108, 6))
addTravelKeyword("damona reef", 380, Position(31858, 31967, 6))
addTravelKeyword("hellish basin", 580, Position(31424, 31740, 6))
addTravelKeyword("kinfroain", 280, Position(32557, 31021, 7))
addTravelKeyword("lionfield fort", 380, Position(31766, 32078, 6))
addTravelKeyword("lamawood isles", 180, Position(31935, 31868, 7))
addTravelKeyword("liberty bay", 180, Position(32285, 32892, 6))
addTravelKeyword("fearsome desert", 380, Position(31482, 31925, 6))
addTravelKeyword("ottawa", 280, Position(31015, 31687, 6))
addTravelKeyword("dunly refuge", 580, Position(30722, 32115, 6))
addTravelKeyword("oramond", 150, Position(33479, 31985, 7))
addTravelKeyword("krailos", 230, Position(33492, 31712, 6))

-- Kick
keywordHandler:addKeyword({ "kick" }, StdModule.kick, { npcHandler = npcHandler, destination = { Position(32811, 31267, 6), Position(32811, 31270, 6), Position(32811, 31273, 6) } })

-- Basic
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am the captain of this ship." })
keywordHandler:addKeyword({ "captain" }, StdModule.say, { npcHandler = npcHandler, text = "I am the captain of this ship." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I'm Karith. I don't belong to a caste any longer, and only serve the Yalahari." })
keywordHandler:addKeyword({ "yalahar" }, StdModule.say, { npcHandler = npcHandler, text = "The city was a marvel to behold. It is certain that it have been the many foreigners that ruined it." })

-- Greeting message
keywordHandler:addGreetKeyword({ "ashari" }, { npcHandler = npcHandler, text = "Hello! Tell me what's on your mind. Time is money." })
--Farewell message
keywordHandler:addFarewellKeyword({ "asgha thrazi" }, { npcHandler = npcHandler, text = "Goodbye, |PLAYERNAME|." })

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)



