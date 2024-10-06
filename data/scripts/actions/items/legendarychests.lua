local rewards = {
	{ id = 43883, name = "Grand Sanguine Coil" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 43883, name = "grand sanguine coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43884, name = "Sanguine Boots" },
	{ id = 46370, name = "eternal night moon mantle" },
	{ id = 46374, name = "eternal night moon crown" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 43883, name = "grand sanguine coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43884, name = "Sanguine Boots" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 43883, name = "grand sanguine coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43884, name = "Sanguine Boots" },
}

legendaryId = 46042

local legendary = Action()

function legendary.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Legendary Castle Box gives You a " .. rewardItem.name .. ".")
	return true
end

legendary:id(legendaryId)
legendary:register()

local rewards = {
	{ id = 43883, name = "Grand Sanguine Coil" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 43883, name = "grand sanguine coil" },
	{ id = 43882, name = "Sanguine Coil" },
    { id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 43883, name = "grand sanguine coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43884, name = "Sanguine Boots" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43884, name = "Sanguine Boots" },
    { id = 46373, name = "eternal night moon galoshes" },
	{ id = 46375, name = "eternal night moon legs" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 43883, name = "grand sanguine coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 43884, name = "Sanguine Boots" },
}

sorcererId = 46083

local sorcerer = Action()

function sorcerer.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorcerer's Chest gives You a " .. rewardItem.name .. ".")
	return true
end

sorcerer:id(sorcererId)
sorcerer:register()

local rewards = {
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43887, name = "sanguine galoshes" },
	{ id = 43883, name = "grand sanguine coil" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 43887, name = "Sanguine Galoshes" },
    { id = 46341, name = "eternal night root mask" },
    { id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43887, name = "sanguine galoshes" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43887, name = "Sanguine Galoshes" },
	{ id = 46343, name = "eternal night root robe" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43887, name = "sanguine galoshes" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43887, name = "Sanguine Galoshes" },
}

bronzeId = 46041

local bronze = Action()

function bronze.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Bronze Castle Box gives You a " .. rewardItem.name .. ".")
	return true
end

bronze:id(bronzeId)
bronze:register()

local rewards = {
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43887, name = "sanguine galoshes" },
	{ id = 43883, name = "grand sanguine coil" },
    { id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43887, name = "sanguine galoshes" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43887, name = "Sanguine Galoshes" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 43887, name = "Sanguine Galoshes" },
    { id = 46340, name = "eternal night root pants" },
    { id = 39151, name = "arcanomancer regalia" },
	{ id = 43887, name = "sanguine galoshes" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43887, name = "Sanguine Galoshes" },
	{ id = 46339, name = "eternal night root galoshes" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 34095, name = "soulmantle" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 43887, name = "sanguine galoshes" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43885, name = "Sanguine Rod" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43887, name = "Sanguine Galoshes" },
}

druidId = 46084

local druid = Action()

function druid.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Druid's Chest gives You a " .. rewardItem.name .. ".")
	return true
end

druid:id(druidId)
druid:register()

local rewards = {
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
    { id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
    { id = 43878, name = "Grand Sanguine Bow" },
    { id = 43878, name = "Grand Sanguine Bow" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
    { id = 46360, name = "eternal night shadow tabard" },
    { id = 43878, name = "Grand Sanguine Bow" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
    { id = 43878, name = "Grand Sanguine Bow" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
	{ id = 46356, name = "eternal night headguard" },
    { id = 43878, name = "Grand Sanguine Bow" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
}

silverId = 46040

local silver = Action()

function silver.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Silver Castle Box gives You a " .. rewardItem.name .. ".")
	return true
end

silver:id(silverId)
silver:register()

local rewards = {
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
    { id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
    { id = 43878, name = "Grand Sanguine Bow" },
    { id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
    { id = 46362, name = "eternal night shadow boots" },
    { id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
    { id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
	{ id = 46364, name = "eternal night shadow greaves" },
    { id = 43878, name = "Grand Sanguine Bow" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
    { id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43877, name = "Sanguine Bow" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
	{ id = 43879, name = "Sanguine Crossbow" },
	{ id = 43881, name = "Sanguine Greaves" },
}

paladinId = 46086

local paladin = Action()

function paladin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Paladin's Chest Box gives You a " .. rewardItem.name .. ".")
	return true
end

paladin:id(paladinId)
paladin:register()

local rewards = {
	{ id = 43873, name = "Grand Sanguine Bludgeon" },
	{ id = 43875, name = "Grand Sanguine Battleaxe" },
	{ id = 43871, name = "Grand Sanguine Razor" },
	{ id = 43865, name = "Grand Sanguine Blade" },
	{ id = 43867, name = "Grand Sanguine Cudgel" },
    { id = 34097, name = "pair of soulwalkers" },
	{ id = 43871, name = "Grand Sanguine Razor" },
	{ id = 43865, name = "Grand Sanguine Blade" },
	{ id = 43867, name = "Grand Sanguine Cudgel" },
	{ id = 43869, name = "Grand Sanguine Hatchet" },
    { id = 34097, name = "pair of soulwalkers" },
	{ id = 43871, name = "Grand Sanguine Razor" },
	{ id = 43865, name = "Grand Sanguine Blade" },
	{ id = 43867, name = "Grand Sanguine Cudgel" },
	{ id = 43869, name = "Grand Sanguine Hatchet" },
	{ id = 39148, name = "spiritthorn helmet" },
    { id = 46345, name = "eternal night demon plate" },
    { id = 34097, name = "pair of soulwalkers" },
	{ id = 43871, name = "Grand Sanguine Razor" },
	{ id = 43865, name = "Grand Sanguine Blade" },
	{ id = 43867, name = "Grand Sanguine Cudgel" },
	{ id = 43869, name = "Grand Sanguine Hatchet" },
	{ id = 46353, name = "eternal night demon helmet" },
	{ id = 39147, name = "spiritthorn armor" },
	{ id = 34097, name = "pair of soulwalkers" },
	{ id = 43871, name = "Grand Sanguine Razor" },
	{ id = 43865, name = "Grand Sanguine Blade" },
	{ id = 43867, name = "Grand Sanguine Cudgel" },
	{ id = 43869, name = "Grand Sanguine Hatchet" },
}

goldenId = 46039

local golden = Action()

function golden.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Golden Castle Box gives You a " .. rewardItem.name .. ".")
	return true
end

golden:id(goldenId)
golden:register()



local rewards = {
	{ id = 43864, name = "Sanguine Blade" },
	{ id = 43866, name = "Sanguine Cudgel" },
	{ id = 43868, name = "Sanguine Hatchet" },
	{ id = 43870, name = "Sanguine Razor" },
	{ id = 43872, name = "Sanguine Bludgeon" },
	{ id = 43874, name = "Sanguine Battleaxe" },
	{ id = 43876, name = "Sanguine Legs" },
	{ id = 39148, name = "spiritthorn helmet" },
    { id = 43864, name = "Sanguine Blade" },
	{ id = 43866, name = "Sanguine Cudgel" },
    { id = 43864, name = "Sanguine Blade" },
	{ id = 43866, name = "Sanguine Cudgel" },
	{ id = 43868, name = "Sanguine Hatchet" },
	{ id = 43870, name = "Sanguine Razor" },
	{ id = 43872, name = "Sanguine Bludgeon" },
	{ id = 43874, name = "Sanguine Battleaxe" },
	{ id = 43876, name = "Sanguine Legs" },
	{ id = 43868, name = "Sanguine Hatchet" },
	{ id = 43870, name = "Sanguine Razor" },
	{ id = 43872, name = "Sanguine Bludgeon" },
	{ id = 43874, name = "Sanguine Battleaxe" },
	{ id = 43876, name = "Sanguine Legs" },
    { id = 46354, name = "eternal night demon legs" },
    { id = 43864, name = "Sanguine Blade" },
	{ id = 43866, name = "Sanguine Cudgel" },
	{ id = 43868, name = "Sanguine Hatchet" },
	{ id = 43870, name = "Sanguine Razor" },
    { id = 43864, name = "Sanguine Blade" },
	{ id = 43866, name = "Sanguine Cudgel" },
	{ id = 43868, name = "Sanguine Hatchet" },
	{ id = 43870, name = "Sanguine Razor" },
	{ id = 43872, name = "Sanguine Bludgeon" },
	{ id = 43874, name = "Sanguine Battleaxe" },
	{ id = 43876, name = "Sanguine Legs" },
	{ id = 43872, name = "Sanguine Bludgeon" },
	{ id = 43874, name = "Sanguine Battleaxe" },
	{ id = 43876, name = "Sanguine Legs" },
	{ id = 46350, name = "eternal night demon boots" },
	{ id = 39147, name = "spiritthorn armor" },
	{ id = 34097, name = "pair of soulwalkers" },
	{ id = 43864, name = "Sanguine Blade" },
	{ id = 43866, name = "Sanguine Cudgel" },
	{ id = 43868, name = "Sanguine Hatchet" },
	{ id = 43870, name = "Sanguine Razor" },
	{ id = 43872, name = "Sanguine Bludgeon" },
	{ id = 43874, name = "Sanguine Battleaxe" },
	{ id = 43876, name = "Sanguine Legs" },
}

knightId = 46085

local knight = Action()

function knight.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Knight's Chest Box gives You a " .. rewardItem.name .. ".")
	return true
end

knight:id(knightId)
knight:register()