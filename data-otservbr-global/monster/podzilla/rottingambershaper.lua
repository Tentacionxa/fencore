local mType = Game.createMonsterType("Rootthing Amber Shaper")
local monster = {}

monster.description = "a rootthing amber shaper"
monster.experience = 31740
monster.outfit = {
	lookType = 1762,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2539
monster.Bestiary = {
	class = "Plant",
	race = BESTY_RACE_PLANT,
	toKill = 2500,
	FirstUnlock = 200,
	SecondUnlock = 2500,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Podzilla Stalk.",
}

monster.health = 25000
monster.maxHealth = 25000
monster.race = "undead"
monster.corpse = 49148
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
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
	{ text = "<KNARR>", yell = false },
	{ text = "<RATTLE>", yell = false },
	{ text = "<CROAK>", yell = false },
}

monster.loot = {
    { name = "crystal coin", chance = 12380, maxCount = 8 },
    { name = "platinum coin", chance = 12380, maxCount = 38 },
    { id = 48413, chance = 4460 }, --  amber sickle
    { id = 48511, chance = 4460 }, --  resin parasite 32624
    { id = 32624, chance = 4460 }, --  
    { id = 45652, chance = 4460 }, --  
    { id = 48505, chance = 4460 }, --  
    { id = 5741, chance = 4460 }, --  
    { id = 32625, chance = 4460 }, 
    { id = 45653, chance = 4460 }, 
    { id = 48510, chance = 4460 }, 
    { id = 7422, chance = 4460 },
    { id = 45657, chance = 4460 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1000 },
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -1100, maxDamage = -2350, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -1150, maxDamage = -2300, range = 7, radius = 4, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -1000, maxDamage = -1900, range = 7, shootEffect = CONST_ANI_SPECTRALBOLT, effect = CONST_ME_HOLYDAMAGE, target = true },
	{ name = "combat", interval = 2000, chance = 24, type = COMBAT_HOLYDAMAGE, minDamage = -1100, maxDamage = -1900, range = 7, radius = 3, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_YELLOW_ENERGY_SPARK, target = true },
	{ name = "destroy magic walls", interval = 1000, chance = 30 },
}

monster.defenses = {
	defense = 100,
	armor = 100,
	mitigation = 2.75,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)