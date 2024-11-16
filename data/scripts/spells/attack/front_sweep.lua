local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

function onGetFormulaValues(player, skill, attack, factor)
    local skillTotal = skill * attack
    local levelTotal = player:getLevel() / 5

    -- Apply multipliers adjusted to be 30% stronger than "exori"
    local min = ((skillTotal * 0.026) + 26) + levelTotal -- Adjusted for 30% more than "exori"
    local max = ((skillTotal * 0.052) + 39) + levelTotal -- Adjusted for 30% more than "exori"

    -- Conservative scaling for balanced progression
    local levelScalingFactor = 1 + math.sqrt(player:getLevel() / 1800) -- Moderate growth to maintain balance

    min = min * levelScalingFactor
    max = max * levelScalingFactor

    -- Optional cap on scaling to control high-level growth
    local maxScalingCap = 1.3 -- Cap to keep the damage in check
    if levelScalingFactor > maxScalingCap then
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return -min * 1.1, -max * 1.4 -- Final multipliers to achieve 30% stronger damage
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(59)
spell:name("Front Sweep")
spell:words("exori min")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FRONT_SWEEP)
spell:level(70)
spell:mana(200)
spell:isPremium(true)
spell:needDirection(true)
spell:needWeapon(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
