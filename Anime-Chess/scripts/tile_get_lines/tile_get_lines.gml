enum line_axis{
	X, Y, Z
	//Z axis is the horizontal axis with coordinates, (x,y) -> (x+1, y+1)
}
function tile_get_lines(position, axis){
    var x_coordinate = position[0];
    var y_coordinate = position[1];
	var line_coordinates = [];
    if (instance_exists(obj_tile_manager)){
		var grid = obj_tile_manager.grid;
       
		switch(axis){
			case(line_axis.X):
				for (var h = 0; h < array_length(grid); h++){
					//if the y axis have the x position in the grid
					if (y_coordinate < array_length(grid[h])){
						//if grid index is not empty & is not the current position
						if (grid[h][y_coordinate] != 0 && h != x_coordinate){
							var tile = grid[h][y_coordinate];
							array_push(line_coordinates, tile);
						}
					}
				}
				break;
				
			case(line_axis.Y):
				for (var p = 0; p < array_length(grid[x_coordinate]); p++){
					//if grid index is not empty & is not the current position
					if (grid[x_coordinate][p] != 0 && p != y_coordinate){
						var tile = grid[x_coordinate][p];
						array_push(line_coordinates, tile);
					}
				}
				break;
				
			case(line_axis.Z):
				var index_shift = -1;
				var rightbound = false;
				while(true){
					if(x_coordinate + index_shift >= array_length(grid) ||
						x_coordinate + index_shift < 0 ||
						y_coordinate + index_shift >= array_length(grid[x_coordinate+index_shift]) ||
						y_coordinate +index_shift<0){
						break;	
					}else{
						var tile = grid[x_coordinate + index_shift][y_coordinate+index_shift]
						if (tile!= 0 ){
							array_push(line_coordinates, tile)
							show_debug_message(tile.coordinate)
							index_shift += sign(index_shift);
						}else{
							if (rightbound == true){
								break;
							}
							index_shift = 1;
							rightbound = true;
							//show_debug_message("switched sides")
						}
					}
				}
				break;
		}
		
       
    }
	 return line_coordinates;
}