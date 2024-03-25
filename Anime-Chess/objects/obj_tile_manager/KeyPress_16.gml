if (not mouse_check_outOfBounds()){
	if (get_tile_carry(global.mouse_coordinate) == noone){
		var carry = instance_create_depth(0, 0, 0, obj_temp_peice)
		set_tile_carry(global.mouse_coordinate, carry);
	}else{
		//ERROR MESSAGE
		show_debug_message_ext("Tile at {0} failed initiate carry because it is carrying {1}", 
			[global.mouse_coordinate, get_tile_carry(global.mouse_coordinate)]
		);
	}
}else{
	show_debug_message("Mouse Index Out of Bounds!");
}


