local mType = Game.createMonsterType("Mithmah Vanguard")
local monster = {}

monster.description = "Mithmah Vanguard"
monster.experience = 3000000
monster.outfit = {
	lookType = 1716,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2464,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 155000
monster.maxHealth = 155000
monster.race = "undead"
monster.corpse = 44687
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

monster.events = {
	"BakragoreDeath",
}
monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Die, human. Now!", yell = false },
	{ text = "FEAR THE CURSE!", yell = false },
    { text = "You're the intruder.", yell = false },
	{ text = "The Iks have always been ours.", yell = false },
    { text = "NOW TREMBLE!", yell = false },
	{ text = "GOT YOU NOW!", yell = false },
}

monster.summons = {
}

monster.loot = {
    { id = 44620, chance = 1500, maxCount = 1 }, -- stoic
    { id = 44643, chance = 2000, maxCount = 1 }, -- stoic
    { id = 44648, chance = 2000, maxCount = 1 }, -- stoic
    { id = 44619, chance = 1000, maxCount = 1 }, -- stoic
    { id = 44636, chance = 2200, maxCount = 1 }, -- stoic
    { id = 44637, chance = 3000, maxCount = 1 }, -- stoic
    { id = 44642, chance = 2000, maxCount = 1 }, -- stoic
    { id = 44649, chance = 1000, maxCount = 1 }, -- stoic
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -2500, length = 8, spread = 0, effect = CONST_ME_GREYCHAIN },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -500, effect = CONST_ME_DEATHATTACK },
	{ name = "melee", interval = 2000, chance = 100, skill = 200, attack = 250 },
	{ name = "combat", interval = 1000, chance = 7, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -500, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false },
    { name = "speed", interval = 2000, chance = 10, speedChange = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
    { name = "gaz'haragoth death", interval = 4000, chance = 6, target = false },
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
