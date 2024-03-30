function select_tile(position, selectedTile){
	var x_coordinate = position[0];
	var y_coordinate = position[1];
	if (instance_exists(obj_tile_manager)){//safegard
		var instance = obj_tile_manager.grid[x_coordinate, y_coordinate];
		
		/*tile deselect*/
		if(instance.selected == true){
			if (DEBUG_MODE_SELECT){show_debug_message("Unselected Tile at {1}: {0}", selectedTile, position);}
			instance.selected = false;
			//selectedTile = noone;
			return noone;
		}
		
		/*tile select or change selection*/
		if (selectedTile == noone){
			instance.selected = true;
			selectedTile = instance;
			if (DEBUG_MODE_SELECT){show_debug_message("Tile Selected at {1}: {0}", selectedTile, position);}
		}else if (instance != selectedTile){
			instance.selected = true;
			selectedTile.selected = false;
			selectedTile = instance;
			if (DEBUG_MODE_SELECT){show_debug_message("Changed Selected Tile to {1}: {0}", selectedTile, position);}
		}
		return selectedTile;
	}
}

function addTile_ToList(list, position){
	var x_coordinate = position[0];
	var y_coordinate = position[1];
	
	var tile = select_tile(position, noone);
	
	if (tile == noone){
		if (instance_exists(obj_tile_manager)){//safegard
			var instance = obj_tile_manager.grid[x_coordinate, y_coordinate];
			var editIndex = ds_list_find_index(list, instance);
			ds_list_delete(list, editIndex);
			if (DEBUG_MODE_SELECT){show_debug_message("Removed Tile at {1} from selection: {0}", instance, instance.coordinate);}
		}
	}else{
		ds_list_add(list, tile);
		if (DEBUG_MODE_SELECT){show_debug_message("Added Tile at {1} to selection: {0} ", tile, tile.coordinate);}
	}
	return list;
}

function deslect_all_tiles(){
	reset_grid_selectionState();
	deselect_tiles();
	deselect_tile();
	deselect_unit();
	if (DEBUG_MODE_SELECT){show_debug_message("Cleared All Selections and deselected all tiles");}
}

function deselect_tiles(){
	ds_list_clear(global.selectedTiles);
	if (DEBUG_MODE_SELECT){show_debug_message("Cleared All Selected Tiles");}
}

function deselect_tile(){
	if (global.selectedTile != noone){
		global.selectedTile.selected = false;
		//show_debug_message("Deselected Tile at position {1}: {0}",global.selectedTile, global.selectedTile.coordinate );
		global.selectedTile = noone;
	}else{
		if (DEBUG_MODE_SELECT){show_debug_message("Tile selection already empty!");	}
	}
}

function deselect_unit(){
	//show_debug_message("Cleared Unit Selection at {1}: {0}", global.selectedUnit, global.selectedUnit.carrier.coordinate);
	global.selectedUnit = noone;
}

function reset_grid_selectionState(){
	obj_basic_tile.selected = false;
	//show_debug_message("Reset Grid Selected State to: {0}", false);
	obj_basic_tile.display = tileDisplay.original;
	if (DEBUG_MODE_DISPLAY){show_debug_message("Reset grid sprite state to default");}
}