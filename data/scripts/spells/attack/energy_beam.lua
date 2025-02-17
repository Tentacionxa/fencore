local function formulaFunction(player, level, maglevel)
    -- Calculate base maximum damage and reduce it by an additional 10% from the previous scaling
    local max = ((level / 5) + (maglevel * 14) + 19) * 0.765 -- 0.85 (previous reduction) * 0.9 (10% additional reduction)

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
    initCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
    initCombat:setArea(createCombatArea(area, areaDiagonal))
    return initCombat
end

local combat = createCombat(AREA_BEAM5, AREADIAGONAL_BEAM5, "onGetFormulaValues")
local combatWOD = createCombat(AREA_BEAM7, AREADIAGONAL_BEAM7, "onGetFormulaValuesWOD")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    local player = creature:getPlayer()
    if creature and player and player:instantSkillWOD("Beam Mastery") then
        var.runeName = "Beam Mastery"
        return combatWOD:execute(creature, var)
    end
    return combat:execute(creature, var)
end

spell:group("attack")
spell:id(22)
spell:name("Energy Beam")
spell:words("exevo vis lux")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ENERGY_BEAM)
spell:level(23)
spell:mana(40)
spell:isPremium(false)
spell:needDirection(true)
spell:blockWalls(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
