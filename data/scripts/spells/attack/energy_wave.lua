local function formulaFunction(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 10)
																	local max = (level) + (maglevel * 12)
																	return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 6)
																	local max = (level) + (maglevel * 10)
																	return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 4)
																	local max = (level) + (maglevel * 7)
																	return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 2.5)
																	local max = (level) + (maglevel * 5.5)
																	return -min, -max
	end
	end
	end
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
	initCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
	initCombat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
	initCombat:setArea(createCombatArea(area, areaDiagonal))
	return initCombat
end

local combat = createCombat(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5, "onGetFormulaValues")
local combatWOD = createCombat(AREA_WAVE7, AREADIAGONAL_WAVE7, "onGetFormulaValuesWOD")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	if creature and player then
		if player:getWheelSpellAdditionalArea("Energy Wave") then
			return combatWOD:execute(creature, var)
		end
	end
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(13)
spell:name("Energy Wave")
spell:words("exevo vis hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ENERGY_WAVE)
spell:level(38)
spell:mana(170)
spell:needDirection(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
