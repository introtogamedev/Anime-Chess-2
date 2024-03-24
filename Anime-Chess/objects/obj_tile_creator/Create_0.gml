#macro STARTING_X_COORDINATE 150
#macro STARTING_Y_POSITION 100
#macro HORIZONTAL_GRID_LENGTH 8
#macro VERTICAL_GRID_HEIGHT 9
#macro STARTING_X_OFFSET 45
#macro TILE_WIDTH 90


grid = [];

function create_grid(){
	var y_position = STARTING_Y_POSITION;
	var initial_coordinate_y = 0;
	var initial_coordinate_x = 0;
	var x_cor_offset = floor( (VERTICAL_GRID_HEIGHT -1) /2);
	show_debug_message(x_cor_offset)
	for (var h = 0 ; h < VERTICAL_GRID_HEIGHT ; h++){
		
		var x_coordinate = 0
		var y_coordinate = 0
		
		if (h % 2 == 1 /*odd row*/){
			x_coordinate = -1 * ((h - 1)/2);
			y_coordinate = (h + 1)/2;
		} else /*even row*/{
			x_coordinate = -1 * (h/2);
			y_coordinate = h/2;
		}
		

		for (var i = 0; i < HORIZONTAL_GRID_LENGTH ; i++){
			//odd or even row
			var x_position = 0;//initialize to 0;
			if (h % 2 == 0){
				x_position = STARTING_X_COORDINATE + i * TILE_WIDTH;
			} else {
				x_position = STARTING_X_COORDINATE + STARTING_X_OFFSET + i * TILE_WIDTH;
			}
			
			var obj = instance_create_layer(x_position, y_position, "Instances", obj_tile);
			grid[x_coordinate + x_cor_offset][ y_coordinate] = obj;

			obj.x_assignment = x_coordinate +x_cor_offset + i;
			obj.y_assignment = y_coordinate + i;


		}
		y_position += 70;
	}
}

create_grid();