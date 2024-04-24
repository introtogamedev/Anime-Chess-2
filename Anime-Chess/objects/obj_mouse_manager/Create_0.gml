#macro MOUSE_OUT_OF_BOUNDS -1
#macro MOUSE_DESELECT_TIMER 10
global.mouse_coordinate = [-1, -1];
team_color = 0;

global.selectedTile = noone;//initialize to noone
global.selectedUnit = noone;//initialize to noone

global.selectedTiles = ds_list_create();
global.selectRestriction = [];

enum selectState{
	idle,
	tileSelect, 
	//unitSelect,//executed within the unit themselves
	tilesSelect,
	deselect
}

global.select_state = selectState.tileSelect;
activated = true;

//custom cursor
window_set_cursor(cr_none);
//cursor_sprite = spr_custom_cursor;//temporary

select_activate_cooldown = function(){
	if (activated){
		activated = false;
	}
	alarm[0] = 10;
}