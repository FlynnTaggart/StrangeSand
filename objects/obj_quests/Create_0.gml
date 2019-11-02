gui_width = global.game_width;
gui_height = global.game_height;

x_buffer = 16;
y_buffer = 16;

enum quest_type{
	GATHER,
	KILL,
	height,
}

enum quests{
	Get_the_key,
	Kill_beetles,
	height,
}

enum reward{
	Item,
	Gold,
	height,
}

quest_count = quests.height;

global.ds_quests = s_quest_grid_create(
	[
		-1,
		quest_type.GATHER,
		"Get the key",
		item.key,
		1,
		obj_silvio,
		reward.Item,
		item.axe,
		2,
		["Get the key and give it to Silvio"],
	],
	[
		-1,
		quest_type.KILL,
		"Kill beetles",
		enemies.beetle,
		2,
		obj_silvio,
		reward.Gold,
		-1,
		30,
		["Kill the beetles and tell about it to Silvio"],
	]
);