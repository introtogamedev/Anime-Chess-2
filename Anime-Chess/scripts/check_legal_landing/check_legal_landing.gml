//NOT USED
/*
global.blue_array = [[4, 0], [4, 1], [3, 1], [3, 2], [2, 2], [2, 3], [1, 3], [1, 4], [0, 4], 
		[5, 1], [5, 2], [4, 2], [4, 3], [3, 3], [3, 4], [2, 4], [2, 5], [1, 5]];
global.red_array = [[10, 6], [10, 7], [9, 7], [9, 8], [8, 8], [8, 9], [7, 9], [7, 10], [6, 10], 
		[11, 7], [11, 8], [10, 8], [10, 9], [9, 9], [9, 10], [8, 10], [8, 11], [7, 11]];


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