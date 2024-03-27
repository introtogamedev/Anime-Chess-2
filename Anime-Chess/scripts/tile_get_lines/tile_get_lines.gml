function tile_get_lines(position){
    var x_coordinate = position[0];
    var y_coordinate = position[1];
    if (instance_exists(obj_tile_manager)){
        var line_coordinates = [];
		//get tiles with increasing x
		for (var h = 0; h < array_length(obj_tile_manager.grid); h++){
			if (h < array_length(obj_tile_manager.grid) && y_coordinate < array_length(obj_tile_manager.grid[h])){
				if (obj_tile_manager.grid[h][y_coordinate] != 0 && h != x_coordinate){
					var tile = obj_tile_manager.grid[h][y_coordinate];
					array_push(line_coordinates, tile);
				}
			}
		}
		//get tiles with increasing y
		for (var p = 0; p < array_length(obj_tile_manager.grid[x_coordinate]); p++){
			if (obj_tile_manager.grid[x_coordinate][p] != 0 && p != y_coordinate){
				var tile = obj_tile_manager.grid[x_coordinate][p];
				array_push(line_coordinates, tile);
			}
		}
		
		var low = min(x_coordinate, y_coordinate);
		for (var u = 1; u <= low; u++){
			if (x_coordinate - u < array_length(obj_tile_manager.grid) && y_coordinate - u < array_length(obj_tile_manager.grid[x_coordinate - u])){
				if (obj_tile_manager.grid[x_coordinate - u][y_coordinate - u] != 0){
					var tile = obj_tile_manager.grid[x_coordinate - u][y_coordinate - u];
					array_push(line_coordinates, tile);
					show_debug_message("ehehe");
				}
			}else{
				show_debug_message(array_length(obj_tile_manager.grid));
				show_debug_message(y_coordinate - u);
			}
		}
		
		var high = max(x_coordinate, y_coordinate);
		for (var w = 1; w < 12 - high; w++){
			if (x_coordinate + w < array_length(obj_tile_manager.grid) && y_coordinate + w < array_length(obj_tile_manager.grid[x_coordinate + w])){
				if (obj_tile_manager.grid[x_coordinate + w][y_coordinate + w] != 0){
					var tile = obj_tile_manager.grid[x_coordinate + w][y_coordinate + w];
					array_push(line_coordinates, tile);
				}
			}
		}
		
        return line_coordinates;
    }
}