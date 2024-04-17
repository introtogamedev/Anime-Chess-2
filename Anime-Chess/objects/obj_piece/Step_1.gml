///@description State Detect/Update
if (hp <= 0){
	show_debug_message("gogo");
	initiateAction(action.death);
}

if(global.turnsystem.currentTurn != teamAssignment){
	currentAction = action.deactivated;
	return;
}
//reset the state if the unit is not selected/deselected
if(global.selectedUnit == self and carrier.selected == false){
	currentAction = action.reset;
	show_debug_message("ee");
}