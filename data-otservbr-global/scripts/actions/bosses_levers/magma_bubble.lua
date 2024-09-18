local config = {
	boss = {
		name = "Magma Bubble",
		position = Position(33653, 32907, 15),
	},
	playerPositions = {
		{ pos = Position(33669, 32926, 15), teleport = Position(33655, 32917, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33669, 32927, 15), teleport = Position(33655, 32917, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33669, 32928, 15), teleport = Position(33655, 32917, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33669, 32929, 15), teleport = Position(33655, 32917, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33669, 32930, 15), teleport = Position(33655, 32917, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33630, 32887, 15),
		to = Position(33672, 32921, 15),
	},
	exit = Position(33659, 32897, 14),
}

local lever = BossLever(config)
lever:position(Position(33669, 32925, 15))
lever:register()
