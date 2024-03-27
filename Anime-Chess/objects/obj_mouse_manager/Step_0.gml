if (not place_meeting(mouse_x, mouse_y, obj_basic_tile)){
	global.mouse_coordinate = [-1, -1];
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