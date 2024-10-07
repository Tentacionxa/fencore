local rewards = {
	{ id = 46399, name = "Ring of ice" },
	{ id = 46407, name = "Amulet of ice" },
}

priestId = 46289

local priest = Action()

function priest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 20)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Brainstealer bag gave You a " .. rewardItem.name .. ".")
	return true
end

priest:id(priestId)
priest:register()

local rewards = {
	{ id = 46401, name = "Ring of fire" },
	{ id = 46406, name = "Amulet of fire" },
}

warriorId = 46290

local warrior = Action()

function warrior.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 20)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Falcon bag gave You a " .. rewardItem.name .. ".")
	return true
end

warrior:id(warriorId)
warrior:register()

local rewards = {
	{ id = 46398, name = "Ring of holy" },
	{ id = 46408, name = "Amulet of holy" },
}

pallId = 46291

local pall = Action()

function pall.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 20)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lion bag gave You a " .. rewardItem.name .. ".")
	return true
end

pall:id(pallId)
pall:register()

local rewards = {
	{ id = 46397, name = "Ring of energy" },
	{ id = 46405, name = "Amulet of energy" },

}

mageId = 46292

local mage = Action()

function mage.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 20)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ratmiral bag gave You a " .. rewardItem.name .. ".")
	return true
end

mage:id(mageId)
mage:register()

local rewards = {
    { id = 46401, name = "Ring of fire" },
	{ id = 46406, name = "Amulet of fire" },
    { id = 46397, name = "Ring of energy" },
	{ id = 46405, name = "Amulet of energy" },
    { id = 46398, name = "Ring of holy" },
	{ id = 46408, name = "Amulet of holy" },
    { id = 46399, name = "Ring of ice" },
	{ id = 46407, name = "Amulet of ice" },
}

teamId = 46293

local team = Action()

function team.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 20)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Scarlett bag gave You a " .. rewardItem.name .. ".")
	return true
end

team:id(teamId)
team:register()

local rewards = {
    { id = 46401, name = "Ring of fire" },
	{ id = 46406, name = "Amulet of fire" },
    { id = 46397, name = "Ring of energy" },
	{ id = 46405, name = "Amulet of energy" },
    { id = 46398, name = "Ring of holy" },
	{ id = 46408, name = "Amulet of holy" },
    { id = 46399, name = "Ring of ice" },
	{ id = 46407, name = "Amulet of ice" },
}

team1Id = 46294

local team1 = Action()

function team1.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 20)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Timira bag gave You a " .. rewardItem.name .. ".")
	return true
end

team1:id(team1Id)
team1:register()

local rewards = {
    { id = 46322, name = "red scorpion egg" },
	{ id = 46323, name = "purple scorpion egg" },
    { id = 46324, name = "black scorpion egg" },
	{ id = 46325, name = "white scorpion egg" },
    { id = 46285, name = "raptor question" },
    { id = 46278, name = "obscure horseshoe" },
	{ id = 46279, name = "radiant horseshoe" },
    { id = 46308, name = "griish outfit set" },
	{ id = 46309, name = "griish outfit set" },
    { id = 46310, name = "griish outfit set" },
	{ id = 46311, name = "griish outfit set" },
}

supriseId = 46294

local suprise = Action()

function suprise.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Suprise bag gave You a " .. rewardItem.name .. ".")
	return true
end

suprise:id(supriseId)
suprise:register()