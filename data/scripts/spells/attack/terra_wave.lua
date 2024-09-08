local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5))

function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 15)
																	local max = (level) + (maglevel * 19)
																	return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 10)
																	local max = (level) + (maglevel * 16)
																	return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 8)
																	local max = (level) + (maglevel * 14.5)
																	return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 6)
																	local max = (level) + (maglevel * 13)
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
spell:id(120)
spell:name("Terra Wave")
spell:words("exevo tera hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_TERRA_WAVE)
spell:level(38)
spell:mana(170)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
