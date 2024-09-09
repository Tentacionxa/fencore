local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))



function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 28.5)
					local max = (level) + (maglevel * 31)
					return -min, -max
	elseif level >= 1500 and level <= 1999 then
	local min = (level) + (maglevel * 23)
					local max = (level) + (maglevel * 26.5)
					return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 19)
					local max = (level) + (maglevel * 23)
					return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 14)
					local max = (level) + (maglevel * 23)
					return -min, -max
	end
	end
	end




combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(56)
spell:name("Wrath of Nature")
spell:words("exevo gran mas tera")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_WRATH_OF_NATURE)
spell:level(55)
spell:mana(700)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(12 * 1000)
spell:groupCooldown(2 * 1000, 12 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
