if(global.selectedTile = carrier and global.selectedUnit == noone){
	global.selectedUnit = self;
	currentAction = action.selectAction;
		buttongroup.createButtonObjects();
		buttongroup.createButtonObjects();
}

else if(carrier.selected == false and global.selectedUnit == self){
	currentAction = action.reset
}

switch(currentAction){
	case action.idle:
		return;
	case action.selectAction:
		//currentAction = action.attack
	/*
		currentAction = action.move;//temporary
		global.select_state = selectState.tilesSelect
			movementRestriction = array_union(tile_get_restriction(carrier.coordinate, tileRestriction.X),
												tile_get_restriction(carrier.coordinate, tileRestriction.Y),
												tile_get_restriction(carrier.coordinate, tileRestriction.Z));
			//movementRestriction = tile_get_surrounding(carrier.coordinate);
			highlight_possible_movement(movementRestriction);
			*/
		break;
	case action.move:
		if (instance_exists(global.selectedTiles[|0])){
			move_peice_to(self, global.selectedTiles[|0].coordinate, movementRestriction);
		}
		break;
	case action.reset:
		global.select_state = selectState.deselect;
		currentAction = action.idle;
		break;
	default: 
		
		break;
}