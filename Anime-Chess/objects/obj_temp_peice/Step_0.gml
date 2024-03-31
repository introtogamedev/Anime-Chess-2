//reset the state if the unit is not selected/deselected
if(global.selectedUnit == self and carrier.selected == false){
	currentAction = action.reset;
}

switch(plannedAction){
	case(action.selectAction):
		buttongroup.createButtonObjects();//initiate action selection
		break;
	case(action.move):
		global.select_state = selectState.tilesSelect
		movementRestriction = array_union(tile_get_restriction(carrier.coordinate, tileRestriction.X),
											tile_get_restriction(carrier.coordinate, tileRestriction.Y),
											tile_get_restriction(carrier.coordinate, tileRestriction.Z));
		//movementRestriction = tile_get_surrounding(carrier.coordinate);
		highlight_possible_movement(movementRestriction);
		break;
	case(action.attack):	
	
	break;
	
}

currentAction = plannedAction;



switch(currentAction){
	case action.idle:
		if(global.selectedUnit == noone and global.selectedTile = carrier){
			global.selectedUnit = self;
			plannedAction = action.selectAction;
		}
		return;
	case action.selectAction:
		//terminate the rest of the step function. Do nothing
		return;		
	case action.move:
		if (instance_exists(global.selectedTiles[|0])){
			move_peice_to(self, global.selectedTiles[|0].coordinate, movementRestriction);
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