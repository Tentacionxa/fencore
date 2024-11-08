local meleeCondition = Condition(CONDITION_ATTRIBUTES)
meleeCondition:setParameter(CONDITION_PARAM_SUBID, JeanPierreMelee)
meleeCondition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
meleeCondition:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
meleeCondition:setParameter(CONDITION_PARAM_SKILL_MELEE, 26)
meleeCondition:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local divine = Action()

function divine.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:hasExhaustion("special-foods-cooldown") then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Heavenly God blessed Your Melee skills...")
		return true
	end

	player:addCondition(meleeCondition)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel stronger.")
	player:say("Yum. Heavenly God blessed Your Melee skills...", TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	player:setExhaustion("special-foods-cooldown", 10 * 60)
	item:remove(1)
	return true
end

divine:id(49391)
divine:register()