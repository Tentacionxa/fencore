local preybook3 = Action()


    function preybook3.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have activated extra 45 prey wildcards.")
    player:addPreyCards(45)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	item:remove(1)
	return true
end

preybook3:id(22107)
preybook3:register()
