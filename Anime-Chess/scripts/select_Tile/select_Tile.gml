function select_Tile(position, selectedTile){
	var x_coordinate = position[0];
	var y_coordinate = position[1];
	if (instance_exists(obj_tile_manager)){//safegard
		var instance = obj_tile_manager.grid[x_coordinate, y_coordinate];
		
		if (selectedTile == noone){
			instance.selected = true;
			selectedTile = instance;
			show_debug_message("Tile Selected: {0}", selectedTile);
		}else if (instance != selectedTile){
			instance.selected = true;
			selectedTile.selected = false;
			selectedTile = instance;
			show_debug_message("Changed Selected Tile to {0}", selectedTile);
		}else{
			show_debug_message("Unselected Tile: {0}", selectedTile);
			selectedTile.selected = false;
			selectedTile = noone;
		}
		return selectedTile;
	}
}
