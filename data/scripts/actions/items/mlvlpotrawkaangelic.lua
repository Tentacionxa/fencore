local magicLevelCondition = Condition(CONDITION_ATTRIBUTES)
magicLevelCondition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
magicLevelCondition:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
magicLevelCondition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 26)
magicLevelCondition:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local Heavenly = Action()

function Heavenly.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:hasExhaustion("special-foods-cooldown") then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait before using it again.")
		return true
	end

	player:addCondition(magicLevelCondition)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Heavenly God blessed Your Magic Level...")
	player:say("Chomp. Heavenly God blessed Your Magic Level...", TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	player:setExhaustion("special-foods-cooldown", 10 * 60)
	item:remove(1)
	return true
end

Heavenly:id(49390)
Heavenly:register()
