if (not place_meeting(mouse_x, mouse_y, obj_basic_tile)){
	global.mouse_coordinate = [-1, -1];
}

if (place_meeting(mouse_x, mouse_y, obj_basic_tile) && mouse_check_button_pressed(mb_left)){
	var places_to_go = tile_get_lines(global.mouse_coordinate);
	for(var h = 0; h <  array_length(places_to_go); h++){
		places_to_go[h].image_angle += 180;
	}
}
switch(global.select_state){
	case (selectState.deselect):
		deslect_all_tiles();
		global.select_state++;
		break;
}

if (global.select_state >= selectState.deselect){
	global.select_state = selectState.idle;
}