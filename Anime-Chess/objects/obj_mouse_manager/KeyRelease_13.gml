global.select_state = selectState.deselect
if instance_exists(global.selectedUnit){
	global.selectedUnit.currentAction = action.reset;
}