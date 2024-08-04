local staminaOnTrainer = MoveEvent()

local function Stamina(playerId, seconds)
    local player = Player(playerId)
    if seconds > 0 and player then
            player:setStamina(player:getStamina() + 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Regenerating Stamina")
        addEvent(Stamina, 90000, playerId, seconds - 1)
    end
end

local coolDownStorageID = 666711
local coolDownSeconds = 10

function staminaOnTrainer.onStepIn(player, item, position, fromPosition)
    if player:getStorageValue(coolDownStorageID) <= os.time() then
        player:setStorageValue(coolDownStorageID, os.time() + (coolDownSeconds - 1))
        return Stamina(player:getId(), coolDownSeconds)
    end
    return not player:sendCancelMessage("You are exhausted.")
end

staminaOnTrainer:aid(43654,43655,43656,43657, 43658,43659,43660,43661)
staminaOnTrainer:register()