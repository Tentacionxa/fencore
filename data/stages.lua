-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 50,
		multiplier = 150,
	},
	{
		minlevel = 50,
		maxlevel = 80,
		multiplier = 120,
	},
	{
		minlevel = 80,
		maxlevel = 100,
		multiplier = 90,
	},
	{
		minlevel = 100,
		maxlevel = 120,
		multiplier = 70,
	},
	{
		minlevel = 120,
		maxlevel = 140,
		multiplier = 60,
	},
	{
		minlevel = 140,
		maxlevel = 160,
		multiplier = 50,
	},
	{
		minlevel = 160,
		maxlevel = 200,
		multiplier = 40,
	},
	{
		minlevel = 200,
		maxlevel = 250,
		multiplier = 30,
	},
	{
		minlevel = 250,
		maxlevel = 300,
		multiplier = 15,
	},
	{
		minlevel = 300,
		maxlevel = 350,
		multiplier = 10,
	},
	{
		minlevel = 350,
		maxlevel = 450,
		multiplier = 7,
	},
	{
		minlevel = 450,
		maxlevel = 1000,
		multiplier = 3,
	},
	{
		minlevel = 1000,
		maxlevel = 2000,
		multiplier = 1.5,
	},
	{
		minlevel = 2000,
		multiplier = 1,
	},
}

skillsStages = {
	{
		minlevel = 1,
		multiplier = 8,
	},
	
}

magicLevelStages = {
	{
		minlevel = 1,
		maxlevel = 100,
		multiplier = 6,
	},
	{
		minlevel = 100,
		multiplier = 5,
	},

}
