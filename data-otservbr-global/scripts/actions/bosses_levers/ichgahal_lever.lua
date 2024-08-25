local config = {
	boss = {
		name = "Ichgahal",
		position = Position(33008, 32333, 15),
	},
	requiredLevel = 250,

	playerPositions = {
		{ pos = Position(32978, 32333, 15), teleport = Position(33008, 32339, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32977, 32333, 15), teleport = Position(33008, 32339, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32976, 32333, 15), teleport = Position(33008, 32339, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32975, 32333, 15), teleport = Position(33008, 32339, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32974, 32333, 15), teleport = Position(33008, 32339, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32999, 32325, 15),
		to = Position(33016, 32344, 15),
	},
	exit = Position(33004, 32343, 15),
}

local lever = BossLever(config)
lever:position({ x = 32979, y = 32333, z = 15 })
lever:register()
