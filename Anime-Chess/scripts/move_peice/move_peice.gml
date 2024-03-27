function move_peice_to(peice, position, movementRestriction = -1){
	var x_coordinate = position[0];
    var y_coordinate = position[1];
    if (not instance_exists(obj_tile_manager)){
		return;
	}
    var moveToTILE = obj_tile_manager.grid[x_coordinate, y_coordinate];
	var moveTo = position;
	var moveFrom = peice.carrier.coordinate;
	
	var canMove = false;
		
	if (movementRestriction = -1){
		movementRestriction = tile_get_surrounding(peice.carrier.coordinate);
	}
	
	for (var i = 0; i < array_length(movementRestriction); i ++){
		if (moveToTILE == movementRestriction[i]){
			canMove = true;
			break;
		}
	}
	
	if (canMove){
		if (get_tile_carry(moveTo) == noone){
			set_tile_carry(moveFrom, noone);
			set_tile_carry(moveTo, self);
			show_debug_message("Sucessfully moved peice at {1} to {2}. {0}", peice, moveFrom, moveTo);
			peice.currentAction = action.idle;
		}else{
			show_debug_message("Failed to move peice at {1} due to tile {2} being occupied.{0} "
								, peice, moveFrom, moveTo)
		}
	}else{
		show_debug_message("Cannot move peice at {1} because Movement Restriction." +
							"Peice can move to {2} instead. {0}", 
							peice, moveFrom, movementRestriction);
	}
	global.select_state = selectState.deselect;
}
	