local bossDoll = Action()
local bosseye = {
	-- Config
	mainTitle = "Boss Time",
	mainMsg = "Boss Status",
}
function bossDoll.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendBossWindow(bosseye)
    return true
end
--bossDoll:id(19155)
--bossDoll:register()