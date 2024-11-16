local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_SQUARE1X1))



function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()

    -- Base min and max damage calculations
    local min = (level / 5) + (skill + attack) * 2.5 -- Reduced multiplier for less base impact
    local max = (level / 5) + (skill + attack) * 3.0 -- Reduced multiplier for less base impact

    -- Smoother scaling using square root
    local levelScalingFactor = (1 + math.sqrt(level / 1000)) -- Smoother growth curve

    min = min * levelScalingFactor
    max = max * levelScalingFactor

    -- Optional: add an upper limit on scaling for high levels
    local maxScalingCap = 1.8 -- Lower cap to limit scaling further
    if levelScalingFactor > maxScalingCap then
        levelScalingFactor = maxScalingCap
        min = min * (maxScalingCap / levelScalingFactor)
        max = max * (maxScalingCap / levelScalingFactor)
    end

    return -min * 1.05, -max * 1.3 -- Reduced final multipliers to further limit damage
end



combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(80)
spell:name("Berserk")
spell:words("exori")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_BERSERK)
spell:level(35)
spell:mana(115)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
