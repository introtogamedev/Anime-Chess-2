enum tileRestriction{
	X, Y, Z, XYZ,
	//Z axis is the horizontal axis with coordinates, (x,y) -> (x+1, y+1)
	surrounding,
	twotilesurrounding,
	horse,
	pao
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
		            if (detect_tile_exists(surrounding_x_coordinate, surrounding_y_coordinate)){
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
		            if (detect_tile_exists(surrounding_x_coordinate, surrounding_y_coordinate)){
		                if (obj_tile_manager.grid[surrounding_x_coordinate][surrounding_y_coordinate] != 0){
		                    var tile = obj_tile_manager.grid[surrounding_x_coordinate, surrounding_y_coordinate];
		                    array_push(restriction_coordinates, tile);
		                }
		            }
		        } 
				break;
				
			case(tileRestriction.pao):
				var relative_coordinates_to_check = [[-1, 0, -2, 0], [-1, -1, -2, -2], [0, -1, 0, -2], [1, 0, 2, 0], [1, 1, 2, 2], [0, 1, 0, 2]];
		        for (var i = 0; i < 6; i++){
					var surrounding_x_coordinate = x_coordinate + relative_coordinates_to_check[i][0];
		            var surrounding_y_coordinate = y_coordinate + relative_coordinates_to_check[i][1];
					var hopping_to_x_coordinate = x_coordinate + relative_coordinates_to_check[i][2];
					var hopping_to_y_coordinate = y_coordinate + relative_coordinates_to_check[i][3];
		            if (detect_tile_exists(surrounding_x_coordinate, surrounding_y_coordinate)){
						var hopping_over = obj_tile_manager.grid[surrounding_x_coordinate][surrounding_y_coordinate];
						if (hopping_over.carry !=  noone){
							if (detect_tile_exists(hopping_to_x_coordinate, hopping_to_y_coordinate)){
								var tile = obj_tile_manager.grid[hopping_to_x_coordinate, hopping_to_y_coordinate];
								array_push(restriction_coordinates, tile);
							}
						}
		            }
		        }
				var surrounding_coordinates_to_check = [[-1, 0], [-1, -1], [0, -1], [1, 0], [1, 1], [0, 1]];
		        for (var i = 0; i < 6; i++){
					var surrounding_x_coordinate = x_coordinate + surrounding_coordinates_to_check[i][0];
		            var surrounding_y_coordinate = y_coordinate + surrounding_coordinates_to_check[i][1];
		            if (detect_tile_exists(surrounding_x_coordinate, surrounding_y_coordinate)){
		                if (obj_tile_manager.grid[surrounding_x_coordinate][surrounding_y_coordinate] != 0){
		                    var tile = obj_tile_manager.grid[surrounding_x_coordinate, surrounding_y_coordinate];
		                    array_push(restriction_coordinates, tile);
		                }
		            }
		        } 
				break;
				
			case(tileRestriction.twotilesurrounding):
				var surrounding_coordinates_to_check = [[-1, 0], [-1, -1], [0, -1], [1, 0], [1, 1], [0, 1]];
				var second_layer_surrounding_coordinates = [[-2, 0], [-2, -2], [0, -2], [2, 0], [2, 2], [0, 2]];
				var second_middle_surrounding_coordinates = [[-2, -1], [-1, -2], [1, -1], [2, 1], [1, 2], [-1, 1]];
				var empty_array = [false, false, false, false, false, false];
				for (var i = 0; i < array_length(surrounding_coordinates_to_check); i++){
					var surrounding_x_coordinate = x_coordinate + surrounding_coordinates_to_check[i][0];
					var surrounding_y_coordinate = y_coordinate + surrounding_coordinates_to_check[i][1];
					if (detect_tile_exists(surrounding_x_coordinate, surrounding_y_coordinate)){
						var tile = obj_tile_manager.grid[surrounding_x_coordinate, surrounding_y_coordinate];
						array_push(restriction_coordinates, tile);
						var x_second_layer_of_surrounding_coordinates = x_coordinate + second_layer_surrounding_coordinates[i][0];
						var y_second_layer_of_surrounding_coordinates = y_coordinate + second_layer_surrounding_coordinates[i][1];
						if (tile.carry == noone){
							empty_array[i] = true;
							if (detect_tile_exists(x_second_layer_of_surrounding_coordinates, y_second_layer_of_surrounding_coordinates)){
								//show_debug_message("haihai");
								var tile_2 = obj_tile_manager.grid[x_second_layer_of_surrounding_coordinates, y_second_layer_of_surrounding_coordinates];
								array_push(restriction_coordinates, tile_2);
							}
						}
					}
				}
				for (var z = 0; z < array_length(empty_array); z++){
					if ((z != 5 && (empty_array[z] == true || empty_array[z] == true)) || (z == 5 && (empty_array[0] == true || empty_array[z] == true))){
						var x_third_layer_of_surrounding_coordinates = x_coordinate + second_middle_surrounding_coordinates[z][0];
						var y_third_layer_of_surrounding_coordinates = y_coordinate + second_middle_surrounding_coordinates[z][1];
						if (detect_tile_exists(x_third_layer_of_surrounding_coordinates, y_third_layer_of_surrounding_coordinates)){
							var tile_3 = obj_tile_manager.grid[x_third_layer_of_surrounding_coordinates, y_third_layer_of_surrounding_coordinates];
							array_push(restriction_coordinates, tile_3);
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

function detect_tile_exists(x_coordinate, y_coordinate){
	if (x_coordinate < array_length(obj_tile_manager.grid)
		&& x_coordinate >= 0
		&& y_coordinate < array_length(obj_tile_manager.grid[x_coordinate])
		&& y_coordinate >= 0
		&& obj_tile_manager.grid[x_coordinate][y_coordinate] != 0){
		return true;
	}else{
		return false;
	}
}