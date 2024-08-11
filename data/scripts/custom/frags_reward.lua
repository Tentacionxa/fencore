-- 1 = Sunday, 2 = Monday, 3 = Tuesday, 4 = Wednesday, 5 = Thursday, 6 = Friday, 7 = Saturday
local SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY = 1, 2, 3, 4, 5, 6, 7
local DAY_TO_REWARD = MONDAY --here you put the day the reward will be given to player... its friday now not in brazil xddddd but why 
local PERIOD_TO_REWARD = 7 --DAYS, this is used to know from where the frags should start counting... if its 7, so the most fragger of last 7 days will be considered...
local rewards = { --here you add the items and quantity that will be given to players... you can set reward to how many players you would like to...
-- if you put 5 rewards, the top 5 fraggers will be rewarded and so on...
    [1] = {
        { itemId = 22118, qtt = 150 },
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
    logger.info("\n\n\n\n\n\n")


    local date = os.date("*t")

    local diff = PERIOD_TO_REWARD * 24 * 60 * 60
    local now = os.time()
    local start = now - diff

    logger.info("diff: {}, now: {}, start: {}", diff, now, start)

    local lastOcurrence = kv.scoped("weeklyReward"):get("last-ocurrence")
    if type(lastOcurrence) ~= "number" then lastOcurrence = tonumber(lastOcurrence) end
    local lastOcurrenceDays = lastOcurrence and os.difftime(lastOcurrence, now) / (24*60*60) or -1

    if date.wday == DAY_TO_REWARD and (lastOcurrenceDays == -1 or lastOcurrenceDays >= PERIOD_TO_REWARD) then
        logger.info("\n\n\n\n\n\n\nThe last ocurrence is good, lets try to query")
    
        local rewardAmount = #rewards
        local query = db.storeQuery("select p.id as player, count(*) as score from player_deaths join players p on killed_by = p.name where time >= " .. start .. " group by killed_by order by score desc limit " .. rewardAmount)
    
        logger.info("Running query to find top fragger players...")
    
        local index = 1
        if query then
            logger.info("the query exists... lets try to find its results...")
            repeat
                logger.info("trying to get the index: {}", index)
                local rewardItems = rewards[index]
                if index > #rewards then
                    break
                end
                if rewardItems then
                    local playerGuid = Result.getNumber(query, "player")
    
                    logger.info("Trying to reward player of name: {}", playerGuid)
        
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
                        logger.info("Sent reward to player with name: {}", player:getName())
                    end
    
                end
                index = index + 1
            until not Result.next(query)
        end
    
        kv.scoped("weeklyReward"):set("last-ocurrence", os.time())
    end
end

--Delay starts this function, so we guarantee that server has successfuly started before running
addEvent(
    load_rewards,
    25000
)
