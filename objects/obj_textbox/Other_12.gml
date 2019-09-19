//[script, arg0, arg1...]


if(is_array(scripts)){
	var page_script = scripts[page];
	if(choice_dialogue) page_script = page_script[choice];
	
	if(page_script != -1){
		var len = array_length_1d(page_script);
		if(len == 1) 
			script_execute(page_script[0]);
		else{
			var args = array_create(len - 1, 0);
			array_copy(args, 0, page_script, 1, len - 1);
			s_script_execute_ext(page_script[0], args);
		}	
	}
}
