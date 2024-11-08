local mType = Game.createMonsterType("Azazel")
local monster = {}

monster.description = "Azazel"
monster.experience = 8000000
monster.outfit = {
	lookType = 1924,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 30000000
monster.maxHealth = 30000000
monster.race = "blood"
monster.corpse = 49318
monster.speed = 730
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10,
}

monster.bosstiary = {
	bossRaceId = 2608,
	bossRace = RARITY_NEMESIS,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Join me in hell!!!!!!", yell = false },
	{ text = "HWAHAHAHAHAHAHA!", yell = false },
	{ text = "Let me take Your spirit!", yell = false },
}

monster.summons = {}

monster.loot = {
	{ id = 3043, chance = 60000, maxCount = 1000 }, -- crystal coin
{ id = 46359, chance = 500}, -- eternal night shadow necklace
	{ id = 46368, chance = 500 }, -- eternal night shadow ring
{ id = 46369, chance = 500 }, -- eternal night moon amulet
{ id = 46376, chance = 500 }, -- eternal night moon ring
{ id = 46355, chance = 500 }, -- eternal night demon ring
{ id = 46346, chance = 500 }, -- eternal night demon amulet
{ id = 46342, chance = 500 },-- eternal night root ring
{ id = 46336, chance = 500 }, -- eternal night root amulet


}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -10000, maxDamage = -23500, length = 8, spread = 0, effect = CONST_ME_WHITE_ENERGY_SPARK },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -10000, maxDamage = -30000, effect = CONST_ME_ICEATTACK },
	{ name = "melee", interval = 2000, chance = 100, skill = 200, attack = 250 },
	{ name = "combat", interval = 1000, chance = 7, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -6000, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false },
	{ name = "drunk", interval = 1000, chance = 7, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "strength", interval = 1000, chance = 9, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -9400, maxDamage = -22000, radius = 8, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -9400, maxDamage = -23000, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 1000, chance = 12, speedChange = -1900, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000 },
	{ name = "strength", interval = 1000, chance = 8, radius = 5, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -5000, maxDamage = -15000, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -5000, maxDamage = -15050, length = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 17000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 9000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "invisible", interval = 1000, chance = 4, effect = CONST_ME_MAGIC_BLUE },
	{ name = "invisible", interval = 1000, chance = 17, effect = CONST_ME_MAGIC_BLUE },
	{ name = "outfit", interval = 1000, chance = 2, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 12000, outfitItem = 2916 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "drunk", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
