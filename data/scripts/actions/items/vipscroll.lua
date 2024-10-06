local vipscroll = Action()

function vipscroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
                fromPosition:sendMagicEffect(CONST_ME_POFF)
                player:onAddVip(3)
                item:remove(1)
                fromPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
end

vipscroll:id(46008)
vipscroll:register()
