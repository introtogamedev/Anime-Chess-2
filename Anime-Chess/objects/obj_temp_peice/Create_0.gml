enum action{
	idle,
	selectAction,
	move,
	attack,
	special,
	reset
}
currentAction = action.idle
plannedAction = action.idle

movementRestriction = []
attackRestriction = []

buttongroup = new buttonGroup(self);
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton, action.move));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton1, action.attack));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.special));
	 

initiateAction = function (_action){
	switch(_action){
		case(action.selectAction):
			buttongroup.createButtonObjects();//initiate action selection
			break;
		case(action.move):
			global.select_state = selectState.tilesSelect
			movementRestriction = array_union(tile_get_restriction(carrier.coordinate, tileRestriction.X),
												tile_get_restriction(carrier.coordinate, tileRestriction.Y),
												tile_get_restriction(carrier.coordinate, tileRestriction.Z));
			highlight_tiles(movementRestriction);
			break;
		case(action.attack):	
			global.select_state = selectState.tilesSelect
			attackRestriction = tile_get_restriction(carrier.coordinate, tileRestriction.surrounding)
			highlight_tiles(attackRestriction);
		break;
	
	}
	currentAction = _action
}