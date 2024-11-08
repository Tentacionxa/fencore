local config = {
	boss = {
		name = "externity",
		position = Position(32823, 33482, 4),
	},
	requiredLevel = 4000,
	playerPositions = {
		{ pos = Position(32847, 33429, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32848, 33429, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32849, 33429, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32847, 33430, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32848, 33430, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32849, 33430, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32847, 33431, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32848, 33431, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32849, 33431, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32847, 33432, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32848, 33432, 4), teleport = Position(32803, 33431, 4) },
		{ pos = Position(32849, 33432, 4), teleport = Position(32803, 33431, 4) },

	},
	monsters = {
		{ name = "rift invader", pos = Position(32804, 33427, 4) },
		{ name = "rift invader", pos = Position(32801, 33430, 4) },
		{ name = "rift invader", pos = Position(32801, 33432, 4)},
		{ name = "rift invader", pos = Position(32803, 33427, 4) },
		{ name = "rift invader", pos = Position(32799, 33432, 4) },
		{ name = "rift invader", pos = Position(32806, 33430, 4) },
		{ name = "rift invader", pos = Position(32799, 33432, 4) },
		{ name = "rift invader", pos = Position(32807, 33431, 4) },
		{ name = "rift invader", pos = Position(32803, 33434, 4) },
	},
	specPos = {
		from = Position(32789, 33414, 4),
		to = Position(32829, 33452, 4),
	},
	exit = Position(32800, 33426, 4),
}

local lever = BossLever(config)
lever:position(Position(32848, 33428, 4))
lever:register()