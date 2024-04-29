
global.blue_array = [[3, 0], [3, 1], [2, 1], [2, 2], [1, 2], [1, 3], [0, 3], 
		[4, 1], [4, 2], [3, 2], [3, 3], [2, 3], [2, 4], [1, 4]];
global.red_array = [[7, 4], [7, 5], [6, 5], [6, 6], [5, 6], [5, 7], [4, 7], 
		[8, 5], [8, 6], [7, 6], [7, 7], [6, 7], [6, 8], [5, 8]];


function check_legal_landing(position, piece_type){
	if (piece_type == obj_piece_King){
		return true;
	}
	if (global.turnsystem.currentTurn == 0){
		for (var i = 0; i < array_length(global.blue_array); i++){
			if (position[0] == global.blue_array[i][0] && position[1] == global.blue_array[i][1]){
				return true;
			}
		}
		return false;
	}
	if (global.turnsystem.currentTurn == 1){
		for (var i = 0; i < array_length(global.red_array); i++){
			if (position[0] == global.red_array[i][0] && position[1] == global.red_array[i][1]){
				return true;
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