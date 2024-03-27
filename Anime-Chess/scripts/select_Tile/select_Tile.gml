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

function addTile_ToList(list, position){
	var x_coordinate = position[0];
	var y_coordinate = position[1];
	
	var tile = select_Tile(position, noone);
	
	if (tile == noone){
		if (instance_exists(obj_tile_manager)){//safegard
			var instance = obj_tile_manager.grid[x_coordinate, y_coordinate];
			var editIndex = ds_list_find_index(list, instance);
			ds_list_delete(list, editIndex)
		}
	}else{
		ds_list_add(list, tile);	
	}
	return list;
}

function deslect_all_tiles(){
	if (instance_exists(obj_tile_manager)){//safegard
		for(var i = 0; i < array_length(obj_tile_manager.grid); i ++){
			for (var j = 0; j < array_length(obj_tile_manager.grid[i]); j ++){
				obj_tile_manager.grid[i,j].selected = false;
			}
		}
	}
	show_debug_message("Reset Grid Selected State to: {0}", false);
	global.selectedTile = noone;
	ds_list_clear(global.selectedTiles);
	show_debug_message("Cleared All Selected Tiles");
}