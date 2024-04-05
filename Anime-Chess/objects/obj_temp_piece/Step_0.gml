//reset the state if the unit is not selected/deselected
if(global.selectedUnit == self and carrier.selected == false){
	currentAction = action.reset;
}

switch(currentAction){
	case action.idle:
		if(global.selectedUnit == noone and global.selectedTile = carrier){
			global.selectedUnit = self;
			initiateAction(action.selectAction);
		}
		return;
	case action.selectAction:
		//terminate the rest of the step function. Do nothing
		return;		
	case action.move:
		if (instance_exists(global.selectedTiles[|0])){
			move_piece_to(self, global.selectedTiles[|0].coordinate, movementRestriction);
		}
		break;
	
	case action.attack:
		if (instance_exists(global.selectedTiles[|attackSelectableTargets-1])){
			var attackTilesPos = [] 
			for(var i = 0; i < attackSelectableTargets; i ++ ){
				attackTilesPos[i] = global.selectedTiles[i].coordinate;
			}
					executeAttackFunction(attackTilesPos);
		}

		break;
		
	case action.reset:
		global.select_state = selectState.deselect;
		buttongroup.clearButtonGroupDisplay();
		currentAction = action.idle;
		break;
		
	default: 
		
		break;
}

plannedAction = currentAction;