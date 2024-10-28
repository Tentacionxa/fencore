local lottery = GlobalEvent("lottery")

local config = {
    interval = 60, -- 1 minute
    rewards = {
			{22118, 5}, 			-- {Crystal Coin, 3} -- {itemID, quantity}
			{22118, 10},			-- {Crystal Coin, 5}
			{22118, 15},			-- {Crystal Coin, 10}
			{22118, 25}},			-- {Crystal Coin, 20}
    website = false
}

function lottery.onThink(interval)
    local players = {}
    for _, player in ipairs(Game.getPlayers()) do
        if not player:getGroup():getAccess() then
            table.insert(players, player)
        end
    end

    local c = #players
    if c <= 0 then
        return true
    end

    local winner = players[math.random(#players)]

    local reward = config.rewards[math.random(#config.rewards)]
    local itemid, amount = reward[1], reward[2]
    winner:addItem(itemid, amount)

    local it = ItemType(itemid)
    local name = (amount == 1) and (it:getArticle() .. " " .. it:getName()) or (amount .. " " .. it:getPluralName())

  

    return true
end

lottery:interval(config.interval * 60 * 1000) -- Convert minutes to milliseconds
lottery:register()
