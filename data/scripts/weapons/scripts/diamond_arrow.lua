local area = createCombatArea({
    { 0, 1, 1, 1, 0 },
    { 1, 1, 1, 1, 1 },
    { 1, 1, 3, 1, 1 },
    { 1, 1, 1, 1, 1 },
    { 0, 1, 1, 1, 0 },
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
    local level = player:getLevel()
    
    -- Base min and max damage
    local min = (level / 5) + (distanceSkill * 2.5)
    local max = (level / 5) + (0.09 * factor) * distanceSkill * 192

    -- Apply scaling factor based on player level
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    local maxScalingCap = 3.0
    if levelScalingFactor > maxScalingCap then
        levelScalingFactor = maxScalingCap
    end

    -- Scale the max damage
    max = max * levelScalingFactor

    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat:setArea(area)

local diamondArrow = Weapon(WEAPON_AMMO)

function diamondArrow.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

diamondArrow:id(25757)
diamondArrow:id(35901)
diamondArrow:level(150)
diamondArrow:attack(37)
diamondArrow:action("removecount")
diamondArrow:ammoType("arrow")
diamondArrow:shootType(CONST_ANI_DIAMONDARROW)
diamondArrow:maxHitChance(100)
diamondArrow:wieldUnproperly(true)
diamondArrow:register()
