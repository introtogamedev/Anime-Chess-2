enum action{
	idle,
	selectAction,
	move,
	attack,
	special,
	reset
}
name = "";
	name += pieceName(real(teamAssignment));

currentAction = action.idle
plannedAction = action.idle

movementRestrictionFunction = function(){
	return tile_get_restriction(carrier.coordinate, tileRestriction.XYZ)
}


attackRestrictionFunction = function(){
	 return tile_get_restriction(carrier.coordinate, tileRestriction.surrounding)
}
attackSelectableTargets = 1;

buttongroup = new buttonGroup(self);
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton, action.move));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton1, action.attack));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.special));
	 
atk = 10;
def = 10; 
hp = 10;


initiateAction = function (_action){
	switch(_action){
		case(action.selectAction):
			buttongroup.createButtonObjects();//initiate action selection
			break;
		case(action.move):
			global.select_state = selectState.tilesSelect
			var movementRestriction = movementRestrictionFunction();
			highlight_tiles(movementRestriction);
			global.selectRestriction = movementRestriction;
			break;
		case(action.attack):	
			global.select_state = selectState.tilesSelect
			var attackRestriction = attackRestrictionFunction();
			highlight_tiles(attackRestriction);
			global.selectRestriction = attackRestriction;
			break;
	}
	currentAction = _action
}

executeAttackFunction = function (selection){
	var attackRestriction = attackRestrictionFunction();
	attack_pieces(self, selection, atk * 100, attackRestriction);
}
