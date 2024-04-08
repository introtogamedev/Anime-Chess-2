enum tileRestriction{
	X, Y, Z, XYZ,
	//Z axis is the horizontal axis with coordinates, (x,y) -> (x+1, y+1)
	surrounding,
	horse
}

function tile_get_restriction(position, restriction){
    var x_coordinate = position[0];
    var y_coordinate = position[1];
	var restriction_coordinates = [];
    if (instance_exists(obj_tile_manager)){
		var grid = obj_tile_manager.grid;
       
		switch(restriction){
			case(tileRestriction.X):
				for (var h = 0; h < array_length(grid); h++){
					//if the y axis have the x position in the grid
					if (y_coordinate < array_length(grid[h])){
						//if grid index is not empty & is not the current position
						if (grid[h][y_coordinate] != 0 && h != x_coordinate){
							var tile = grid[h][y_coordinate];
							array_push(restriction_coordinates, tile);
						}
					}
				}
				break;
				
			case(tileRestriction.Y):
				for (var p = 0; p < array_length(grid[x_coordinate]); p++){
					//if grid index is not empty & is not the current position
					if (grid[x_coordinate][p] != 0 && p != y_coordinate){
						var tile = grid[x_coordinate][p];
						array_push(restriction_coordinates, tile);
					}
				}
				break;
				
			case(tileRestriction.Z):
				var index_shift = -1;
				var rightbound = false;
				while(true){
					if(x_coordinate + index_shift >= array_length(grid) ||
						x_coordinate + index_shift < 0 ||
						y_coordinate + index_shift >= array_length(grid[x_coordinate+index_shift]) ||
						y_coordinate + index_shift<0){
							if (rightbound == false){
								rightbound = true;
								index_shift = 1;
							}else{
								break;	
							}	
					}else{
						var tile = grid[x_coordinate + index_shift][y_coordinate+index_shift]
						if (tile!= 0 ){
							array_push(restriction_coordinates, tile)
							index_shift += sign(index_shift) ;
						}else{
							if (rightbound == true){
								break;
							}
							index_shift = 1;
							rightbound = true;
						}
					}
				}
				break;
			case(tileRestriction.XYZ):
				var xArray = []; 
					xArray = tile_get_restriction(position, tileRestriction.X);
				var yArray = [];
					yArray = tile_get_restriction(position, tileRestriction.Y);
				var zArray = [];
					zArray = tile_get_restriction(position, tileRestriction.Z);
				
				restriction_coordinates = array_union(xArray, yArray, zArray);
																								
				break;
				
			case(tileRestriction.surrounding):
				var relative_coordinates_to_check = [[-1, 0], [-1, -1], [0, -1], [1, 0], [1, 1], [0, 1]];
		        for (var i = 0; i < 6; i++){
					var surrounding_x_coordinate = x_coordinate + relative_coordinates_to_check[i][0];
		            var surrounding_y_coordinate = y_coordinate + relative_coordinates_to_check[i][1];
		            if (surrounding_x_coordinate < array_length(obj_tile_manager.grid)
						&& surrounding_x_coordinate >= 0
						&& surrounding_y_coordinate < array_length(obj_tile_manager.grid[surrounding_x_coordinate])
						&& surrounding_y_coordinate >= 0){
		                if (obj_tile_manager.grid[surrounding_x_coordinate][surrounding_y_coordinate] != 0){
		                    var tile = obj_tile_manager.grid[surrounding_x_coordinate, surrounding_y_coordinate];
		                    array_push(restriction_coordinates, tile);
		                }
		            }
		        } 
				break;
				
			case(tileRestriction.horse):
				var relative_coordinates_to_check = [[-2, -1], [-1, -2], [1, -1], [2, 1], [1, 2], [-1, 1]];
		        for (var i = 0; i < 6; i++){
					var surrounding_x_coordinate = x_coordinate + relative_coordinates_to_check[i][0];
		            var surrounding_y_coordinate = y_coordinate + relative_coordinates_to_check[i][1];
		            if (surrounding_x_coordinate < array_length(obj_tile_manager.grid)
						&& surrounding_x_coordinate >= 0
						&& surrounding_y_coordinate < array_length(obj_tile_manager.grid[surrounding_x_coordinate])
						&& surrounding_y_coordinate >= 0){
		                if (obj_tile_manager.grid[surrounding_x_coordinate][surrounding_y_coordinate] != 0){
		                    var tile = obj_tile_manager.grid[surrounding_x_coordinate, surrounding_y_coordinate];
		                    array_push(restriction_coordinates, tile);
		                }
		            }
		        } 
				break;
				
			default:
				//do nothing
			break;
		}
    }
	 return restriction_coordinates;
}