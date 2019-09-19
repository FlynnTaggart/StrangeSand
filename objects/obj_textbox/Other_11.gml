name = names[page];
voice = voices[page];
portrait_index = portraits[page];
/*
show_debug_message("Name: " + string(name) + " " + string(names[page]));
show_debug_message("Voice: " + string(voice) + " " + string(voices[page]));
show_debug_message("Port: " + string(portrait_index) + " " + string(portraits[page]));
var debug_text = text_wrapped;
debug_text = string_replace_all(debug_text, "\n", "oAo");
show_debug_message(debug_text);
show_debug_message(string(string_width("text")));*/
if(!is_array(text[page])){
	text_wrapped = s_string_wrap(text[page], text_max_width);
	str_len = string_length(text_wrapped);
	choice_dialogue = false;
} else{
	text_array = text[page];
	text_array_len = array_length_1d(text_array);
	choice_dialogue = true;
}
counter = 0;	