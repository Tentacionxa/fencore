local config = {
	[3043] = { changeTo = 46316 },
	[ITEM_PLATINUM_COIN] = { changeBack = ITEM_GOLD_COIN, changeTo = ITEM_CRYSTAL_COIN },
	[ITEM_CRYSTAL_COIN] = { changeBack = ITEM_PLATINUM_COIN },
}

local goldConverter = Action()

function goldConverter.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local coin = config[target.itemid]
	if not coin then
		return false
	end

	local charges = item:getCharges()
	if coin.46087 and target.type == 100 then
		target:remove()
		player:addItem(coin.changeTo, 1)
	else
		return false
	end


goldConverter:id(46087,46088)
goldConverter:register()
