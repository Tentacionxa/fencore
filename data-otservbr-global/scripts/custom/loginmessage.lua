-- Canary Login Modal Message
-- NvSo

local messageLogin = CreatureEvent("messageLogin")

function messageLogin.onLogin(player)
    local text = "We welcome you all to ".. configManager.getString(configKeys.SERVER_NAME) .." \nwho have come to enjoy the best of what classic retro pvp-enforced Tibia has to offer.\nUse command !commands to see the available list of commands"
    local menu = ModalWindow{
        title = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME),
        message = text
    }
    menu:addButton("Close")

    menu:sendToPlayer(player)
    return true
end

messageLogin:register() 
