local function formulaFunction(player, level, maglevel)
    -- Calculate base maximum damage and reduce it by 15%
    local max = ((level / 5) + (maglevel * 23)) * 0.85

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

function onGetFormulaValuesWOD(player, level, maglevel)
    return formulaFunction(player, level, maglevel)
end

local function createCombat(area, areaDiagonal, combatFunc)
    local initCombat = Combat()
    initCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, combatFunc)
    initCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    initCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
    initCombat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
    initCombat:setArea(createCombatArea(area, areaDiagonal))
    return initCombat
end

local combat = createCombat(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5, "onGetFormulaValues")
local combatWOD = createCombat(AREA_WAVE7, AREADIAGONAL_WAVE7, "onGetFormulaValuesWOD")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    local player = creature:getPlayer()
    if creature and player then
        if player:getWheelSpellAdditionalArea("Energy Wave") then
            return combatWOD:execute(creature, var)
        end
    end
    return combat:execute(creature, var)
end

spell:group("attack")
spell:id(13)
spell:name("Energy Wave")
spell:words("exevo vis hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ENERGY_WAVE)
spell:level(38)
spell:mana(170)
spell:needDirection(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
