local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(player, level, maglevel)
    -- Base healing calculations using "exori" style scaling, increased by 20%
    local min = (level / 5) + (maglevel * 54) -- Increased base multiplier for minimum healing
    local max = (level / 5) + (maglevel * 66) -- Increased base multiplier for maximum healing

    -- Conservative scaling using square root for balanced progression
    local levelScalingFactor = 1 + math.sqrt(level / 1500)
    min = min * levelScalingFactor
    max = max * levelScalingFactor

    -- Optional cap on scaling for high levels
    local maxScalingCap = 1.8
    if levelScalingFactor > maxScalingCap then
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return min * 1.2, max * 1.3 -- Final multipliers for healing output
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end

spell:group("healing")
spell:id(239)
spell:name("Fair Wound Cleansing")
spell:words("exura med ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FAIR_WOUND_CLEANSING)
spell:level(300)
spell:mana(90)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:isAggressive(false)
spell:vocation("knight;true", "elite knight;true")
spell:needLearn(false)
spell:register()
