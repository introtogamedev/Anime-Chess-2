function select_Tile(position, selectedTile){
	var x_coordinate = position[0];
	var y_coordinate = position[1];
	if (instance_exists(obj_tile_manager)){//safegard
		var instance = obj_tile_manager.grid[x_coordinate, y_coordinate];
		
		/*tile deselect*/
		if(instance.selected == true){
			show_debug_message("Unselected Tile at {1}: {0}", selectedTile, position);
			instance.selected = false;
			//selectedTile = noone;
			return noone;
		}
		
		/*tile select or change selection*/
		if (selectedTile == noone){
			instance.selected = true;
			selectedTile = instance;
			show_debug_message("Tile Selected at {1}: {0}", selectedTile, position);
		}else if (instance != selectedTile){
			instance.selected = true;
			selectedTile.selected = false;
			selectedTile = instance;
			show_debug_message("Changed Selected Tile to {1}: {0}", selectedTile, position);
		}
		return selectedTile;
	}
}
