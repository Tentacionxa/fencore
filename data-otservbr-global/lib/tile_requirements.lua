tileRequerimentsConfig = {
    ---------------------------------------------------------
   -- Tile Requeriment example 1
   ---------------------------------------------------------
   [36000] = {
       minLevel = 8, -- level req to enter
       maxLevel = 450, -- set 0 to disable (set level max to enter)
       storageReq = 0, -- set 0 to disable (if player need storage to enter)
       storageName = "", -- if you want show quest need to enter (example: you need >demon quest< to join this area)
       zoneName = "Casino Area", -- name of your zone or use default
       teleport = 0 -- if you want teleport player put 0 to disable
    
       },
     ---------------------------------------------------------
   -- Example Tiles
   ---------------------------------------------------------
   [36001] = {
       minLevel = 451, -- level req to enter
       maxLevel = 0, -- set 0 to disable (set level max to enter)
       storageReq = 0, -- set 0 to disable (if player need storage to enter)
       storageName = "Quest Retro", -- if you want show quest need to enter (example: you need >demon quest< to join this area)
       zoneName = "Casino Area", -- name of your zone or use default
       teleport = 0 -- if you want teleport player put 0 to disable
       }


 
}