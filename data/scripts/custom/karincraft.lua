Karin.CraftSystem = {
    ['Equipments'] = {
        crafts = {  
            ['Eternal Night Root Spellbook'] = {
                id = 46338,
                minLevel = 3000,
                vocation = 'Druid',
                requireToCraft = {
                    [39154] = 8,
                    [36673] = 1,
                    [46316] = 500,
                    ['level'] = 2000, 
                },
                storageId = 921001, -- Unique storage ID
            },
            ['Eternal Night Moon Spellbook'] = {
                id = 46372, 
                minLevel = 3000,
                vocation = 'Sorcerer',
                requireToCraft = {
                    [34095] = 8,
                    [36672] = 1,
                    [46316] = 500,
                    ['level'] = 2000,
                },
                storageId = 921002, -- Unique storage ID
            },
            ['Eternal Night Shadow Quiver'] = {
                id = 46367,
                minLevel = 3000,
                vocation = 'Paladin',
                requireToCraft = {
                    [39150] = 5,
                    [45644] = 5,
                    [35524] = 5,
                    [39160] = 5,
                    [46316] = 500,
                    ['level'] = 1000, 
                },
                storageId = 921003, -- Unique storage ID
            },
        },
    },
    ['Weapons'] = {
        crafts = {
            ['Grand Griish Enchanted Axe'] = {
                id = 46347,
                minLevel = 3000,
                vocation = 'Knight',
                requireToCraft = {
                    [43869] = 8,
                    [46316] = 500,
                    ['level'] = 1000,
                    ['skill'] = {
                        [SKILL_AXE] = 20, 
                    },
                },
                storageId = 921004, -- Unique storage ID
            },
            ['Grand Griish Cudgel'] = {
                id = 46351,
                minLevel = 3000,
                vocation = 'Knight',
                requireToCraft = {
                    [43867] = 8,
                    [46316] = 500,
                    ['level'] = 1000,
                    ['skill'] = {
                        [SKILL_CLUB] = 20, 
                    },
                },
                storageId = 921005, -- Unique storage ID
            },
            ['Grand Griish Battleaxe'] = {
                id = 46348,
                minLevel = 3000,
                vocation = 'Knight',
                requireToCraft = {
                    [43875] = 8,
                    [46316] = 500,
                    ['level'] = 1000,
                    ['skill'] = {
                        [SKILL_AXE] = 20, 
                    },
                },
                storageId = 921006, -- Unique storage ID
            },
          ['Grand Griish Razor'] = {
				id = 46357,
				minLevel = 3000,
				vocation = 'Knight', -- Knight|Sorcerer|Druid|Paladin|None
				requireToCraft = {
					[43871] = 8,
                    [46316] = 500,
					['level'] = 1000,
					['skill'] = {
					[SKILL_SWORD] = 20, 
			},
		},
		storageId = 921007,-- Unique storage ID
		},

			['Grand Griish Blade'] = {
				id = 46358,
				minLevel = 3000,
				vocation = 'Knight', -- Knight|Sorcerer|Druid|Paladin|None
				requireToCraft = {
					[43865] = 8,
                    [46316] = 500,
					['level'] = 1000,
					['skill'] = {
					[SKILL_SWORD] = 20, 
				},
			},
			storageId = 921008,-- Unique storage ID-- Unique storage ID
			},
			['Grand Griish Bow'] = {
				id = 46363,
				minLevel = 3000,
				vocation = 'Paladin', -- Knight|Sorcerer|Druid|Paladin|None
				requireToCraft = {
					[43878] = 6,
                    [46316] = 500,
					['level'] = 1000,
					['skill'] = {
					[SKILL_DISTANCE] = 20, 
				},
			},
			storageId = 921009,-- Unique storage ID-- Unique storage ID
			},
			['Grand Griish Crossbow'] = {
				id = 46366,
				minLevel = 3000,
				vocation = 'Paladin', -- Knight|Sorcerer|Druid|Paladin|None
				requireToCraft = {
					[43880] = 6,
                    [46316] = 500,
					['level'] = 1000,
					['skill'] = {
					[SKILL_DISTANCE] = 20, 
				},
			},
			storageId = 921010,-- Unique storage ID-- Unique storage ID
			},
			['Grand Griish Coil'] = {
				id = 46377,
				minLevel = 3000,
				vocation = 'Sorcerer', -- Knight|Sorcerer|Druid|Paladin|None
				requireToCraft = {
					[43883] = 8,
                    [46316] = 500,
					['level'] = 1000,

				},
				storageId = 921011,-- Unique storage ID-- Unique storage ID
			},
			
		
			['Ethernal Night Root Rod'] = {
				id = 46344,
				minLevel = 3000,
				vocation = 'Druid', -- Knight|Sorcerer|Druid|Paladin|None
				requireToCraft = {
					[43886] = 10,
                    [46316] = 500,
					['level'] = 1000, 
				},
				storageId = 921012,-- Unique storage ID-- Unique storage ID
			},
			
	
		 
			['Grand Griish Bludgeon'] = {
				id = 46352,
				minLevel = 3000,
				vocation = 'Knight',
				requireToCraft = {
					[43873] = 8,
                    [46316] = 500,
					['level'] = 1000, 
					['skill'] = {
					[SKILL_CLUB] = 20,  
				},
			},
			storageId = 921013,-- Unique storage ID-- Unique storage ID
			},
    },    
},
}
__CraftFunctions = {
    getCraftByAid = function (self, aid)
        for craftListName, data in pairs(self) do
            if data.aid == aid then
                data.name = craftListName
                return craftListName, data
            end
        end
    end,
    getCraftByName = function (self, name)
        return self[name]
    end,
    getItemCraftByName = function (self, craftData, itemName)
        return craftData[itemName]
    end,
    getSkillNameById = function (self, skillId)
        if skillId == SKILL_AXE then
            return 'Axe'
        elseif skillId == SKILL_SWORD then
            return 'Sword'
        elseif skillId == SKILL_CLUB then
            return 'Club'
        elseif skillId == SKILL_DISTANCE then
            return 'Distance'
        elseif skillId == SKILL_FISHING then
            return 'Fishing'
        elseif skillId == SKILL_SHIELD then
            return 'Shielding'
        elseif skillId == SKILL_FIST then
            return 'Fist'
        end
    end,
    openSelectedWindow = function (self, name, itemName, craft, player)
        local window = ModalWindow {
            title = name,
            message = 'Item: ' .. itemName .. '\n\nRequirements:'
        }
        local canCraft = true
        for id, qtd in pairs(craft.requireToCraft) do
            local it = ItemType(id)
            if it and type(id) == "number" then
                local qtdPlayer = player:getItemCount(id)
                window:addChoice('['.. qtdPlayer .. '/' .. qtd .. '] ' .. it:getName())
                if qtdPlayer < qtd then
                    canCraft = false
                end
            elseif id == 'level' then
                window:addChoice('Level: ' .. qtd * -1)
                if player:getLevel() < qtd then
                    canCraft = false
                end
            elseif id == 'skill' then
                for skill, level in pairs(qtd) do
                    window:addChoice('Skill ' .. self:getSkillNameById(skill) .. ': ' .. level * -1)
                    local playerSkill = player:getSkillLevel(skill)
                    if playerSkill < level or playerSkill-level < 10  then
                        canCraft = false
                    end
                end
            elseif id == 'vocation' then
                window:addChoice('Vocation: ' .. qtd)
                if qtd ~= 'None' and qtd ~= self:getVocation(player) then
                    canCraft = false
                end
            end
        end
        
        if canCraft then
            window:addButton("Craft", function()
                if self:checkCraft(craft, player) then
                    self:openConfirmWindow(name, itemName, craft, player)
                end
            end)
        end
        window:addButton("Cancel", function()
            
        end)
        window:sendToPlayer(player)
    end,
    openConfirmWindow = function (self, name, itemName, craft, player)
        local window = ModalWindow {
            title = name,
            message = 'Are you sure that you want to craft the ' .. itemName .. '?'
        }
    
        window:addButton("Craft", function()
            if self:checkCraft(craft, player) then
                self:doCraft(name, itemName, craft, player)
            end
        end)
        window:addButton("Cancel", function()
            
        end)
        window:sendToPlayer(player)
    end,
    doCraft = function (self, name, itemName, craft, player)
        if self:checkCraft(craft, player) then
            for id, qtd in pairs(craft.requireToCraft) do
                if type(id) == "number" then
                    player:removeItem(id, qtd)
                elseif id == 'level' then
                    player:setLevel(player:getLevel() - qtd)
                elseif id == 'skill' then
                    for skill, level in pairs(qtd) do
                        player:setSkillLevel(skill, player:getSkillLevel(skill) - level)
                    end
                end
            end
    
            -- Add the item to the player's inventory
            local item = player:addItem(craft.id, 1)
            
            if item then
                -- Update the player's storage with the unique storage ID of the crafted item
                if craft.storageId then
                    player:setStorageValue(craft.storageId, 1)
                end
                
                player:sendTextMessage(MESSAGE_LOOT, 'You crafted ' .. item:getName() .. '.')
            end
        end
    end,
    checkCraft = function (self, craft, player)
        local canCraft = true
        


        if craft.vocation then
            if craft.vocation ~= 'None' and craft.vocation ~= self:getVocation(player) then
                canCraft = false
            end
        end

        for id, qtd in pairs(craft.requireToCraft) do
            if type(id) == "number" then
                local qtdPlayer = player:getItemCount(id)
                if qtdPlayer < qtd then
                    canCraft = false
                end
            elseif id == 'level' then
                if player:getLevel() < qtd and player:getLevel() - qtd < 8 then
                    canCraft = false
                end
            elseif id == 'skill' then
                for skill, level in pairs(qtd) do
                    local playerSkill = player:getSkillLevel(skill)
                    if playerSkill < level or playerSkill-level < 10 then
                        canCraft = false
                    end
                end
            end
        end
        return canCraft
    end,
    getVocation = function (self, player)
        local playerVocation = player:getVocation():getName()
        if playerVocation == 'Elite Knight' or playerVocation == 'Knight' then
            return 'Knight'
        elseif playerVocation == 'Royal Paladin' or playerVocation == 'Paladin' then
            return 'Paladin'
        elseif playerVocation == 'Elder Druid' or playerVocation == 'Druid' then
            return 'Druid'
        elseif playerVocation == 'Master Sorcerer' or playerVocation == 'Sorcerer' then
            return 'Sorcerer'
        end
    end,
    openCraft = function (self, aid, player)
        local name, craft = self:getCraftByAid(aid)
        if not craft then
            name, craft = aid, self:getCraftByName(aid)
        end

        if craft then
            local window = ModalWindow {
                title = name,
                message = 'List of crafts:'
            }
            for name, subdata in pairs(craft.crafts) do
                if subdata.minLevel and player:getLevel() < subdata.minLevel then
                    goto continue
                end

                if subdata.vocation and (subdata.vocation ~= 'None' and subdata.vocation ~= self:getVocation(player)) then
                    goto continue
                end

                window:addChoice(name)

                ::continue::
            end
    
            window:addButton("Select", function(player, button, choice)
                local craft = self:getItemCraftByName(craft.crafts, choice.text)
                if craft then
                    self:openSelectedWindow(name, choice.text, craft, player)
                end
            end)
        
            window:sendToPlayer(player)
        end
    end,
}

Karin.CraftSystem = setmetatable(
    Karin.CraftSystem,
    { __index = __CraftFunctions }
)

local craftSystemOnUser = Action()
function craftSystemOnUser.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    Karin.CraftSystem:openCraft(item:getActionId(), player)
end

for craftListName, craft in pairs(Karin.CraftSystem) do
    if craft.aid then
        craftSystemOnUser:aid(craft.aid)
    end
end

craftSystemOnUser:register()
