local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

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
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(87)
spell:name("Death Strike")
spell:words("exori mort")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_DEATH_STRIKE)
spell:level(16)
spell:mana(20)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
