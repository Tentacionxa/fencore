local internalNpcName = "Nussa"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 10,
	lookBody = 70,
	lookLegs = 87,
	lookFeet = 95,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Come see my Addons bro!'}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

addoninfo = {
['first adventurer addon'] = {cost = 0, items = {{46409,1}, {46311,1}, {46310,1}}, outfit_female = 175, outfit_male = 703, addon = 1},
['second adventurer addon'] = {cost = 0, items = {{46309,1}, {46308,1}, {46097,50}}, outfit_female = 175, outfit_male = 703, addon = 2}

}
local o = {'adventurer'}
local rtnt = {}
local function creatureSayCallback(npc, creature, type, message)
local talkUser = creature
local player = Player(creature)
local playerId = player:getId()

local talkState = {}
    if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

    if addoninfo[message] ~= nil then
        local itemsTable = addoninfo[message].items
        local items_list = ''
       if table.maxn(itemsTable) > 0 then
            for i = 1, table.maxn(itemsTable) do
                local item = itemsTable[i]
                items_list = items_list .. item[2] .. ' ' .. ItemType(item[1]):getName()
                if i ~= table.maxn(itemsTable) then
                    items_list = items_list .. ', '
                end
            end
        end
        local text = ''
        if (addoninfo[message].cost > 0) then
            text = addoninfo[message].cost .. ' gp'
        elseif table.maxn(addoninfo[message].items) then
            text = items_list
        elseif (addoninfo[message].cost > 0) and table.maxn(addoninfo[message].items) then
            text = items_list .. ' and ' .. addoninfo[message].cost .. ' gp'
        end
        npcHandler:say('For ' .. message .. ' you will need ' .. text .. '. Do you have it all with you?', npc, creature)
        rtnt = message
        talkState[talkUser] = addoninfo[message].storageID
        npcHandler:setTopic(playerId, 2)
        return true
    elseif npcHandler:getTopic(playerId) == 2 then
        if MsgContains(message, "yes") then
            local items_number = 0
            if table.maxn(addoninfo[rtnt].items) > 0 then
                for i = 1, table.maxn(addoninfo[rtnt].items) do
                    local item = addoninfo[rtnt].items[i]
                    if (getPlayerItemCount(creature,item[1]) >= item[2]) then
                        items_number = items_number + 1
                    end
                end
            end
            if(getPlayerMoney(creature) >= addoninfo[rtnt].cost) and (items_number == table.maxn(addoninfo[rtnt].items)) then
                doPlayerRemoveMoney(creature, addoninfo[rtnt].cost)
                if table.maxn(addoninfo[rtnt].items) > 0 then
                    for i = 1, table.maxn(addoninfo[rtnt].items) do
                        local item = addoninfo[rtnt].items[i]
                        doPlayerRemoveItem(creature,item[1],item[2])
                    end
                end
                doPlayerAddOutfit(creature, addoninfo[rtnt].outfit_male, addoninfo[rtnt].addon)
                doPlayerAddOutfit(creature, addoninfo[rtnt].outfit_female, addoninfo[rtnt].addon)
                npcHandler:say('Here you are.', npc, creature)
            else
                npcHandler:say('You do not have needed items!', npc, creature)
            end
            rtnt = nil
            talkState[talkUser] = 0
            npcHandler:resetNpc(creature)
            return true
        end
    elseif MsgContains(message, "addon") then
        npcHandler:say('I can give you {first} or {second} addons for {' .. table.concat(o, "}, {") .. '} outfits.', npc, creature)
        rtnt = nil
        talkState[talkUser] = 0
        npcHandler:resetNpc(creature)
        return true
    elseif MsgContains(message, "help") then
        npcHandler:say('You must say \'first NAME addon\', for the first addon or \'second NAME addon\' for the second.', npc, creature)
        rtnt = nil
        talkState[talkUser] = 0
        npcHandler:resetNpc(creature)
        return true
    else
        if talkState[talkUser] ~= nil then
            if talkState[talkUser] > 0 then
            npcHandler:say('Come back when you get these items.', npc, creature)
            rtnt = nil
            talkState[talkUser] = 0
            npcHandler:resetNpc(creature)
            return true
            end
        end
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|! If you want some addons, just ask me! Do you want to see my {addons}, or are you decided? If you are decided, just ask me like this: {first citizen addon}')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)
