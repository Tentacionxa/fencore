local internalNpcName = "Iskan"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 143,
	lookHead = 38,
	lookBody = 116,
	lookLegs = 38,
	lookFeet = 19,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

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
		keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "I'm sorry but I don't travel there." }, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "Do you seek a passage to " .. keyword:titleCase() .. " for |TRAVELCOST|?", cost = cost, discount = "postman" })
	travelKeyword:addChildKeyword({ "yes" }, StdModule.travel, { npcHandler = npcHandler, premium = false, cost = cost, discount = "postman", destination = destination }, nil, action)
	travelKeyword:addChildKeyword({ "no" }, StdModule.say, { npcHandler = npcHandler, text = "We would like to serve you some time.", reset = true })
end


addTravelKeyword("nibelor", 200, Position(32329, 31044, 7))
--Basic
keywordHandler:addKeyword({ "do for you" }, StdModule.say, { npcHandler = npcHandler, text = "I run the dog sled service from this city to {Nibelor}." })
keywordHandler:addAliasKeyword({ "job" })
keywordHandler:addAliasKeyword({ "shop" })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Iskan." })
keywordHandler:addKeyword({ "nibelor" }, StdModule.say, { npcHandler = npcHandler, text = "I can bring you to Nibelor with the sled if you want to. Just ask for a {passage}." })
keywordHandler:addKeyword({ "city" }, StdModule.say, { npcHandler = npcHandler, text = "This city seems to be growing every day. First, there have been only a few huts and now ... look around, houses everywhere." })
keywordHandler:addAliasKeyword({ "svargrond" })
keywordHandler:addKeyword({ "barbarian" }, StdModule.say, { npcHandler = npcHandler, text = "Our people are very proud and honest. I guess that's more than most people can say about themselves and their people, right boys?" })
keywordHandler:addKeyword({ "rumours" }, StdModule.say, { npcHandler = npcHandler, text = "I heard something about a ship crashing in the shelf ice between Nibelor and Grimlund. If I were you, I wouldn't go to chakoya terrain. It's pretty dangerous." })
keywordHandler:addKeyword({ "chakoya" }, StdModule.say, { npcHandler = npcHandler, text = "Nasty little beasts. Me and the boys had quite some bloody encounters with them on the ice." })
keywordHandler:addKeyword({ "monsters" }, StdModule.say, { npcHandler = npcHandler, text = "The boys warn me in advance if a monster is around." })
keywordHandler:addKeyword({ "cult" }, StdModule.say, { npcHandler = npcHandler, text = "My boys did not like the guys that were travelling through our city, and I trust in their instincts. Isn't it so, boys?" })
keywordHandler:addKeyword({ "yeti" }, StdModule.say, { npcHandler = npcHandler, text = "The yeti is real and dangerous." })
keywordHandler:addKeyword({ "test" }, StdModule.say, { npcHandler = npcHandler, text = "I am not sure what to think about this new custom to accept foreigners as one of us after passing that test. But it's the Jarl's decision, not mine." })
keywordHandler:addKeyword({ "camps" }, StdModule.say, { npcHandler = npcHandler, text = "The raiders camps are far to the south. There are three of them. Small camp sites of raiding parties might be found almost anywhere though." })
keywordHandler:addKeyword({ "raiders" }, StdModule.say, { npcHandler = npcHandler, text = "They are sometimes trying to catch me and the boys. Such fools, they will never get us. Right, boys?" })
keywordHandler:addKeyword({ "enemies" }, StdModule.say, { npcHandler = npcHandler, text = "The boys can tell who's an enemy just by the smell." })
keywordHandler:addKeyword({ "bonelords" }, StdModule.say, {
	npcHandler = npcHandler,
	text = {
		"I'll tell you something. I have seen such a creature once, far on the ice to the east. It was the coldest winter I can remember and the chakoyas were roaming the ice almost everywhere. ...",
		"To evade them, me and the boys had to walk a long way to a spot where the ice was treacherous and thin. ...",
		"And there I've seen such a creature. The boys went almost mad and I turned my sled immediately. No idea how we made it home. True story.",
	},
})
keywordHandler:addKeyword({ "edron" }, StdModule.say, { npcHandler = npcHandler, text = "Me and the boys care only about our own territory." })
keywordHandler:addAliasKeyword({ "thais" })
keywordHandler:addAliasKeyword({ "carlin" })
keywordHandler:addAliasKeyword({ "venore" })
keywordHandler:addAliasKeyword({ "port hope" })
keywordHandler:addKeyword({ "druids" }, StdModule.say, { npcHandler = npcHandler, text = "I guess their healing powers are almost as useful as those of our shamans." })
keywordHandler:addKeyword({ "shamans" }, StdModule.say, { npcHandler = npcHandler, text = "I guess there are guys like me that have a talent to talk to dogs and there are guys like the shamans that have the talent to talk to spirits." })
keywordHandler:addKeyword({ "king" }, StdModule.say, { npcHandler = npcHandler, text = "We don't need any kings or queens. Am I right, boys? Yeah, I am." })
keywordHandler:addAliasKeyword({ "queen" })
keywordHandler:addKeyword({ "leader" }, StdModule.say, { npcHandler = npcHandler, text = "Sven the Younger is our current Jarl. For my standards he's still a puppy, but a smart one at least." })
keywordHandler:addKeyword({ "excalibug" }, StdModule.say, { npcHandler = npcHandler, text = "Yeah, where could it be. That's the question." })
keywordHandler:addKeyword({ "ferumbras" }, StdModule.say, { npcHandler = npcHandler, text = "Easy, boys! Don't mention that name again. Makes the boys nuts, ye know?" })
keywordHandler:addKeyword({ "gods" }, StdModule.say, { npcHandler = npcHandler, text = "In my whole long life, I've not seen any sign of those gods the people of the south are constantly talking about." })
keywordHandler:addAliasKeyword({ "uman" })
keywordHandler:addAliasKeyword({ "zathroth" })
keywordHandler:addAliasKeyword({ "banor" })
keywordHandler:addKeyword({ "chyll" }, StdModule.say, { npcHandler = npcHandler, text = "The icy father. We know him all too well, am I right boys? He has claimed so many old friends in all those years. So many." })

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
