/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


chainActionSequence = [action.move, action.attack]
movementRestrictionFunction = function(){
	return tile_get_restriction(carrier.coordinate, tileRestriction.XYZ);
}

attackFunction = function (selection){
	var attackRestriction = attackRestrictionFunction();
	var attackResult = attack_pieces(self, selection, atk, attackRestriction, true);
	return attackResult;
}

onDeathFunction = function(){
	if (DEBUG_MODE_ACTION){ show_debug_message("TRIGGERED ON DEATH of {0} ", self.name);}
	var onDeathAttackRestriction = tile_get_restriction(carrier.coordinate, tileRestriction.surrounding);
	for(var i = 0; i < array_length(onDeathAttackRestriction); i ++ ){
		if (get_tile_carry(onDeathAttackRestriction[i].coordinate) != noone){
			instance_destroy(get_tile_carry(onDeathAttackRestriction[i].coordinate));
		}
	}
}