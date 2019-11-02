///@description s_string_wrap
///@arg string
///@arg max_width

var str = argument0;
var max_width = argument1 + 70;
show_debug_message(string(max_width));
var str_len = string_length(str);
var last_space = 1;

var substr;

for(var i = 1; i <= str_len; ++i){
	substr = string_copy(str, 1, i);
	
	if(string_char_at(str, i) == " ")
		last_space = i;
	//show_debug_message("substr_width = " + string(string_width(substr)));
	if(string_width(substr) > max_width){
		str = string_delete(str, last_space, 1);
		str = string_insert("\n", str, last_space);
		i++;
	}
}
show_debug_message(string(string_width(str)));
return str;