gui_width = global.game_width;
gui_height = global.game_height;

x_buffer = 16;
y_buffer = 16;

enum quest_type{
	GATHER,
	KILL,
	SPECIAL,
	GOTOLOC,
	height,
}

enum quests{
	Go_out_the_house,
	Talk_with_Elder,
	Go_to_farm,
	Get_the_key,
	Kill_beetles,
	height,
}

enum reward{
	Item,
	Gold,
	height,
}

enum loc{
	farm,
	height,
}

quest_count = quests.height;

global.ds_quests = s_quest_grid_create(
	[
		0,
		quest_type.SPECIAL,
		"Go out the house",
		rm_player_house,
		rm_village,
		noone,
		-1,
		-1,
		-1,
		["Go out of the house"],
	],
	[
		-1,
		quest_type.SPECIAL,
		"Talk with Elder",
		-1,
		-1,
		noone,
		-1,
		-1,
		-1,
		["Speak to the Elder"],
	],
	[
		-1,
		quest_type.GOTOLOC,
		"Go to farm",
		loc.farm,
		-1,
		obj_olderman,
		-1,
		-1,
		-1,
		["Go to farm and talk to farmer"],
	],
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
		4,
		obj_farmer,
		-1,
		-1,
		-1,
		["Kill the beetles and then talk to farmer"],
	]
);