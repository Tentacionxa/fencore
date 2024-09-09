local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 3.85)
					local max = (level) + (maglevel * 7)
					return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 3.5)
					local max = (level) + (maglevel * 8)
					return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 6)
					local max = (level) + (maglevel * 10)
					return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 6)
					local max = (level) + (maglevel * 8)
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

spell:group("attack", "focus")
spell:id(119)
spell:name("Rage of the Skies")
spell:words("exevo gran mas vis")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_RAGE_OF_THE_SKIES)
spell:level(55)
spell:mana(600)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(12 * 1000)
spell:groupCooldown(2 * 1000, 12 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
