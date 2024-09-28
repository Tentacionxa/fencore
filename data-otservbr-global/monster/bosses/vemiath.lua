local mType = Game.createMonsterType("Vemiath")
local monster = {}

monster.description = "Vemiath"
monster.experience = 3250000
monster.outfit = {
	lookType = 1668,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2365,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 350000
monster.maxHealth = 350000
monster.race = "undead"
monster.corpse = 6068
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "WILL ... PUNISH ... YOU!", yell = false },
	{ text = "RAAAR!", yell = false },
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "elder bloodjaw", chance = 100, interval = 1000, count = 2 },
	},
}

monster.loot = {
	{ id = 3025, chance = 3500 }, -- ancient amulet
	{ id = 3116, chance = 9000 }, -- big bone
	{ id = 3043, chance = 5000, maxCount = 125 }, -- crystal coins
    { id = 23375, chance = 7000, maxCount = 179 }, -- supreme health potion
    { id = 7440, chance = 6000, maxCount = 44 }, -- mastermind potion
    { id = 36706, chance = 5000, maxCount = 5 }, -- red gem
    { id = 9058, chance = 7000, maxCount = 3 }, -- gold ingot
    { id = 32622, chance = 7500, maxCount = 1 }, -- giant amethyst
    { id = 30053, chance = 6000, maxCount = 1 }, -- dragon figurine
    { id = 23373, chance = 7000, maxCount = 211 }, -- ultimate mana potion
    { id = 7443, chance = 6000, maxCount = 42 }, -- bulsseye potion
    { id = 3041, chance = 6000, maxCount = 5 }, -- blue gem
    { id = 3037, chance = 5000, maxCount = 5 }, -- yellow gem
    { id = 30060, chance = 4500, maxCount = 1 }, -- giant emerald
    { id = 7440, chance = 5500, maxCount = 44 }, -- mastermind potion
    { id = 33778, chance = 8000, maxCount = 1 }, -- raw watermelon
    { id = 43961, chance = 7000, maxCount = 1 }, -- darklight figurine
    { id = 23374, chance = 7000, maxCount = 35 }, -- ultimate spirit potion
    { id = 7439, chance = 7000, maxCount = 45 }, -- berserk potion
    { id = 3038, chance = 7000, maxCount = 5 }, -- green gem
    { id = 3036, chance = 2500, maxCount = 5 }, -- violet gem
    { id = 32623, chance = 4500, maxCount = 1 }, -- giant topaz
    { id = 43967, chance = 6500, maxCount = 1 }, -- vemiath infused basalt
    { id = 43503, chance = 6500, maxCount = 1 }, -- essence of vemiath
    { id = 43860, chance = 300, maxCount = 1 }, -- bag you covet
    { id = 44048, chance = 800, maxCount = 1 }, -- spiritual horsehoe
	{ id = 43854, chance = 500, maxCount = 1 }, -- tainted heart
	{ id = 43855, chance = 500, maxCount = 1 }, -- darklight heart
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -2500, length = 8, spread = 0, effect = CONST_ME_GREYCHAIN },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -500, effect = CONST_ME_DEATHATTACK },
	{ name = "melee", interval = 2000, chance = 100, skill = 200, attack = 250 },
	{ name = "combat", interval = 1000, chance = 7, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -500, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false },
    { name = "speed", interval = 2000, chance = 10, speedChange = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
    { name = "vemiathdoom", interval = 4000, chance = 10, target = false },
    { name = "combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_POFF, target = false },
    { name = "combat", interval = 2000, chance = 19, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -800, range = 7, radius = 6, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 2,
	armor = 3,
	--	mitigation = ???,
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
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
