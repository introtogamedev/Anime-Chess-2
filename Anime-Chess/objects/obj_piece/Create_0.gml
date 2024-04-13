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
	var teamName = global.turnsystem.teams[global.turnsystem.currentTurn].pieceName();
	name += string(object_get_name(object_index)) +" "+ string(teamName);

activated = false;
//when created, default to already taken its action. 
currentAction = action.actionExecuted

actionLimit = 1;//the max action that this piece can take in one turn
actionCount = actionLimit;//counts actions taken in one turn

buttongroup = new buttonGroup(self);
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton, action.move));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton1, action.attack));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.reset));

atk = startingATK;
def = startingDEF; 
hp = maxHealth;

carrier.selected = false;

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
			global.turnsystem.teams[global.turnsystem.currentTurn].actionCompleted();
			global.select_state = selectState.deselect;
			//do nothing
		break;
		case action.reset:
			global.select_state = selectState.deselect;
			currentAction = action.idle;
		break;
	}
	currentAction = _action
}

//OPTIONAL OVERRIDE
takeDamage = function (damage){
	hp -= damage;
}

//OVERRIDE
AttackFunction = function (selection){
	var attackRestriction = attackRestrictionFunction();
	var attackResult = attack_pieces(self, selection, atk, attackRestriction);
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

//OVERRIDE
sprite_index = sprite_team[teamAssignment];
image_speed = 0;//temorary
