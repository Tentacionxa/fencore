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


-- feral bags (craft items )


-- feral bags (craft items )


-- feral bags (craft items )

local rewards = {
	{ id = 43962, name = "Putrefactive Figurine" },
	{ id = 43968, name = "Bakragores Amalgamation" },
	{ id = 43854, name = "Tainted Heart" },
	{ id = 3063, name = "Gold Ring" },
	{ id = 7395, name = "Orc Trophy" },
	{ id = 32621, name = "Ring of Souls" },
	{ id = 3012, name = "Wolf Tooth Chain" },
	{ id = 3006, name = "Ring of the Sky" },
	{ id = 7401, name = "Minotaur Trophy" },
	{ id = 46628, name = "Amber Crusher" },
	{ id = 9667, name = "Boggy Dreads" },
	{ id = 43884, name = "Sanguine Boots" },
	{ id = 5909, name = "White piece of Cloth" },
	{ id = 39151, name = "Arcanomancer Regalia" },
	{ id = 39152, name = "Arcanomancer Folio" },
	{ id = 34095, name = "Soulmantle" },
	{ id = 43779, name = "Unstable Darklight Matter" },
	{ id = 43849, name = "Rotten Roots" },
	{ id = 43850, name = "Dark Obisidian Splinter" },
	{ id = 10315, name = "Sulphurous Stone" },
	{ id = 16124, name = "Blue crystal Splinter" },
	{ id = 22516, name = "Silver Tokens" },
	{ id = 8090, name = "Spellbook of Dark mysteries" },
	{ id = 20207, name = "Pool of chitinous glue" },
	{ id = 9646, name = "Book of Prayers" },
	{ id = 10320, name = "Book of necromantic rituals" },
	{ id = 3598, name = "Cookie" },
	{ id = 48250, name = "Dark Chocolate Coin" },
	{ id = 6393, name = "Cream Cake" },
	{ id = 48252, name = "Brigadeiros" },
	{ id = 43851, name = "Darklight Matter" },
	{ id = 7451, name = "Shadow Sceptre" },
	{ id = 43850, name = "Dark Obsidian Splinter" },
	{ id = 43882, name = "Sanguine Coil" },
	{ id = 11490, name = "Quara Pincers" },
	{ id = 13990, name = "Necklace of the deep" },
	{ id = 48413, name = "Amber Sickle" },
	{ id = 48510, name = "Demon Roots" },

}

feraId = 46092

local fera = Action()

function fera.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 5)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Fera bag gives You a " .. rewardItem.name .. ".")
	return true
end

fera:id(feraId)
fera:register()

local rewards = {

	{ id = 34088, name = "soulbleeder" },
	{ id = 43881, name = "sanguine greaves" },
	{ id = 39149, name = "alicorn headguard" },
	{ id = 34098, name = "pair of soulstalkers" },
	{ id = 34094, name = "soulshell" },
	{ id = 10300, name = "carniphila's seeds" },
	{ id = 19110, name = "dowser" },
	{ id = 21197, name = "slimy leaf tentacles" },
	{ id = 3740, name = "shadow herbs" },
	{ id = 44753, name = "herald's insignia" },
	{ id = 44751, name = "gold-scaled sentinel" },
	{ id = 44745, name = "mega dragon hearts" },
	{ id = 3350, name = "bow" },
	{ id = 44624, name = "mystical dragon robe" },
	{ id = 22866, name = "rift bow" },
	{ id = 8027, name = "composite hornbow" },
	{ id = 43779, name = "unstable darklight matter" },
	{ id = 43849, name = "rotten roots" },
	{ id = 5479, name = "cat's paw" },
	{ id = 5944, name = "soul orbs" },
	{ id = 5954, name = "demon horns" },
	{ id = 34018, name = "figurine of malice" },
	{ id = 33920, name = "Malice's horn" },
	{ id = 33921, name = "Malice's spine" },
	{ id = 3063, name = "gold ring" },
	{ id = 33924, name = "Greed's arm" },
	{ id = 30053, name = "dragon figurine" },
	{ id = 34075, name = "skull of a beast" },
	{ id = 3006, name = "ring of the sky" },
	{ id = 7401, name = "minotaur trophy" },
	{ id = 46628, name = "amber crussher" },
	{ id = 9667, name = "boggy dreads" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 5909, name = "white piece of cloth" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 48413, name = "amber sickle" },
	{ id = 43885, name = "sanguine rod" },
	{ id = 43850, name = "dark obsidian splinter" },
	{ id = 10315, name = "sulphurous stone" },
	{ id = 16124, name = "blue crystal splinter" },
}

tenebrisId = 46094

