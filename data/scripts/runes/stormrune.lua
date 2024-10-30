local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))


function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 80) + 7
	local max = (level / 5) + (maglevel * 130) + 17
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(264)
rune:group("attack")
rune:name("storm launch rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_STONE_SHOWER_RUNE)
rune:runeId(46248)
rune:allowFarUse(true)
rune:charges(4)
rune:level(2000)
rune:magicLevel(45)
rune:cooldown(1 * 1000)
rune:groupCooldown(2 * 1000)
rune:vocation("druid;true", "elder druid;true","sorcerer;true","master sorcerer;true")
rune:register()
