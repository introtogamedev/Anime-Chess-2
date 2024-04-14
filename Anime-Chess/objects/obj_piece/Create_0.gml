enum action{
	deactivated,
	idle,
	selectAction,
	move,
	attack,
	special,
	reset,
	actionExecuted,
	death
} 
name = "";
	var teamName = global.turnsystem.teams[teamAssignment].pieceName();
	name += "[" + string(string(teamAssignment) + "| " + object_get_name(object_index)) +"| "+ string(teamName) + "]";

sprite_index = sprite_team[teamAssignment];
image_speed = 0;//temorary

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

isSubUnit = false
moveOverride = false;

carrier.selected = false;

initiateAction = function (_action){
	switch(_action){
		case(action.selectAction):
			buttongroup.createButtonObjects();//initiate action selection
			global.select_state = selectState.idle;
			break;
		case(action.move):
			global.select_state = selectState.tilesSelect
			if (not moveOverride){
				var movementRestriction = movementRestrictionFunction();
				highlight_tiles(movementRestriction);
				global.selectRestriction = movementRestriction;
			}
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
			deselect_unit();
			//do nothing
			break;
		case action.reset:
			global.select_state = selectState.deselect;
			currentAction = action.idle;
			break;
		case (action.death):
			global.select_state = selectState.deselect;
			set_tile_carry(carrier.coordinate, noone);
			if (isSubUnit == false){
				global.turnsystem.teams[teamAssignment].createdPieces --;
			}
			onDeathFunction();
			instance_destroy(self);
			break;
	}
	currentAction = _action
}

setActionLimit = function(number,setMin = true){
	var difference =  number - actionLimit
	actionLimit = number;	
	
	if ( setMin and difference < 0){
		actionCount += difference;
	}else if (setMin == false){
		actionCount = actionLimit;
	}
}

//OPTIONAL OVERRIDE
takeDamage = function (damage, defIgnored){
	if (defIgnored){
		hp -= damage;
	}else{
		hp -= (damage-def);
	}
}

//OVERRIDE
attackFunction = function (selection){
	var attackRestriction = attackRestrictionFunction();
	var attackResult = attack_pieces(self, selection, atk, attackRestriction, false);
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
onDeathFunction = function (){
	//do nothing. 
}

