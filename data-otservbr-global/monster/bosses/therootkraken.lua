local mType = Game.createMonsterType("The Rootkraken")
local monster = {}

monster.description = "The Rootkraken"
monster.experience = 3700000
monster.outfit = {
	lookType = 1765,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2528,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 1400000
monster.maxHealth = 1400000
monster.race = "undead"
monster.corpse = 48418
monster.speed = 135
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

monster.events = {
}
monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {

}

monster.summons = {
}

monster.loot = {
    { name = "platinum coin", chance = 100000, maxCount = 140 },
	{ name = "crystal coin", chance = 100000, maxCount = 180 },
    { name = "supreme health potion", chance = 100000, maxCount = 4 },
    { name = "ultimate health potion", chance = 100000, maxCount = 19 },
    { name = "ultimate spirit potion", chance = 100000, maxCount = 14 },
	{ name = "giant topaz", chance = 5000 },
    { name = "yellow gem", chance = 5000 },
    { name = "amber wand", chance = 400, unique = true },
	{ name = "amber slayer", chance = 400, unique = true },
    { name = "amber amber sabre", chance = 400, unique = true },
	{ name = "amber rod", chance = 400, unique = true },
	{ name = "amber amber greataxe", chance = 400, unique = true },
    { name = "amber cudgel", chance = 400, unique = true },
	{ name = "amber crossbow", chance = 400, unique = true },
	{ name = "amber bludgeon", chance = 400, unique = true },
	{ name = "amber bow", chance = 400, unique = true },
	{ name = "spark sphere", chance = 100000 },
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -2500, length = 8, spread = 0, effect = CONST_ME_SMALLPLANTS },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -1500, maxDamage = -1100, effect = CONST_ME_SMALLPLANTS },
	{ name = "melee", interval = 2000, chance = 100, skill = 200, attack = 250 },
    { name = "speed", interval = 2000, chance = 10, speedChange = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
    { name = "rootkrakendeath", interval = 4000, chance = 6, target = false },
    { name = "combat", interval = 2000, chance = 13, type = COMBAT_EARTHDAMAGE, minDamage = -1200, maxDamage = -1400, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false },
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
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
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
