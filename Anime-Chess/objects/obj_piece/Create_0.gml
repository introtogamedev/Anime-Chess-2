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
carrier.selected = false;//when created, deselect the current tile. 


activated = false;
//when created, default to already taken its action. 
currentAction = action.actionExecuted

atk = startingATK;
def = startingDEF; 
hp = maxHealth;

isSubUnit = false
moveOverride = false;
attackOverride = false;
//saved for consistancy when randomized. 
movementRestriction = [];//temporary
attackRestriction = []; //temporary

hasActionSequence = true;
chainActionSequence = [action.move, action.attack]
currentChainActionSequencePosition = 0;

actionLimit = 1;//the max action that this piece can take in one turn
actionCount = actionLimit;//counts actions taken in one turn

initiateAction = function (_action){
	switch(_action){
		case(action.selectAction):
			var availibleActions = [];
			if (actionCount < actionLimit-1 or hasActionSequence == false){
				availibleActions = array_unique(chainActionSequence);
			}else{
				availibleActions = [chainActionSequence[currentChainActionSequencePosition]];
			}
			//array_push(availibleActions, action.reset);//reset is always avaible
			createButtonObjects(availibleActions);//initiate action selection
			global.select_state = selectState.idle;
			break;
		case(action.move):
			global.select_state = selectState.tilesSelect
			movementRestriction = movementRestrictionFunction();
			if (not moveOverride){
				highlight_tiles(movementRestriction);
				global.selectRestriction = movementRestriction;
			}
			break;
		case(action.attack):	
			global.select_state = selectState.tilesSelect
			attackRestriction = attackRestrictionFunction();
			highlight_tiles(attackRestriction);
			global.selectRestriction = attackRestriction;
			break;
		case (action.actionExecuted):
			global.select_state = selectState.deselect;
			if(hasActionSequence){
				var withinActionSequence = false
				if(currentChainActionSequencePosition == 0){
					if (currentAction== chainActionSequence[0]){
						withinActionSequence = true
						currentChainActionSequencePosition ++;
					}else{
						for (var i = 0; i < array_length(chainActionSequence); i ++){
							if (currentAction == chainActionSequence[i]){
								withinActionSequence = true
								currentChainActionSequencePosition = i+1;
								break;
							}
						}
					}
				}else if (currentChainActionSequencePosition < array_length(chainActionSequence)){
					if (currentAction == chainActionSequence[currentChainActionSequencePosition]){
						currentChainActionSequencePosition++;
						withinActionSequence = true
						if (currentChainActionSequencePosition >= array_length(chainActionSequence)){
							actionCount++;
							currentChainActionSequencePosition = 0;
							withinActionSequence = false;
						}

					}else{
						actionCount ++;//concludes current action sequence. 
						currentChainActionSequencePosition = 0;
						for (var i = 0; i < array_length(chainActionSequence); i ++){
							if (currentAction == chainActionSequence[i]){
								currentChainActionSequencePosition = i+1;
								break;
							}
						}	
					}
				}
			
				if (not withinActionSequence){
					global.turnsystem.teams[global.turnsystem.currentTurn].actionCompleted();
				}else{
					deselect_all_tiles();
					global.selectedTile = select_tile(carrier.coordinate, global.selectedTile);
					global.selectedUnit = self;
					initiateAction(action.selectAction);
					return
				}
			}else{
				actionCount++;
				global.turnsystem.teams[global.turnsystem.currentTurn].actionCompleted();
			}
			
			//do nothing
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
		case action.reset:
			global.select_state = selectState.tileSelect;//temporary

		break;
	}
	currentAction = _action;
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

createButtonObjects = function(actions, h_offset = sprite_width, maxAngle = 180){
	var origin_x = x;
	var origin_y = y;
	
	var angle_offset = 0;
	var amount_of_buttons = array_length(actions);
	var angleDifference = maxAngle/amount_of_buttons;
	
	if (amount_of_buttons%2 == 0){//odd amount of buttons
		angle_offset = angleDifference/2;
	}else{//even amount of buttons
		//do nothing
	}
	for (var i = 0; i < amount_of_buttons; i ++){
		var angle_shift = (angleDifference * -i + floor(amount_of_buttons/2) * angleDifference - angle_offset);
		var _xx = origin_x + lengthdir_x(h_offset, angle_shift);
		var _yy = origin_y + lengthdir_y(h_offset, angle_shift);
		var buttonInstance= instance_create_layer(_xx, _yy, "Buttons", obj_actionSelection_button, {action_representation : actions[i]});
		buttonInstance.associate = self;
		if (DEBUG_MODE_CONSTRUCTOR){show_debug_message("CREATED BUTTON at {0} at angle {1}", [_xx, _yy], angle_shift);}
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

//landing animation
instance_create_layer(x, y, "Buttons", obj_landing_animation);


