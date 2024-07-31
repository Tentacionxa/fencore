local modal = ModalWindow {
	title = "Automatic Training Mode",
	message = "Your next weapon will be used automatically! Don't forget to leave the training weapons in your open backpack."
}

function training.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendBossWindow(modal)
    return true
end

modal:addButton('Confirm')
modal:sendToPlayer(player)

training:id(28555, 28553, 35284, 35279, 44066, 35283, 35282, 35281, 35280, 35290, 35285, 44067, 35289, 35287, 35288, 35286, 28557, 28552, 44065, 28556, 28554)
training:register()