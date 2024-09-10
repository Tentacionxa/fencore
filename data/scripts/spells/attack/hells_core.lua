local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))


function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 5.50)
					local max = (level) + (maglevel * 10)
					return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 5)
					local max = (level) + (maglevel * 10)
					return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 5.75)
					local max = (level) + (maglevel * 9.5)
					return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 4.75)
					local max = (level) + (maglevel * 8.75)
					return -min, -max
	end
	end
	end
	end



	

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HELL_SCORE)
spell:level(60)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(12 * 1000)
spell:groupCooldown(2 * 1000, 12 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
