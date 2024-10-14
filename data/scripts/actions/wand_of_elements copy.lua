local elements = {
    ["Ice"] = { index = 2 },
    ["Earth"] = { index = 5 }
}

local elementsWand = Action()
function elementsWand.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local modal = ModalWindow{
        title = "Griish Energy",
        message = "Select the element you want to change to"
    }

    for elementName, elementObj in pairs(elements) do
        modal:addChoice(
            elementName,
            function(player, button, choice)
                if (button.name == 'Cancel') then 
					return true
				end
                player:setStorageValue(57845, elementObj.index)
                player:sendTextMessage(MESSAGE_LOOK, 'Element changed to: ' .. elementName)
                player:save()
				return true
            end
        )
    end

    modal:addButton('Select')
    modal:addButton('Cancel')

    modal:sendToPlayer(player)
	return true
end

elementsWand:id(46344)
elementsWand:register()
