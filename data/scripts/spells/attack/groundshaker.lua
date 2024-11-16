local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()

    -- Apply base multipliers increased by 30% compared to "Brutal Strike"
    local min = (level / 5) + (skill + attack) * 1.56 -- Increased by 30%
    local max = (level / 5) + (skill + attack) * 2.08 -- Increased by 30%

    -- Conservative scaling for fair progression
    local levelScalingFactor = 1 + math.sqrt(level / 1800) -- Slightly higher scaling than "Brutal Strike"

    min = min * levelScalingFactor
    max = max * levelScalingFactor

    -- Optional cap on scaling for high levels
    local maxScalingCap = 1.4 -- Slightly higher cap than "Brutal Strike"
    if levelScalingFactor > maxScalingCap then
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return -min * 1.15, -max * 1.4 -- Adjusted multipliers for balanced output
end



combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(106)
spell:name("Groundshaker")
spell:words("exori mas")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_GROUNDSHAKER)
spell:level(33)
spell:mana(160)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
