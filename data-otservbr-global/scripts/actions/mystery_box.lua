local storeBox = Action()

local REWARD = {3043, 22516, 22721, 23544, 23531, 23533, 23530, 37317}
local JEWEL = {30061, 30059, 30060, 32623, 32626, 14758, 37317}
function storeBox.onUse(cid, item, fromPosition, itemEx, toPosition)
      local randomChance = math.random(1, #REWARD)
      doPlayerAddItem(cid, REWARD[randomChance], 1)

local randomLoot = math.random(1,20)
    if randomLoot == 1 then
    doPlayerSendTextMessage(cid, 19, "You found an extra item!")
             local randomChance = math.random(5, #REWARD)
              doPlayerAddItem(cid, REWARD[randomChance], 3)
    end

local randomJewel = math.random(1,10)
    if randomJewel == 1 then
    doPlayerSendTextMessage(cid, 19, "You found a shiny item!")
	  local charges = math.random(50, 150)	
      local randomChance = math.random(1, #JEWEL)
      doPlayerAddItem(cid, JEWEL[randomChance], 1)
    end
 
doSendMagicEffect(getPlayerPosition(cid), 73)
   doRemoveItem(item.uid, 1)
   return true
end

storeBox:id(3997)
storeBox:register()
