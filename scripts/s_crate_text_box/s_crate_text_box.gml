///@description s_crate_text_box
///@arg text
///@arg speakers
///@arg next_line
///@arg scripts
///@arg page
///@arg owner npc

//show_debug_message(string(speakers[1].portrait_index));
var tbox =  instance_create_layer(0, 0, "Textbox", obj_textbox);

with(tbox){
	text = argument0;
	speakers = argument1;
	next_line = argument2;
	scripts = argument3;
	page = argument4;
	owner_npc = argument5;
	var len = array_length_1d(speakers);
	for(var i = 0; i < len; i++){
		show_debug_message(string(i) + " " + string(speakers[i]));
		names[i] = speakers[i].name;
		portraits[i] = speakers[i].portrait_index;
		voices[i] = speakers[i].voice;
		/*show_debug_message("Name: " + string(names[i]) + " " + string(speakers[i].name));
		show_debug_message("Voice: " + string(voices[i]) + " " + string(speakers[i].portrait_index));
		show_debug_message("Port: " + string(portraits[i]) + " " + string(speakers[i].voice));*/
	}
	event_perform(ev_other, ev_user1);
}
return tbox;