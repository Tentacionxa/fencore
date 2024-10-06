local config = {
	boss = {
		name = "Sub Holy",
		position = Position(31834, 33591, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(32175, 33636, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32176, 33636, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32177, 33636, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32178, 33636, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32179, 33636, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32174, 33637, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32175, 33637, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32176, 33637, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32177, 33637, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32178, 33637, 8), teleport = Position(31824, 33599, 8) },
		{ pos = Position(32179, 33637, 8), teleport = Position(31824, 33599, 8) },
	},
	specPos = {
		from = Position(31813, 33576, 8),
		to = Position(31857, 33607, 8),
	},
	exit = Position(31835, 33648, 8),
	exitTeleporter = Position(31822, 33600, 8),
}

local lever = BossLever(config)
lever:position(Position(31833, 33645, 8))
lever:register()
