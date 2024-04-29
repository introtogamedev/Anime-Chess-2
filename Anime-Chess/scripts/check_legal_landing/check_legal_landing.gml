
global.blue_array = [[3, 0], [3, 1], [2, 1], [2, 2], [1, 2], [1, 3], [0, 3], 
		[4, 1], [4, 2], [3, 2], [3, 3], [2, 3], [2, 4], [1, 4]];
global.red_array = [[7, 4], [7, 5], [6, 5], [6, 6], [5, 6], [5, 7], [4, 7], 
		[8, 5], [8, 6], [7, 6], [7, 7], [6, 7], [6, 8], [5, 8]];

function check_legal_landing(position, piece_type){
    if (piece_type == obj_piece_king){
        return true;
    }
    var king_list = [];
    for (var i = 0; i < instance_number(obj_piece_king); i++){
        array_push(king_list, instance_find(obj_piece_king, i));
    }
    if (global.turnsystem.currentTurn == 0){
        for (var a = 0; a < array_length(king_list); a++){
            if (king_list[a].teamAssignment == 0){
                var right_king = king_list[a];
                var legal_landings = tile_get_restriction([right_king.carrier.x_coordinate, right_king.carrier.y_coordinate], tileRestriction.surrounding);
                for (var h = 0; h < array_length(legal_landings); h++){
                    if (position[0] == legal_landings[h].x_coordinate && position[1] == legal_landings[h].y_coordinate){
                        return true;
                    }
                }
            }
        }
        return false;
    }
    if (global.turnsystem.currentTurn == 1){
        for (var a = 0; a < array_length(king_list); a++){
            if (king_list[a].teamAssignment == 1) {
                var right_king = king_list[a];
                var legal_landings = tile_get_restriction([right_king.carrier.x_coordinate, right_king.carrier.y_coordinate], tileRestriction.surrounding);
                for (var h = 0; h < array_length(legal_landings); h++){
                    if (position[0] == legal_landings[h].x_coordinate && position[1] == legal_landings[h].y_coordinate){
                        return true;
                    }
                }
            }
        }
        return false;
    }
}

//temporary
function highlight_landing(on_or_off){
	var empty_array = [];
	if (global.turnsystem.currentTurn == 0){
		var arr = global.blue_array;
	} else {
		var arr = global.red_array;
	}
	for (var i = 0; i < array_length(arr); i++){
		array_push(empty_array, obj_tile_manager.grid[arr[i][0]][arr[i][1]]);
	}
	if (on_or_off == true){
		for(var i = 0; i < array_length(empty_array); i ++){
			empty_array[i].display = tileDisplay.highlight_landable;
		}
	} else {
		for(var i = 0; i < array_length(empty_array); i ++){
			empty_array[i].display = tileDisplay.original;
		}
	}
}