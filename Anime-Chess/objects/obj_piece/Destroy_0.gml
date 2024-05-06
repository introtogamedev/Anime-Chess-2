global.select_state = selectState.deselect;
set_tile_carry(carrier.coordinate, noone);
	if (isSubUnit == false){
		global.turnsystem.teams[teamAssignment].createdPieces --;
	}
	
	show_debug_message(global.turnsystem.teams[teamAssignment].createdPieces);