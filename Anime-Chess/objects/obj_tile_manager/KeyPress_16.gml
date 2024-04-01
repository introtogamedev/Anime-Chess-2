if (not mouse_check_outOfBounds()){
	if (get_tile_carry(global.mouse_coordinate) == noone){
		var carry = instance_create_depth(0, 0, 0, obj_temp_peice);
		if (global.currentTurn == turn.BLUE_TURN){
			carry.teamAssignment = team.TEAM_BLUE;
			carry.sprite_index = spr_temp_peice;
		} else {
			carry.sprite_index = spr_temp_peice1;
			carry.teamAssignment = team.TEAM_RED;
		}
		set_tile_carry(global.mouse_coordinate, carry);
	}else{
		//ERROR MESSAGE
		if (DEBUG_MODE_SELECT){show_debug_message_ext(
			"Tile at {0} failed initiate carry because it is carrying {1}", 
			[global.mouse_coordinate, get_tile_carry(global.mouse_coordinate)]
		);}
	}
}else{
	show_debug_message("Mouse Index Out of Bounds!");
}


