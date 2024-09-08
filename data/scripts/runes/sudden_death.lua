local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues(player, level, maglevel)
	if level >= 2000 then
	local min = (level) + (maglevel * 24)
			local max = (level) + (maglevel * 35)
			return -min, -max
	else if  level >= 1500  and level <= 1999 then
	
	local min = (level) + (maglevel * 23)
			local max = (level) + (maglevel * 31)
			return -min, -max
	
	else if  level >= 700 and level <= 1499 then
	
	local min = (level) + (maglevel * 18)
			local max = (level) + (maglevel * 27)
			return -min, -max
	elseif level >= 2 and level <= 699 then
	 local min = (level) + (maglevel * 8)
			local max = (level) + (maglevel * 20)
			return -min, -max
	end
	end
	end
	end
	

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(21)
rune:group("attack")
rune:name("sudden death rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_SUDDENDEATH_RUNE)
rune:runeId(3155)
rune:allowFarUse(true)
rune:charges(3)
rune:level(45)
rune:magicLevel(15)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()
