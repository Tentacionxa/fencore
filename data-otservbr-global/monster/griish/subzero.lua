local mType = Game.createMonsterType("Sub Zero")
local monster = {}

monster.description = "Sub Zero"
monster.experience = 6250000
monster.outfit = {
	lookType = 187,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 700000
monster.maxHealth = 700000
monster.race = "undead"
monster.corpse = 46264
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 2605,
	bossRace = RARITY_ARCHFOE,
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
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.events = {
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Sub Icearth", chance = 12, interval = 1000, count = 4 },
	},
}
monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "... YOU!", yell = true },
	{ text = "ARRRRRRRRRK!", yell = false },
	{ text = "MY ICY SLIDE!", yell = false },
	{ text = "Ice ... devours!", yell = true },
}

monster.loot = {
	{id = 46315, chance = 20000, maxCount = 60}, 
{id = 46314, chance = 20000, maxCount = 5},
 {id = 46334, chance = 500},
  {id = 46072, chance = 200}, 
	{id = 46255, chance = 30},
{id = 46323, chance = 50},
{id = 46316, chance = 100000, maxCount = 1 },
{id = 43871, chance = 60},
{id = 43870, chance = 100},
{id = 43869, chance = 60},
{id = 43868, chance = 100},
}


monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -2300, maxDamage = -2750},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -4000, maxDamage = -7000, radius = 4, effect = 2, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -4000, maxDamage = -7000, range = 4, radius = 4, effect = 12, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -4000, maxDamage = -7000, length = 10, spread = 3, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -4000, maxDamage = -7000, length = 10, spread = 3, effect = 34, target = false},
	{name ="speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = 24, target = false, duration = 20000},
}


monster.defenses = {
	defense = 105,
	armor = 105,
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 700, maxDamage = 1500, effect = 236, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 100},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = -50},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
monster:setIcon("sub-terra", CreatureIconCategory_Quests, CreatureIconQuests_Earth, 10)
monster:setIcon("subterra", CreatureIconCategory_Quests, CreatureIconQuests_Ice, 50)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)