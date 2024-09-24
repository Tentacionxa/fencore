local gems = {
    [44602] = 1, -- lesser guardian gem
    [44603] = 2, -- guardian gem
    [44604] = 3, -- greater guardian gem
    [44605] = 1, -- lesser marksman gem
    [44606] = 2, -- marksman gem
    [44607] = 3, -- greater marksman gem
    [44608] = 1, -- lesser sage gem
    [44609] = 2, -- sage gem
    [44610] = 3, -- greater sage gem
    [44611] = 1, -- lesser mystic gem
    [44612] = 2, -- mystic gem
    [44613] = 3, -- greater mystic gem
}

local crusher = Action()

function crusher.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target then
        return false
    end

    if not item:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
        return false
    end

    local gem = gems[target:getId()]
    if not gem then
        return false
    end

    local itemCount = 0
    local fragmentId = 46625
    if gem == 1 then
        itemCount = itemCount + math.random(1, 4)
    elseif gem == 2 then
        itemCount = itemCount + math.random(2, 8)
    elseif gem == 3 then
        itemCount = itemCount + math.random(1, 4)
        fragmentId = 46626
    end

	if itemCount > 0 then
    	target:remove(1)
    	player:addItem(fragmentId, itemCount)

		local charges = item:getAttribute(ITEM_ATTRIBUTE_CHARGES)
		if charges then
			if charges == 1 then
				item:remove(1)
			else
				item:setAttribute(ITEM_ATTRIBUTE_CHARGES, charges - 1)
			end
		end
	end

    return true
end

crusher:id(46627)
crusher:register()
