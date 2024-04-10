///@description Action Execution
if (global.select_state == selectState.idle){
	return;
}

switch(currentAction){
	case action.deactivated:
		// do nothing. Wait until updated to another state
		if (global.turnsystem.currentTurn == teamAssignment){
			currentAction = action.idle;
			actionCount = 0;
		}
	return;
	case action.idle:
		if(global.selectedUnit == noone and global.selectedTile = carrier){
			global.selectedUnit = self;
			initiateAction(action.selectAction);
		}
		return;
	case action.selectAction:
		//terminate the rest of the step function. Do nothing
		//wait for action to be selected
		return;		
	case action.move:
		if (instance_exists(global.selectedTiles[|0])){
			var movementRestriction = movementRestrictionFunction();
			var moveResult = move_piece_to(self, global.selectedTiles[|0].coordinate, movementRestriction);
			if (moveResult == true){
				initiateAction(action.actionExecuted)
			}else{
				currentAction = action.reset;
			}
		}
		break;
	
	case action.attack:
		if (instance_exists(global.selectedTiles[|attackSelectableTargets-1])){
			var attackTilesPos = [] 
			for(var i = 0; i < attackSelectableTargets; i ++ ){
				attackTilesPos[i] = global.selectedTiles[|i].coordinate;
			}
			var attackResult = AttackFunction(attackTilesPos);
			if(attackResult == true){
				initiateAction(action.actionExecuted)
			}else{
				currentAction = action.reset;
			}
		}

		break;
		
	case action.reset:
		global.select_state = selectState.deselect;
		currentAction = action.idle;
		break;
	case (action.actionExecuted):
		//if actions not at limit, continue actions. 
		if (actionCount < actionLimit){
			currentAction = action.idle
		}
		break;
	default: 
		//do nothing
		break;
}
