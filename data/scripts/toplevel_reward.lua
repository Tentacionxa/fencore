-- 1 = Sunday, 2 = Monday, 3 = Tuesday, 4 = Wednesday, 5 = Thursday, 6 = Friday, 7 = Saturday
local SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY = 1, 2, 3, 4, 5, 6, 7
local DAY_TO_REWARD = FRIDAY --here you put the day the reward will be given to player... its friday now not in brazil xddddd but why 
local PERIOD_TO_REWARD = 7 --DAYS, this is used to know when the frags should start counting... if its 7, so the most fragger of last 7 days will be considered...
local rewards = { --here you add the items and quantity that will be given to players... you can set reward to how many players you would like to...
-- if you put 5 rewards, the top 5 LEVEL will be rewarded and so on...
    [1] = {
        { itemId = 22118, qtt = 100 },
        { itemId = 14758, qtt = 1 },
        { itemId = 3043, qtt = 125 }
    },
    [2] = {
        { itemId = 14758, qtt = 1 },
        { itemId = 3043, qtt = 75 }
    },
    [3] = {
        { itemId = 3043, qtt = 50 }
    }
}

local function load_rewards()
    local date = os.date("*t")

    local diff = PERIOD_TO_REWARD * 24 * 60 * 60
    local now = os.time()
    local start = now - diff

    local lastOcurrence = kv.scoped("weeklyReward"):get("last-ocurrence")
    if type(lastOcurrence) ~= "number" then lastOcurrence = nil end
    local lastOcurrenceDays = lastOcurrence and os.difftime(lastOcurrence, now) / (24*60*60) or -1

    if date.wday == DAY_TO_REWARD and (lastOcurrenceDays == -1 or lastOcurrenceDays >= PERIOD_TO_REWARD) then
        local rewardAmount = #rewards
        local query = db.storeQuery("select p.id as player from players order by level desc limit " .. rewardAmount)
    
        local index = 1
        if query then
            repeat
                local rewardItems = rewards[index]
                if index > #rewards then
                    break
                end
                if rewardItems then
                    local playerGuid = Result.getNumber(query, "player")
    
                    local player = Game.getOfflinePlayer(playerGuid)
    
                    if not player then
                        logger.warn("Failed to find player with name: {}, the reward was not sent.", playerGuid)
                    else
                        local parcel = Game.createItem(3504)
                        
                        local letter = Game.createItem(3505)
                        letter:setAttribute(ITEM_ATTRIBUTE_TEXT, "Congratulations! You were placed on #" .. index .. " position on our week frags. Take this reward as a gift.")
                        parcel:addItemEx(letter)
                        
                        for _, rewardItem in pairs(rewardItems) do
                            parcel:addItem(rewardItem.itemId, rewardItem.qtt)
                        end
                        player:getInbox():addItemEx(parcel, INDEX_WHEREEVER, FLAG_NOLIMIT)
                        player:save()
                    end
    
                end
                index = index + 1
            until not Result.next(query)
        end
    
        kv.scoped("topLevelReward"):set("last-ocurrence", os.time())
    end
end

--Delay starts this function, so we guarantee that server has success started before running
addEvent(
    load_rewards,
    25000
)