local config = {
    {category = "Sword", name = "Magic Sword", itemId = 3288},
    {category = "Axe", name = "Stonecutter Axe", itemId = 3319},
    {category = "Club", name = "Hammer of Prophecy", itemId = 3349},
    {category = "Distance", name = "Hive Bow", itemId = 14246},
    {category = "Distance", name = "Crude Umbral Crossbow", itemId = 20085},
    {category = "Wand", name = "Wand of Defiance", itemId = 16096},
    {category = "Rod", name = "Dream Blossom Staff", itemId = 25700}
}

local bookTextConfig = {
    [1] = "Welcome to Fencore\n- Training Weapon (every 5 hours) \n- !rewards \n- On Fencore We use training dummy(RL) and training tower (VIP Island) \n\n",
 [2] = "Blessing Command\n- !bless\n- Use it only if not in battle\n\n",
    [3] = "Tutor Help Command Command\n- !tutor\n- Use it to ask for Fencore Team assistance\n\n",
    [4] = "New Player you get 7 FREE days \n- VIP Island Go North Temple Thais, Blue stairs on right \n-Vip Bonus Exp(+15%) Skill (+10%) Loot (+15%) Stay Online (No Kick)\n\n",
    [5] = "Fencore Wikipedia\n- fencore.net/wiki\n\n",
[6] = "Fencore Discord\n- discord.gg/FqcjzxMTWC\n\n",
 
}

local exercise_reward_modal = TalkAction("!start")
local storageKey = 354321 -- Unique storage key for this system

function exercise_reward_modal.onSay(player, words, param)
      if player:getStorageValue(storageKey) > 0 then
        player:sendCancelMessage("You have already chosen your reward and cannot select another.")
        return false
    end

    -- Create a modal window for the selection
    local window = ModalWindow {
        title = "Reward Selection",
        message = 'Choose one item category: Sword, Axe, Club, or Distance. You can only select one item.'
    }

    for _, info in ipairs(config) do
        window:addChoice(string.format("%s (%s)", info.name, info.category), function(player, button, choice)
       

            if button.name ~= "Select" then
                return true
            end

            -- Give the player the desired item directly using player:addItem
            local mainReward = player:addItem(info.itemId, 1)
            if mainReward then
                player:setStorageValue(storageKey, 1) -- Set storage to mark the selection
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you just received a [" .. info.name .. "]. This is your only selection.")

                -- Automatically give the player the book (ID 28572) with the combined text
                local bookItem = player:addItem(28572, 1)
                if bookItem then
                    local combinedText = table.concat(bookTextConfig)
                    bookItem:setText(combinedText)
                else
                    player:sendCancelMessage("Could not add the book. Please check your inventory capacity.")
                end
            else
                player:sendCancelMessage("Could not add the main reward. Please check your inventory capacity.")
                return true
            end
        end)
    end

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)
    return false
end

exercise_reward_modal:separator(" ")
exercise_reward_modal:groupType("normal")
exercise_reward_modal:register()
