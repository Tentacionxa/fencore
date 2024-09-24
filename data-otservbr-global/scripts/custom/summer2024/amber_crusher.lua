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

local amberCrusher = Action()

function amberCrusher.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target then
        return false
    end

    local gem = gems[target:getId()]
    if not gem then
        return false
    end

    local gemCount = 1
    if target:getCount() >= 10 then
        gemCount = 10
    end   

    local itemCount = 0
    local fragmentId = 46625
    if gem == 1 then
        for i = 1, gemCount do
            itemCount = itemCount + math.random(1, 4)
        end
    elseif gem == 2 then
        for i = 1, gemCount do
            itemCount = itemCount + math.random(2, 8)
        end
    elseif gem == 3 then
        for i = 1, gemCount do
            itemCount = itemCount + math.random(1, 4)
        end
        fragmentId = 46626
    end

	if itemCount > 0 then
		target:remove(gemCount)
		player:addItem(fragmentId, itemCount)
	end

    return true
end

amberCrusher:id(46628)
amberCrusher:register()
