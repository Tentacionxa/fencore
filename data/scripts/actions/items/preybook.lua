local preybook = Action()


    function preybook.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have activated extra 5 prey wildcards.")
    player:addPreyCards(5)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	item:remove(1)
	return true
end

preybook:id(8149)
preybook:register()
