function move_peice_to(peice, position){
	var moveTo = position;
	var moveFrom = peice.carrier.coordinate;
	
	if (get_tile_carry(position) == noone){
		set_tile_carry(moveFrom, noone);
		set_tile_carry(moveTo, self);
		peice.currentAction = action.idle;
		deselect_tiles();
		global.select_state = selectState.deselect;
	}else{
		global.select_state = selectState.deselect;
	}
}
		
	
		

		