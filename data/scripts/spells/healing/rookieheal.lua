local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = (level * 0.2 + magicLevel * 1.184) + 20
	local max = (level * 0.2 + magicLevel * 2.59) + 35
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Rookie Heal")
spell:words("xori heal")
spell:group("healing")
spell:vocation("none;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_INTENSE_HEALING)
spell:id(600)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(20)
spell:mana(45)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:register()
