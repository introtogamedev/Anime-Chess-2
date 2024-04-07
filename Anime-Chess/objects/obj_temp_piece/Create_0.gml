enum action{
	deactivated,
	idle,
	selectAction,
	move,
	attack,
	special,
	reset,
	actionExecuted
}
name = "";
	name += string(type) +" "+ pieceName(real(teamAssignment));

activated = false;

currentAction = action.idle

actionCount = 0;//counts actions taken in one turn
actionLimit = 1;//the max action that this piece can take in one turn

buttongroup = new buttonGroup(self);
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton, action.move));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton1, action.attack));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.reset));
	 
atk = 10;
def = 10; 
hp = maxHealth;

//global.turnsystem.addPieceToTeam(self, teamAssignment)

initiateAction = function (_action){
	switch(_action){
		case(action.selectAction):
			buttongroup.createButtonObjects();//initiate action selection
			global.select_state = selectState.idle;
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
		case (action.actionExecuted):
			actionCount++;
			reset();
			//do nothing
		break;
	}
	currentAction = _action
	show_debug_message(self)
}

reset = function (){
	global.select_state = selectState.deselect;
	//buttongroup.clearButtonGroupDisplay();
}

//OPTIONAL OVERRIDE
takeDamage = function (damage){
	hp -= damage;
}

//OVERRIDE
AttackFunction = function (selection){
	var attackRestriction = attackRestrictionFunction();
	var attackResult = attack_pieces(self, selection, atk * 0.7, attackRestriction);
	return attackResult;
}

//OVERRIDE 
movementRestrictionFunction = function(){
	return tile_get_restriction(carrier.coordinate, tileRestriction.XYZ)
}

//OVERRIDE
attackRestrictionFunction = function(){
	 return tile_get_restriction(carrier.coordinate, tileRestriction.surrounding)
}
//OVERRIDE
attackSelectableTargets = 1;