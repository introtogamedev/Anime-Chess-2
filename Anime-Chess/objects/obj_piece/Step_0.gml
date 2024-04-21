///@description Action Execution
if (global.select_state == selectState.idle){
	return;
}

if (activated == false && actionCount < 1 && global.turnsystem.currentTurn == teamAssignment){
	var rand_x = irandom_range(-10, 10);
	var rand_y = irandom_range(-10, 10);
	x = image_x + rand_x;
	y = image_y + rand_y;
}

switch(currentAction){
	case action.deactivated:
		// do nothing. Wait until updated to another state
		image_index = 2;
		if (global.turnsystem.currentTurn == teamAssignment){
			currentAction = action.idle;
			actionCount = 0;
			image_index = 0;
			currentChainActionSequencePosition = 0;
		}
	return;
	case action.idle:
		if(global.selectedUnit == noone and global.selectedTile = carrier){
			global.selectedUnit = self;
			initiateAction(action.selectAction);
			image_index = 1;
		}
		return;
	case action.selectAction:
		//terminate the rest of the step function. Do nothing
		//wait for action to be selected
		
		return;		
	case action.move:
		if (instance_exists(global.selectedTiles[|0]) or moveOverride){
			var moveResult = false;
			if (moveOverride){
				 moveResult = move_piece_to(self,movementRestriction);

			}else{
				moveResult = move_piece_to(self, global.selectedTiles[|0].coordinate, movementRestriction);
			}
			
			if (moveResult == true){
				initiateAction(action.actionExecuted)
			}else{
				currentAction = action.reset;
			}
		}
		break;
	
	case action.attack:
		if (instance_exists(global.selectedTiles[|attackSelectableTargets-1]) or attackOverride){
			var attackTilesPos = [] 
			if(not attackOverride){
				for(var i = 0; i < attackSelectableTargets; i ++ ){
					attackTilesPos[i] = global.selectedTiles[|i].coordinate;
				}
			}
			var attackResult = attackFunction(attackTilesPos);
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
		image_index = 0;
		break;
	case (action.actionExecuted):
		//if actions not at limit, continue actions. 
		if (actionCount < actionLimit){
			currentAction = action.idle
			image_index = 0;
		}else{
			image_index = 2;
		}
		break;
	default: 
		//do nothing
		break;
}