local tenebris = Action()

function tenebris.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Tenebris Bag gives You a " .. rewardItem.name .. ".")
	return true
end

tenebris:id(tenebrisId)
tenebris:register()

local rewards = {

	{ id = 3278, name = "magic longsword" },
	{ id = 3288, name = "magic sword" },
	{ id = 43870, name = "sanguine razor" },
	{ id = 43866, name = "sanguine cudgel" },
	{ id = 34097, name = "pair of soulwalkers" },
	{ id = 34099, name = "soulbastion" },
	{ id = 39148, name = "spiritthorn helmet" },
	{ id = 39147, name = "spiritthorn armor" },
	{ id = 5914, name = "yellow piece of cloth" },
	{ id = 5910, name = "green piece of cloth" },
	{ id = 6553, name = "ruthless axe" },
	{ id = 44745, name = "mega dragon hearts" },
	{ id = 5909, name = "white piece of cloth" },
	{ id = 3350, name = "bow" },
	{ id = 44624, name = "mystical dragon robe" },
	{ id = 5925, name = "hardened bone" },
	{ id = 43874, name = "sanguine battleaxe" },
	{ id = 7413, name = "titan axe" },
	{ id = 43849, name = "rotten roots" },
	{ id = 5479, name = "cat's paw" },
	{ id = 5944, name = "soul orbs" },
	{ id = 6499, name = "demonic essence" },
	{ id = 3370, name = "knight armor" },
	{ id = 3389, name = "demon legs" },
	{ id = 3420, name = "demon shield" },
	{ id = 27650, name = "gnome shield" },
	{ id = 11688, name = "shield of corruption" },
	{ id = 6131, name = "tortoise shield" },
	{ id = 45641, name = "candy necklace" },
	{ id = 45643, name = "biscuit barrier" },
	{ id = 5910, name = "green piece of cloth" },
	{ id = 6553, name = "ruthless axe" },
	{ id = 3280, name = "fire sword" },
	{ id = 3002, name = "voodoo doll" },
	{ id = 16120, name = "violet crystal shard" },
	{ id = 43968, name = "Bakragore's amalgamation" },
	{ id = 23503, name = "sparkion tails" },
	{ id = 23535, name = "energy bars" },
	
}

mysticId = 46082

local mystic = Action()

function mystic.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Mystic Bag gives You a " .. rewardItem.name .. ".")
	return true
end

mystic:id(mysticId)
mystic:register()

local rewards = {

	{ id = 43887, name = "sanguine galoshes" },
	{ id = 34093, name = "soulstrider" },
	{ id = 34096, name = "soulshroud" },
	{ id = 39153, name = "arboreal crown" },
	{ id = 39154, name = "arboreal tome" },
	{ id = 16124, name = "blue crystal splinter" },
	{ id = 16126, name = "red crystal fragment" },
	{ id = 16138, name = "crystalline spikes" },
	{ id = 676, name = "small enchanted ruby" },
	{ id = 9302, name = "sacred tree amulet" },
	{ id = 32630, name = "spooky hood" },
	{ id = 32617, name = "fabulous legs" },
	{ id = 32618, name = "soulful legs" },
	{ id = 32703, name = "death toll" },
	{ id = 24392, name = "gemmed figurine" },
	{ id = 32773, name = "ivory comb" },
	{ id = 33926, name = "Spite's spirit" },
	{ id = 43849, name = "rotten roots" },
	{ id = 43850, name = "dark obsidian splinter" },
	{ id = 10315, name = "sulphurous stone" },
	{ id = 16124, name = "blue crystal splinter" },
	{ id = 34018, name = "figurine of malice" },
	{ id = 33920, name = "Malice's horn" },
	{ id = 33921, name = "Malice's spine" },
	{ id = 3063, name = "gold ring" },
	{ id = 33924, name = "Greed's arm" },
	{ id = 30053, name = "dragon figurine" },
	{ id = 34075, name = "skull of a beast" },
	{ id = 3006, name = "ring of the sky" },
	{ id = 7401, name = "minotaur trophy" },
	{ id = 46628, name = "amber crussher" },
	{ id = 9667, name = "boggy dreads" },
	{ id = 43884, name = "sanguine boots" },
	{ id = 5909, name = "white piece of cloth" },
	{ id = 39151, name = "arcanomancer regalia" },
	{ id = 39152, name = "arcanomancer folio" },
	{ id = 48413, name = "amber sickle" },
	{ id = 43885, name = "sanguine rod" },

}

albaId = 46093

local alba = Action()

function alba.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Alba Bag gives You a " .. rewardItem.name .. ".")
	return true
end

alba:id(albaId)
alba:register()