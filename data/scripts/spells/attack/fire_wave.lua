local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 9.5)+30
	local max = (level / 5) + (maglevel * 14)

return -min * 1.0, -max * 1.9 -- TODO : Use New Real Formula instead of an %
end


combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(19)
spell:name("Fire Wave")
spell:words("exevo flam hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FIRE_WAVE)
spell:level(18)
spell:mana(25)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
