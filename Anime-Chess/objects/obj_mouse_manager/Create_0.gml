#macro MOUSE_OUT_OF_BOUNDS -1
#macro MOUSE_DESELECT_TIMER 10
global.mouse_coordinate = [0, 0];

global.selectedTile = noone;//initialize to noone
global.selectedUnit = noone;//initialize to noone

global.selectedTiles = ds_list_create();

enum selectState{
	idle,
	tileSelect, 
	//unitSelect,//executed within the unit themselves
	tilesSelect,
	deselect
}

global.select_state = selectState.idle;