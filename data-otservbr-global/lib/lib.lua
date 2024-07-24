-- Core API functions implemented in Lua
-- Load storages first
dofile(DATA_DIRECTORY .. "/lib/core/load.lua")

-- Compatibility library for our old Lua API
dofile(DATA_DIRECTORY .. "/lib/compat/compat.lua")

-- Tables library
dofile(DATA_DIRECTORY .. "/lib/tables/load.lua")

-- Others library
dofile(DATA_DIRECTORY .. "/lib/others/load.lua")

-- Quests library
dofile(DATA_DIRECTORY .. "/lib/quests/quest.lua")

-- Vip System library
dofile(DATA_DIRECTORY .. "/lib/vip/vip_system.lua")

-- Remove Frag System
dofile(DATA_DIRECTORY.. '/lib/custom/remove_frags.lua')

-- Battlefield Event library
dofile(DATA_DIRECTORY .. '/lib/events/battlefield.lua')

-- Zombie Arena library
dofile(DATA_DIRECTORY .. '/lib/events/zombie_arena.lua')

-- Snowball Event library
dofile(DATA_DIRECTORY .. '/lib/events/snowball.lua')

-- Tasks Library
dofile(DATA_DIRECTORY .. "/lib/others/task_lib.lua")
-- Task Custom
dofile(DATA_DIRECTORY.. '/scripts/custom/load.lua')





