switch (global.select_state){
	case(selectState.idle):
		global.select_state = selectState.tileSelect;//temprary
	
	case(selectState.tileSelect):
		if (mouse_check_outOfBounds() == false){
			global.selectedTile = select_tile(global.mouse_coordinate, global.selectedTile)
		}
	break;
	
	case (selectState.tilesSelect):
		if (mouse_check_outOfBounds() == false){
			global.selectedTiles = addTile_ToList(global.selectedTiles,global.mouse_coordinate)
		}
	break;
	
	case (selectState.deselect):
		deslect_all_tiles();
	break;
	
	default:
		//do nothing. 
	break;
}

