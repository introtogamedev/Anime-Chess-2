switch (select_state){
	case(selectState.tileSelect):
		if (mouse_check_outOfBounds() == false){
			global.selectedTile = select_Tile(global.mouse_coordinate, global.selectedTile)
		}
	break;
	
	case (selectState.tilesSelect):
		if (mouse_check_outOfBounds() == false){
			global.selectedTiles = addTile_ToList(global.selectedTiles,global.mouse_coordinate)
			show_debug_message(global.selectedTiles);
		}
	break
	
}