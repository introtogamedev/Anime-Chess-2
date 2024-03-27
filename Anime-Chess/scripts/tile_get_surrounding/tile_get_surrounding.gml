function tile_get_surrounding(position){
    var x_coordinate = position[0];
    var y_coordinate = position[1];
    if (instance_exists(obj_tile_manager)){
        var surrounding_coordinates = [];
        var relative_coordinates_to_check = [[-1, 0], [-1, -1], [0, -1], [1, 0], [1, 1], [0, 1]];
        for (var i = 0; i < 6; i++){
            surrounding_x_coordinate = x_coordinate + relative_coordinates_to_check[i][0];
            surrounding_y_coordinate = y_coordinate + relative_coordinates_to_check[i][1];
            if (surrounding_x_coordinate < array_length(obj_tile_manager.grid)
			&& surrounding_x_coordinate >= 0
			&& surrounding_y_coordinate < array_length(obj_tile_manager.grid[surrounding_x_coordinate])
			&& surrounding_y_coordinate >= 0){
                if (obj_tile_manager.grid[surrounding_x_coordinate][surrounding_y_coordinate] != 0){
                    var tile = obj_tile_manager.grid[surrounding_x_coordinate, surrounding_y_coordinate];
                    array_push(surrounding_coordinates, tile);
                }
            }
        }
        return surrounding_coordinates;
    }
}