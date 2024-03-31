function move_peice_to(peice, position, movementRestriction = tile_get_restriction(peice.carrier.coordinate, tileRestriction.surrounding)){
	var x_coordinate = position[0];
    var y_coordinate = position[1];
    if (not instance_exists(obj_tile_manager)){
		return;
	}
    var moveToTILE = obj_tile_manager.grid[x_coordinate, y_coordinate];
	var moveTo = position;
	var moveFrom = peice.carrier.coordinate;
	
	var canMove = false;
	
	for (var i = 0; i < array_length(movementRestriction); i ++){
		if (moveToTILE == movementRestriction[i]){
			canMove = true;
			break;
		}
	}
	
	if (canMove){
		if (get_tile_carry(moveTo) == noone){
			set_tile_carry(moveFrom, noone);
			set_tile_carry(moveTo, peice);

			if (DEBUG_MODE_MOVE){show_debug_message("Sucessfully moved peice at {1} to {2}. {0}", peice, moveFrom, moveTo);}
		}else{
			if (DEBUG_MODE_MOVE){show_debug_message("Failed to move peice at {1} due to tile {2} being occupied.{0} "
								, peice, moveFrom, moveTo)}
		}
		peice.currentAction = action.reset;
		global.select_state = selectState.deselect;
	}else{
		if (DEBUG_MODE_MOVE){show_debug_message("Cannot move peice at {1} because Movement Restriction." +
							"Peice can move to {2} instead. {0}", 
							peice, moveFrom, movementRestriction);}
		peice.currentAction = action.idle;
		global.select_state = selectState.deselect;
	}
	
}
	