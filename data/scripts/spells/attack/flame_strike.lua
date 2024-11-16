local function formulaFunction(player, level, maglevel)
    -- Calculate base maximum damage and increase it by 50%
    local max = (((level / 5) + (maglevel * 2.203) + 13) * 0.7275) * 1.5 -- Increased by 50%

    -- Apply scaling factor similar to "exori"
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    max = max * levelScalingFactor

    -- Optional cap on scaling for high levels
    local maxScalingCap = 2.2
    if levelScalingFactor > maxScalingCap then
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return 0, -max -- No minimum damage, only maximum damage applied
end

function onGetFormulaValues(player, level, maglevel)
    return formulaFunction(player, level, maglevel)
end

local combat = Combat()
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:group("attack")
spell:id(89)
spell:name("Flame Strike")
spell:words("exori flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_FLAME_STRIKE)
spell:level(14)
spell:mana(20)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "druid;true", "master sorcerer;true", "elder druid;true")
spell:register()
