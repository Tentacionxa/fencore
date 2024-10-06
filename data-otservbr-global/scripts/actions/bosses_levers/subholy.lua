local config = {
	boss = {
		name = "Sub Holy",
		position = Position(31834, 33591, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(31834, 33645, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31835, 33645, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31836, 33645, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31837, 33645, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31838, 33645, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31833, 33646, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31834, 33646, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31835, 33646, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31835, 33646, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31837, 33646, 8), teleport = Position(31824, 33598, 8) },
		{ pos = Position(31838, 33646, 8), teleport = Position(31824, 33598, 8) },
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
