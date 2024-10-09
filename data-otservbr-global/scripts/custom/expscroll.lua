Karin.Scrolls = {
    [49265] = { -- Item Id
        bonus = {
            Experience = 1.80, -- 50%, 1.2 = 20%, 1.5 = 50%, 2 = 100%
            Exception = {
                'Griish Knight', 'Griish Lord', 'Griish Scout', 'Griish Leader', 'Griish Sorcereress', 'Griish Mage', 'Griish Priestess', 'Griish Druid', 'Griish Wizard', 'Griish Hunter', 'Griish Adventurer','Death Crusher', 'Griish Warrior',  
            }
        },
        cooldown = {
            bonus = 720 * 60, -- 1 minute
            toUse = 720 * 60, -- 60 minutes
        }
    },
    [49266] = { -- Item Id
        bonus = {
            Experience = 2.2, -- 50%, 1.2 = 20%, 1.5 = 50%, 2 = 100%
            Monsters = {
                'Griish Knight', 'Griish Lord', 'Griish Scout', 'Griish Leader', 'Griish Sorcereress', 'Griish Mage', 'Griish Priestess', 'Griish Druid', 'Griish Wizard', 'Griish Hunter', 'Griish Adventurer','Death Crusher', 'Griish Warrior',  
            }
        },
        cooldown = {
            bonus = 720 * 60, -- 1 minute
            toUse = 720 * 60, -- 60 minutes
        }
    },
    
    [14758] = { -- Item Id
    bonus = {
        Experience = 1.50, -- 50%, 1.2 = 20%, 1.5 = 50%, 2 = 100%
        Exception = {
            'Griish Knight', 'Griish Lord', 'Griish Scout', 'Griish Leader', 'Griish Sorcereress', 'Griish Mage', 'Griish Priestess', 'Griish Druid', 'Griish Wizard', 'Griish Hunter', 'Griish Adventurer','Death Crusher', 'Griish Warrior',  
        }
    },
    cooldown = {
        bonus = 60 * 60, -- 1 minute
        toUse = 60 * 60, -- 60 minutes
    }
},
}

__SystemFunctions = {
    check = function (self, player, itemId)
        local currentToUseCD = player:kv():get('scrolls_toUse')
        local currentBonusCD = player:kv():get('scrolls_bonus')

        if currentToUseCD and currentToUseCD > os.time() then
            return false, 'You need to wait ' .. Karin:minimalTimers(currentToUseCD - os.time()) .. ' to use this scroll again.'
        end

        if currentBonusCD and currentBonusCD > os.time() then
            return false, 'You already have a bonus from this scroll. Duration: ' .. Karin:minimalTimers(currentBonusCD - os.time()) .. '.'
        end

        return true
    end,

    applyScroll = function (self, player, item)
        local itemId = item:getId()

        local scroll = Karin.Scrolls[itemId]

        if not scroll then
            return false
        end
        
        local success, message = self:check(player, itemId)
        if not success then
            player:sendCancelMessage(message)
            return true
        end

        local bonus = scroll.bonus
        local cooldown = scroll.cooldown

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have used a ' .. ItemType(itemId):getName() .. '.')
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have gained ' .. (bonus.Experience - 1) * 100 .. '% of experience for ' .. Karin:minimalTimers(cooldown.bonus) .. '.')
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You can use this scroll again in ' .. Karin:minimalTimers(cooldown.toUse) .. '.')
        if bonus.Exception then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Exceptions: ' .. table.concat(bonus.Exception, ', ') .. '.')
        end

        if bonus.Monsters then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Monsters: ' .. table.concat(bonus.Monsters, ', ') .. '.')
        end

        player:kv():set('scrolls_toUse', os.time() + cooldown.toUse)
        player:kv():set('scrolls_bonus', os.time() + cooldown.bonus)
        player:kv():set('scrolls', itemId)
        item:remove(1)
        return true
    end,
    onGainExperience = function (self, player, exp, target)
        local bonus = player:kv():get('scrolls_bonus')
        if not bonus or bonus < os.time() then
            return exp
        end

        local scroll = Karin.Scrolls[player:kv():get('scrolls')]
        if scroll and target then
            local expBonus = scroll.bonus.Experience

            if scroll.bonus.Exception then
                if table.contains(scroll.bonus.Exception, target:getName()) then
                    return exp
                end
            end

            if scroll.bonus.Monsters then
                if table.contains(scroll.bonus.Monsters, target:getName()) then
                    return exp * expBonus
                end

                return exp
            end
            
            return math.floor(exp * expBonus)
        end

        return exp
    end
}


Karin.Scrolls = setmetatable(
    Karin.Scrolls, 
    { __index = __SystemFunctions }
)


local scrolls = Action()

function scrolls.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return Karin.Scrolls:applyScroll(player, item)
end

for itemId, _ in pairs(Karin.Scrolls) do
    scrolls:id(itemId)
end
scrolls:register()
