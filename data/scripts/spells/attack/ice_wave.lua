local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setArea(createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4))


function onGetFormulaValues(player, level, maglevel)
    -- Calculate base maximum damage and increase it by 50%
    local max = (((level / 5) + (maglevel * 2.003) + 13) * 0.7275) * 1.5 -- Increased by 50%

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



combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(121)
spell:name("Ice Wave")
spell:words("exevo frigo hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ICE_WAVE)
spell:level(18)
spell:mana(25)
spell:needDirection(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
