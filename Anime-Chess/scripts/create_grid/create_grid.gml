
function create_grid(){
	var y_position = STARTING_Y_POSITION;
	var x_cor_offset = floor( (VERTICAL_GRID_HEIGHT -1)/2);
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
			
			var variable_assignment = {
				x_coordinate: x_coordinate + x_cor_offset + i,
				y_coordinate: y_coordinate + i
			}
			
			var obj = instance_create_layer(x_position, y_position, "Board", obj_basic_tile, variable_assignment);
			grid[variable_assignment.x_coordinate][variable_assignment.y_coordinate] = obj;

		}
		y_position += TILE_HEIGHT - TILE_Y_OFFSET;
	}
	
	#region Create Initial Pieces

		//var carryBLUE = instance_create_layer(0, 0, "Pieces", obj_piece_King);
		var positionBLUE =[];
		if (VERTICAL_GRID_HEIGHT < 3){
			positionBLUE = [0,0]
		}else if ((VERTICAL_GRID_HEIGHT - 2)%4 == 0){
			positionBLUE = [round(VERTICAL_GRID_HEIGHT/4)-1,round(VERTICAL_GRID_HEIGHT/4)-1];
		}else{
			positionBLUE = [round(VERTICAL_GRID_HEIGHT/4),round(VERTICAL_GRID_HEIGHT/4)];
		}
		global.turnsystem.teams[global.turnsystem.currentTurn].create_piece(obj_piece_king, positionBLUE)
		//set_tile_carry(positionBLUE, carryBLUE);
		//carryBLUE.teamAssignment = teamsEnum.TEAM_BLUE;
		//carryBLUE.sprite_index = spr_blue_king;
		
		global.turnsystem.turn_next();
		//var carryRED = instance_create_layer(0, 0, "Pieces", obj_piece_King);
		var positionRED =[];
		if (VERTICAL_GRID_HEIGHT <= 2){
			positionRED = [HORIZONTAL_GRID_LENGTH-1, HORIZONTAL_GRID_LENGTH-1];
		}else if (VERTICAL_GRID_HEIGHT%4 < 2){
			positionRED = [HORIZONTAL_GRID_LENGTH + VERTICAL_GRID_HEIGHT/4 -1, HORIZONTAL_GRID_LENGTH + VERTICAL_GRID_HEIGHT/4-1]
		}else{
			positionRED = [HORIZONTAL_GRID_LENGTH + VERTICAL_GRID_HEIGHT/4, HORIZONTAL_GRID_LENGTH + VERTICAL_GRID_HEIGHT/4];
		}
		global.turnsystem.teams[global.turnsystem.currentTurn].create_piece(obj_piece_king, positionRED)
		//set_tile_carry(positionRED, carryRED);
		//carryRED.teamAssignment = teamsEnum.TEAM_RED;
		//carryRED.sprite_index = spr_red_king;
		
		global.turnsystem.turn_next();
	#endregion
}


