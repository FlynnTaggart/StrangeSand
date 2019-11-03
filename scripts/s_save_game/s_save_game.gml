if(file_exists("Save.sav")) file_delete("Save.sav");
ini_open("Save.sav");
var saved_room = room;
ini_write_real("Room", "room", saved_room);
ini_close();