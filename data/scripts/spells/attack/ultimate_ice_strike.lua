local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)


function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 4.75)
																	local max = (level) + (maglevel * 5.0)
																	return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 4.0)
																	local max = (level) + (maglevel * 4.80)
																	return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 4.75)
																	local max = (level) + (maglevel * 4.75)
																	return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 4.65)
																	local max = (level) + (maglevel * 4.65)
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

spell:group("attack", "ultimatestrikes")
spell:id(156)
spell:name("Ultimate Ice Strike")
spell:words("exori max frigo")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ULTIMATE_ICE_STRIKE)
spell:level(100)
spell:mana(100)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(4 * 1000, 30 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
