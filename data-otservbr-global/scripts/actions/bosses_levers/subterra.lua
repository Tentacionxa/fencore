local config = {
	boss = {
		name = "Sub Terra",
		position = Position(31984, 33591, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(31981, 33638, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31982, 33638, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31983, 33638, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31984, 33638, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31985, 33638, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31980, 33639, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31981, 33639, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31982, 33639, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31983, 33639, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31984, 33639, 8), teleport = Position(31975, 33599, 8) },
		{ pos = Position(31985, 33639, 8), teleport = Position(31975, 33599, 8) },
	},
	specPos = {
		from = Position(31969, 33580, 8),
		to = Position(32000, 33602, 8),
	},
	exit = Position(31965, 33575, 8),
	exitTeleporter = Position(32008, 33607, 8),
}

local lever = BossLever(config)
lever:position(Position(31980, 33638, 8))
lever:register()
