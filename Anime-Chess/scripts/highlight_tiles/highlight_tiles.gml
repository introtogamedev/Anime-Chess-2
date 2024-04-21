// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function highlight_tiles(tiles){
	for(var i = 0; i < array_length(tiles); i ++){
		 if (tiles[i].carry != noone){
			tiles[i].display = tileDisplay.highlight_moveable;
		} else {
			tiles[i].display = tileDisplay.highlight_nonmovable;
		}
	}
}

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