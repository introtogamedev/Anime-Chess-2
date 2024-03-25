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