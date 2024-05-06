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
atk = startingATK;
def = startingDEF; 
hp = startingHealth;

//LOAD JSON SCRIPT VALUES
if (ID < array_length(global.unitInformation)){
	if (global.unitInformation[ID].object == object_get_name(object_index)){
		var unitInfo = global.unitInformation[ID];
		cost = unitInfo.cost;
		startingHealth = unitInfo.startingHealth;
		startingATK = unitInfo.startingATK;
		startingDEF = unitInfo.startingDEF;
		for(var i = 0 ; i < array_length(unitInfo.sprites); i ++){
			var sprite = asset_get_index(unitInfo.sprites[i]);
			if (sprite > -1){
				sprite_team[i] = sprite;
			}else{
				if (DEBUG_MODE_FILELOADER){show_debug_message("ERROR LOADING SPRITE, USING DEFAULT");}
			}
		}
	}else{
		if (DEBUG_MODE_FILELOADER){show_debug_message("UNIT CREATION INFO MISMATCH! USING HARD-CODED IMPLEMENTATION INSTEAD!");}
	}
	
}

name = "";
	var teamName = global.turnsystem.teams[teamAssignment].pieceName();
	name += "[" + string(string(teamAssignment) + "| " + object_get_name(object_index)) +"| "+ string(teamName) + "]";

sprite_index = sprite_team[teamAssignment];
image_speed = 0;//temporary
carrier.selected = false;//when created, deselect the current tile. 

highlight_landing(false);//temporary

activated = false;
//when created, default to already taken its action. 
currentAction = action.actionExecuted

isSubUnit = false
moveOverride = false;
attackOverride = false;
//saved for consistancy when randomized. 
movementRestriction = [];//initialization
attackRestriction = []; //initialization

hasActionSequence = true;
chainActionSequence = [action.move, action.attack]
currentChainActionSequencePosition = 0;

actionLimit = 1;//the max action that this piece can take in one turn
actionCount = actionLimit;//counts actions taken in one turn

initiateAction = function (_action){
	switch(_action){
		case(action.selectAction):
		
			var availibleActions = array_unique(chainActionSequence);
			array_push(availibleActions, action.reset);//reset is always avaible
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
					return;
				}
			}else{
				actionCount++;
				global.turnsystem.teams[global.turnsystem.currentTurn].actionCompleted();
			}
			break;
		case (action.death):
			
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
	//override
	h_offset = 70
	
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
		var variableAssignment = {
			action_representation : actions[i],
			highlight : false,
			active : true,
		}
			if (currentChainActionSequencePosition != 0 and 
				currentChainActionSequencePosition < array_length(chainActionSequence) and 
				actions[i] == chainActionSequence[currentChainActionSequencePosition]){
				variableAssignment.highlight = true;
			}
			if (actionCount = actionLimit - 1){
				var actionseq = [];
				actionseq = chainActionSequence;
				for (var j = 0 ; j < array_length(actionseq); j ++){
					if (actionseq[j] == actions[i]){
						if (j < currentChainActionSequencePosition){
							variableAssignment.active = false;
						}else{
							variableAssignment.active = true;
						}
					}
				}
			}
		var buttonInstance= instance_create_layer(_xx, _yy, "Buttons", obj_actionSelection_button, variableAssignment);
		
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

