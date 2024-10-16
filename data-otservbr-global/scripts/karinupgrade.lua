Karin.UpgradeSystem = {
    machinePositions = {
        Position(32732, 33235, 6),
    },
    Tiers = {
        [1] = {
            price = {46316,250},
            chance = 50,
        },
        [2] = {
            price = {46316,250},
            chance = 20,
        },
        [3] = {
            price = {46314,50},
            chance = 25,
        },
        [4] = {
            price = {46314,60},
            chance = 30,
        },
        [5] = {
            price = {46314,70},
            chance = 25,
        },
        [6] = {
            price = {46314,80},
            chance = 17,
        },
        [7] = {
            price = {46314,100},
            chance = 14,
        },
        [8] = {
            price = {46314,125},
            chance = 12,
        },
        [9] = {
            price = {46314,150},
            chance = 10,
        },
        [10] = {
            price = {46314,200},
            chance = 5,
        },
    },
    Attributes = {
        'Attack', 'Defense', 'Armor', 'Elemental Damage'
    },
}

local equipmentTypes = {
    ITEM_TYPE_ARMOR,
    ITEM_TYPE_BOOTS,
    ITEM_TYPE_HELMET,
    ITEM_TYPE_LEGS,
    ITEM_TYPE_SHIELD,
    ITEM_TYPE_AXE,
    ITEM_TYPE_CLUB,
    ITEM_TYPE_DISTANCE,
    ITEM_TYPE_SWORD,
    ITEM_TYPE_WAND,
    ITEM_TYPE_QUIVER,
	ITEM_TYPE_RING,
}

__SystemFunctions = {
    canUpgrade = function(self, player, item)
        if not item or type(corpse) == 'table' or not table.contains(equipmentTypes, ItemType(item:getId()):getType()) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to select an item to upgrade.")
            return false
        end
        
        local level = self:getItemLevel(item)

        if level >= 10 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The item is already at the maximum level.')
            return false
        end

        return true
    end,
    chooseUpgrade = function (self, player, item)
        if not self:canUpgrade(player, item) then
            return false
        end

        local window = ModalWindow({
            title = "Upgrade System (" .. item:getName() .. ')',
            message = "\nChoose one status to upgrade:",
        })

        local message = 'Your weapon is at level ' .. self:getItemLevel(item) .. '.\n\n'
        for _, status in pairs(self:getItemStatus(item)) do
            message = message .. status.name .. ': ' .. (not status.modified and status.value or status.modified) .. '\n'
            local value = status.modified and status.value + status.modified or status.value
            window:addChoice('[' .. value .. '] ' .. status.name, function(player, button, choice)
                if button.name ~= "Select" then
                    return true
                end

                local sucess, message = self:upgrade(player, item, status)
                if not sucess then
                    Karin:sendNearSound(player:getPosition(), SOUND_EFFECT_TYPE_MONSTER_SPELL_ROOT)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
                else
                    Karin:sendNearSound(player:getPosition(), SOUND_EFFECT_TYPE_MONSTER_SPELL_SINGLE_TARGET_LIFEDRAIN)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The item has been upgraded successfully.')
                end
                return true
            end)
        end
        window.message = message .. window.message        
    
        window:addButton("Select")
        window:addButton("Close")
        window:setDefaultEnterButton(0)
        window:setDefaultEscapeButton(1)
        window:sendToPlayer(player)
   
        
    end,
    getItemStatus = function(self, item)
        local status = {}
        local itemType = ItemType(item:getId())

        local itemAttack = itemType:getAttack()
        local itemDefense = itemType:getDefense()
        local itemArmor = itemType:getArmor()
        local elementDamage = itemType:getElementDamage()

        for _, attr in pairs(self.Attributes) do
            
            if attr == 'Attack' and itemAttack > 0 then
                table.insert(status, { name = attr, value = itemAttack, modified = item:getCustomAttribute(attr) or 0 })
            end

            if attr == 'Defense' and itemDefense > 0 then
                table.insert(status, { name = attr, value = itemDefense, modified = item:getCustomAttribute(attr) or 0 })
            end

            if attr == 'Armor' and itemArmor > 0 then
                table.insert(status, { name = attr, value = itemArmor, modified = item:getCustomAttribute(attr) or 0 })
            end

            if attr == 'Elemental Damage' and elementDamage > 0 then
                table.insert(status, { name = attr, value = elementDamage, modified = item:getCustomAttribute(attr) or 0 })
            end
        end

        return status
    end,
    upgrade = function (self, player, item, status)
        local tier = self.Tiers[self:getItemLevel(item) + 1]
        if not tier then
            return false, 'The item is already at the maximum level.'
        end

        if player:getItemCount(tier.price[1]) < tier.price[2] then
            return false, 'You need ' .. tier.price[2] .. ' ' .. ItemType(tier.price[1]):getName() .. ' to upgrade this item.'
        end

        if not player:removeItem(tier.price[1], tier.price[2]) then
            return false, 'You need ' .. tier.price[2] .. ' ' .. ItemType(tier.price[1]):getName() .. ' to upgrade this item.'
        end

        if math.random(1, 100) > tier.chance then
            return false, 'The upgrade failed.'
        end

        local level = self:getItemLevel(item)
        item:setCustomAttribute('Level', level + 1)
        item:setCustomAttribute(status.name, status.modified and status.modified + 1 or status.value + 1)   
        return true
    end,
    getItemLevel = function(self, item)
        local level = 0
        if item then
            local attr = item:getCustomAttribute('level')
            if attr and attr > 0 then
                level = attr
            end
        end
        return level
    end,
}

Karin.UpgradeSystem = setmetatable(
    Karin.UpgradeSystem, 
    { __index = __SystemFunctions }
)


local upgradeMachine = Action()

function upgradeMachine.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return Karin.UpgradeSystem:chooseUpgrade(player, target, item)
end

for _, pos in pairs(Karin.UpgradeSystem.machinePositions) do
    upgradeMachine:position(pos)
end
upgradeMachine:register()
