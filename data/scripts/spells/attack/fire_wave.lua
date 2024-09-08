local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 15) +6
																	local max = (level) + (maglevel * 19)+15
																	return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 10)+4
																	local max = (level) + (maglevel * 16)+12
																	return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 8)+3
																	local max = (level) + (maglevel * 14.5)+10
																	return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 6)+3
																	local max = (level) + (maglevel * 13)+9
																	return -min, -max
	end
	end
	end
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
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
