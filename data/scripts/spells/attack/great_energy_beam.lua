
function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 4.35)
																	local max = (level) + (maglevel * 5.85)
																	return -min, -max
	else if  level >= 1500  and level <= 1999 then

	local min = (level) + (maglevel * 4.10)
																	local max = (level) + (maglevel * 5.30)
																	return -min, -max

	else if  level >= 700 and level <= 1499 then

	local min = (level) + (maglevel * 4.55)
																	local max = (level) + (maglevel * 4.95)
																	return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 4.65)
																	local max = (level) + (maglevel * 4.85)
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

local function createCombat(area, combatFunc)
	local initCombat = Combat()
	initCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, combatFunc)
	initCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
	initCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
	initCombat:setArea(createCombatArea(area))
	return initCombat
end

local combat = createCombat(AREA_BEAM8, "onGetFormulaValues")
local combatWOD = createCombat(AREA_BEAM10, "onGetFormulaValuesWOD")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	if creature and player and player:instantSkillWOD("Beam Mastery") then
		var.runeName = "Beam Mastery"
		return combatWOD:execute(creature, var)
	end

	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(23)
spell:name("Great Energy Beam")
spell:words("exevo gran vis lux")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_GREAT_ENERGY_BEAM)
spell:level(29)
spell:mana(110)
spell:isPremium(false)
spell:needDirection(true)
spell:blockWalls(true)
spell:cooldown(7 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
