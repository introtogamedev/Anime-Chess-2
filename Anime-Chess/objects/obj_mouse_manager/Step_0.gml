if (not place_meeting(mouse_x, mouse_y, obj_basic_tile)){
	global.mouse_coordinate = [-1, -1];
}else{
	var instance = instance_place(mouse_x, mouse_y, obj_basic_tile);
	with (instance){
		global.mouse_coordinate  = [x_coordinate, y_coordinate];
	}
}