local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onGetFormulaValues(player, level, maglevel)
    -- Calculate maximum damage with a 20% reduction
    local max = ((level / 5) + (maglevel * 19)) * 0.8 -- Reduced by 20%

    -- Calculate minimum damage as 60% of maximum
    local min = max * 0.6

    -- Apply scaling factor similar to the previous spell
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    min = min * levelScalingFactor
    max = max * levelScalingFactor

    -- Optional cap on scaling for high levels
    local maxScalingCap = 2.2
    if levelScalingFactor > maxScalingCap then
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return -min * 1.0, -max * 1.9 -- Adjust multipliers for final output
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:group("attack", "ultimatestrikes")
spell:id(154)
spell:name("Ultimate Flame Strike")
spell:words("exori max flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ULTIMATE_FLAME_STRIKE)
spell:level(90)
spell:mana(100)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000, 30 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
