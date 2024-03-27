function set_tile_carry(position, carry){
	//if carry.object_index = obj_temp_peice
	var x_coordinate = position[0];
	var y_coordinate = position[1];
	if (instance_exists(obj_tile_manager)){//safegard
		var carrier = obj_tile_manager.grid[x_coordinate, y_coordinate];
		if (carrier.carry == noone){
			carrier.carry = carry;
			carry.x = carrier.x;
			carry.y = carrier.y;
			carry.carrier = carrier;
			show_debug_message("Tile at {0} is now carrying instance: {1}", position, carry);
		}else if (carry == noone){
			carrier.carry = carry;
			show_debug_message("Cleared carry at Tile: {0}", position);
		}else{
			show_debug_message("Tile at {0} attempted to carry {1}, but the tile was already carrying {2}", 
			position, carry, carrier.carry);
		}
	}
}

function get_tile_carry(position){
	var x_coordinate = position[0];
	var y_coordinate = position[1];
	if (instance_exists(obj_tile_manager)){//safegard
		var carrier = obj_tile_manager.grid[x_coordinate, y_coordinate];
		return carrier.carry
	}
	return noone
}