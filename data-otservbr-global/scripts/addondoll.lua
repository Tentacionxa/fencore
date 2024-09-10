--local actionId = 8000
local itemDollId = 23679
local outfits = {
    {136, 128, "Citizen"},
    {137, 129, "Hunter"},
    {1774, 1775, "Rootwalker"},
    {1288, 1289, "Dragon Slayer"},
    {853, 852, "Winter Warden"},
    {1575, 1576, "Fencer"},
    {873, 874, "Philosopher"},
    {278, 279, "Brotherhood"},
    {516, 514, "Soil Guardian"},
    {541, 542, "Demon"},
    {619, 620, "Jersey"},
    {884, 885, "Arena Champion"},
    {1094, 1095, "Discoverer"},
    {1102, 1103, "Sinister Archer"},
    {1270, 1271, "Poltergeist"},
    {1279, 1280, "Herder"},
    {1282, 1283, "Falconer"},
    {139, 131, "Knight"}
}

local randOutfit = Action("RandomOutfitForNewPlayers")

function randOutfit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local outfit = outfits[math.random(1, #outfits)]
    local addon = math.random(1, 2)
    if player:hasOutfit(outfit[1], addon) and player:hasOutfit(outfit[2], addon) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have this outfit.")
        return true
    end

    player:addOutfitAddon(outfit[1], addon)
    player:addOutfitAddon(outfit[2], addon)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You obtained the %s outfit with addon %d.", outfit[3], addon))
    item:remove(1)
    return true
end

randOutfit:id(itemDollId)
--randOutfit:aid(actionId)
randOutfit:register()