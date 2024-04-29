///@description State Detect/Update
if (hp <= 0){
	initiateAction(action.death);
}

if(global.turnsystem.currentTurn != teamAssignment){
	currentAction = action.deactivated;
	return;
}
