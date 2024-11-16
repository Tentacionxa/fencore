local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setArea(createCombatArea(AREA_SHORTWAVE3))

function onGetFormulaValues(player, level, maglevel)
    -- Updated formula with maglevel multiplied by 18 and only max value considered
    local max = (level / 5) + (maglevel * 18) + 48

    -- Scaling factor based on player level
    local levelScalingFactor = 1 + math.sqrt(level / 1200)
    local maxScalingCap = 2.4
    if levelScalingFactor > maxScalingCap then
        levelScalingFactor = maxScalingCap
    end

    -- Apply scaling to max value
    max = max * levelScalingFactor

    return 0, -max -- No minimum value
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:group("attack")
spell:id(43)
spell:name("Strong Ice Wave")
spell:words("exevo gran frigo hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_STRONG_ICE_WAVE)
spell:level(40)
spell:mana(170)
spell:needDirection(true)
spell:cooldown(8 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
