function move_piece_to(piece, position, movementRestriction = tile_get_restriction(piece.carrier.coordinate, tileRestriction.surrounding)){
	var x_coordinate = position[0];
    var y_coordinate = position[1];
    if (not instance_exists(obj_tile_manager)){
		return;
	}
    var moveToTILE = obj_tile_manager.grid[x_coordinate, y_coordinate];
	var moveTo = position;
	var moveFrom = piece.carrier.coordinate;
	
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
			set_tile_carry(moveTo, piece);

			if (DEBUG_MODE_ACTION){show_debug_message("Sucessfully moved piece at {1} to {2}. {0}", piece.name, moveFrom, moveTo);}
			return true
		}else{
			if (DEBUG_MODE_ACTION){show_debug_message("Failed to move piece at {1} due to tile {2} being occupied.{0} "
								, piece.name, moveFrom, moveTo)}
			return false
		}
		
	}else{
		if (DEBUG_MODE_ACTION){show_debug_message("Cannot move piece at {1} because Movement Restriction." +
							"piece can move to {2} instead. {0}", 
							piece, moveFrom, movementRestriction);}
		return false
	}
}
	