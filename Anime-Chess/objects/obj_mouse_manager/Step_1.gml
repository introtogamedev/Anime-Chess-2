/// @description State Check
if (global.select_state == selectState.idle and mouse_check_button_pressed(mb_left) 
	and not place_meeting(mouse_x, mouse_y, obj_actionSelection_button)){
		
	if (instance_exists(global.selectedUnit)){
	global.select_state = selectState.deselect
	global.selectedUnit.currentAction = action.reset
	}
}
if (global.select_state == selectState.idle){
	select_activate_cooldown();
}

