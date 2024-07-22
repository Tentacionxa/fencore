local storeBox = Action()

local REWARD = {3043, 14758, 3072, 3073, 3069, 3070, 3160, 3347, 3161, 3192, 7378}
local JEWEL = {3039,3041,3038, 3037, 32622, 30061, 30059, 30060, 32623, 3027, 24390, 32626, 33781, 16124, 9058, 32583, 3026, 30056}
function storeBox.onUse(cid, item, fromPosition, itemEx, toPosition)
      local randomChance = math.random(1, #REWARD)
      doPlayerAddItem(cid, REWARD[randomChance], 1)

local randomLoot = math.random(1,20)
    if randomLoot == 1 then
    doPlayerSendTextMessage(cid, 19, "You found an extra item!")
             local randomChance = math.random(1, #REWARD)
              doPlayerAddItem(cid, REWARD[randomChance], 1)
    end

local randomJewel = math.random(1,10)
    if randomJewel == 1 then
    doPlayerSendTextMessage(cid, 19, "You found a jewel!")
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
