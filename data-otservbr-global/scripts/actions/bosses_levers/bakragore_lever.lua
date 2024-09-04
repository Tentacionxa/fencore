local config = {
	boss = {
		name = "Bakragore",
		position = Position(33043, 32395, 15),
	},
	requiredLevel = 250,

	playerPositions = {
		{ pos = Position(33014, 32392, 15), teleport = Position(33044, 32403, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33013, 32392, 15), teleport = Position(33044, 32403, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33012, 32392, 15), teleport = Position(33044, 32403, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33011, 32392, 15), teleport = Position(33044, 32403, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33010, 32392, 15), teleport = Position(33044, 32403, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33032, 32389, 15),
		to = Position(33054, 32410, 15),
	},
	exit = Position(33044, 32409, 15),
}

local lever = BossLever(config)
lever:position({ x = 33015, y = 32392, z = 15 })
lever:register()
