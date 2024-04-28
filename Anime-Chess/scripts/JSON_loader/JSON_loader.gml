/*
This script runs at the beginning the the game 
load in all json files and create its respective structs. 
Messages for debugging purposes only. Printed to Console. 
*/
function loadJSON(_file_name){
	if(file_exists(_file_name)){
		var file = file_text_open_read(_file_name);
		var json_str = "";
		while(not file_text_eof(file)){
			json_str += file_text_read_string(file);
			file_text_readln(file);
		}
		file_text_close(file);
		return json_parse(json_str);
	}
	return undefined;
}


show_debug_message("Loading game files....")

//loading in JSON files
global.unitInformation = loadJSON("unitInformation.json");
//global.variable2 = loadJSON("file2.json");
//global.variable3 = loadJSON("file3.json");

show_debug_message(global.unitInformation);
//show_debug_message(global.variable2);
//show_debug_message(global.variable3);
show_debug_message("JSON FILES SUCESSFULLY LOADED");

