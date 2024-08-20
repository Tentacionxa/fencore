local area = createCombatArea({
	{ 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0 },
	{ 0, 0, 3, 0, 0 },
	{ 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0 },
})

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DIAMONDARROW)
combat:setParameter(COMBAT_PARAM_IMPACTSOUND, SOUND_EFFECT_TYPE_DIAMOND_ARROW_EFFECT)
combat:setParameter(COMBAT_PARAM_CASTSOUND, SOUND_EFFECT_TYPE_DIST_ATK_BOW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
function onGetFormulaValues(player, skill, attack, factor)
	local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
	local min = (player:getLevel() / 5)
	local max = (0.09 * factor) * distanceSkill * 380 + (player:getLevel() / 5)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat:setArea(area)

local boltArrow = Weapon(WEAPON_AMMO)

function boltArrow.onUseWeapon(player, variant)
	return combat:execute(player, variant)
end

boltArrow:id(35902)
boltArrow:id(35902)
boltArrow:level(150)
boltArrow:attack(37)
boltArrow:action("removecount")
boltArrow:ammoType("bolt")
boltArrow:shootType(CONST_ANI_DIAMONDARROW)
boltArrow:maxHitChance(100)
boltArrow:wieldUnproperly(true)
boltArrow:register()
