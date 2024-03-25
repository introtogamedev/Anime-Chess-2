#macro MOUSE_OUT_OF_BOUNDS -1
global.mouse_coordinate = [0, 0];

global.selectedTile = noone;//initialize to noone
global.selectedUnit = noone;//initialize to noone

selected_Tiles = ds_list_create();