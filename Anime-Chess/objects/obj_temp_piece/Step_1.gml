///@description State Detect/Update
if (hp <= 0){
	instance_destroy(self);
}
//reset the state if the unit is not selected/deselected
if(global.selectedUnit == self and carrier.selected == false){
	currentAction = action.reset;
}
