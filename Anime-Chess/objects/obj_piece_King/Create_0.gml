/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hasActionSequence = false
currentAction = action.idle
chainActionSequence = [action.move, action.attack, action.move]

actionLimit = 1;//the max action that this piece can take in one turn
actionCount = 0;//counts actions taken in one turn


movementRestrictionFunction = function(){
	return tile_get_restriction(carrier.coordinate, tileRestriction.surrounding)
}

