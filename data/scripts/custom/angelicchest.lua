local chests = {
    [46111] = { -- sorcerer's box
          items = {
              { id = 43883, name = "grand sanguine coil", chance = 50 }, -- 50% chance
              { id = 43884, name = "sanguine boots", chance = 50 }, -- 50% chance
              { id = 46370, name = "eternal night moon mantle", chance = 10 }, -- 10% chance
              { id = 46375, name = "eternal night moon legs", chance = 10 }, -- 10% chance
              { id = 49273, name = "holy legguards", chance = 8 }, -- 5% chance
              { id = 49272, name = "holy plate", chance = 8 }, -- 5% chance
              
          }
      },
      [46113] = { -- master box
          items = {
              { id = 43883, name = "grand sanguine coil", chance = 50 }, -- 50% chance
              { id = 43884, name = "sanguine boots", chance = 50 }, -- 50% chance
              { id = 46374, name = "eternal night moon crown", chance = 10 }, -- 10% chance
              { id = 46375, name = "eternal night moon legs", chance = 10 }, -- 10% chance
              { id = 49273, name = "holy legguards", chance = 8 }, -- 5% chance
              { id = 3022, name = "ancient tiara", chance = 8 }, -- 5% chance
              
          }
      },
      [46114] = { -- druid's box
          items = {
              { id = 43883, name = "grand sanguine rod", chance = 50 }, -- 50% chance
              { id = 43884, name = "sanguine galoshes", chance = 50 }, -- 50% chance
              { id = 46370, name = "eternal night root mask", chance = 10 }, -- 10% chance
              { id = 46375, name = "eternal night root pants", chance = 10 }, -- 10% chance
              { id = 49273, name = "holy legguards", chance = 8 }, -- 5% chance
              { id = 3022, name = "ancient tiara", chance = 8 }, -- 5% chance
              
          }
      },
      [49393] = { -- elder box
          items = {
              { id = 43883, name = "grand sanguine rod", chance = 50 }, -- 50% chance
              { id = 43884, name = "sanguine galoshes", chance = 50 }, -- 50% chance
              { id = 46343, name = "eternal night root robe", chance = 10 }, -- 10% chance
              { id = 46340, name = "eternal night root pants", chance = 10 }, -- 10% chance
              { id = 49273, name = "holy legguards", chance = 8 }, -- 5% chance
              { id = 49272, name = "holy plate", chance = 8 }, -- 5% chance
              
          }
      },
      [46110] = { -- palladin's box
          items = {
              { id = 43878, name = "grand sanguine bow", chance = 50 }, -- 50% chance
              { id = 43880, name = "grand sanguine crossbow", chance = 50 }, -- 50% chance
              { id = 46364, name = "eternal night shadow greaves", chance = 10 }, -- 10% chance
              { id = 46360, name = "eternal night shadow tabard", chance = 10 }, -- 10% chance
              { id = 49274, name = "enchanted plate", chance = 8 }, -- 5% chance
              { id = 49275, name = "enchanted greaves", chance = 8 }, -- 5% chance
              
          }
      },
      [46112] = { -- royal box
          items = {
              { id = 43881, name = "sanguine greaves", chance = 50 }, -- 50% chance
              { id = 43878, name = "grand sanguine bow", chance = 50 }, -- 50% chance
              { id = 46365, name = "eternal night shadow headguard", chance = 10 }, -- 10% chance
              { id = 46362, name = "eternal night shadow boots", chance = 10 }, -- 10% chance
              { id = 49251, name = "sentinel's visage", chance = 8 }, -- 5% chance
              { id = 49276, name = "enchanted boots", chance = 8 }, -- 5% chance
              
          }
      },
      [46108] = { -- knight's box
          items = {
              { id = 43875, name = "grand sanguine battleaxe", chance = 50 }, -- 50% chance
              { id = 43873, name = "grand sanguine bludgeon", chance = 50 }, -- 50% chance
              { id = 46353, name = "eternal night demon helmet", chance = 10 }, -- 10% chance
              { id = 46345, name = "eternal night demon plate", chance = 10 }, -- 10% chance
              { id = 49269, name = "undead helmet", chance = 8 }, -- 5% chance
              { id = 49267, name = "undead scale", chance = 8 }, -- 5% chance
              
          }
      },
      [46109] = { -- elite box
          items = {
              { id = 43876, name = "sanguine legs", chance = 50 }, -- 50% chance
              { id = 43878, name = "grand sanguine razor", chance = 50 }, -- 50% chance
              { id = 46353, name = "eternal night demon helmet", chance = 10 }, -- 10% chance
              { id = 46345, name = "eternal night demon plate", chance = 10 }, -- 10% chance
              { id = 49277, name = "enchanted undead greaves", chance = 8 }, -- 5% chance
              { id = 49268, name = "undead boots", chance = 8 }, -- 5% chance
              
          },
      },
  
      -- Add other chests as needed...
  }
  
  local function getRandomReward(items)
      local totalChance = 0
      for _, item in ipairs(items) do
          totalChance = totalChance + item.chance
      end
  
      local random = math.random(1, totalChance)
      local cumulativeChance = 0
  
      for _, item in ipairs(items) do
          cumulativeChance = cumulativeChance + item.chance
          if random <= cumulativeChance then
              return item
          end
      end
  end
  
  local ChestAction = {}
  
  function ChestAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
      local chest = chests[item:getId()]
      if not chest then
          player:sendTextMessage(MESSAGE_STATUS_SMALL, "This chest is not configured.")
          print("Chest with ID " .. item:getId() .. " is not configured.")
          return true
      end
  
      local rewardItem = getRandomReward(chest.items)
  
      if rewardItem then
          player:addItem(rewardItem.id, 1)
          player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest grants you a " .. rewardItem.name .. ".")
          print("Rewarded item: " .. rewardItem.name .. " with ID: " .. rewardItem.id)
      else
          player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
          print("No reward was selected.")
      end
  
      item:remove(1)
      return true
  end
  
  for chestId, chestData in pairs(chests) do
      local action = Action()
      action:id(chestId)
      action.onUse = ChestAction.onUse
      action:register()
  end
  