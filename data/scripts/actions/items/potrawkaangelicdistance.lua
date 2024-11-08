local distanceCondition = Condition(CONDITION_ATTRIBUTES)
distanceCondition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
distanceCondition:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
distanceCondition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 26)
distanceCondition:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local velvet = Action()

function velvet.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:hasExhaustion("lemon-cupcake-cooldown") then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait before using it again.")
		return true
	end

	player:addCondition(distanceCondition)
	player:sendTextMessage(MESSAGE_FAILURE, "Heavenly God blessed Your distance skill.")
	player:say("Mmmm. Heavenly God blessed Your distance skill...", TALKTYPE_MONSTER_SAY)
	player:setExhaustion("lemon-cupcake-cooldown", 10 * 60)
	item:remove(1)
	return true
end

velvet:id(49392)
velvet:register()