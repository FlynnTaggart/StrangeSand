if (file_exists("Save.sav")){
	ini_open("Save.sav");
	var loadded_room = ini_read_real("Room", "room", rm_start);
	ini_close();
}