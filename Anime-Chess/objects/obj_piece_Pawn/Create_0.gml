/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
chainActionSequence = [action.move, action.attack]
movementRestrictionFunction = function(){
	return tile_get_restriction(carrier.coordinate, tileRestriction.horse);
}

attackFunction = function (selection){
	for (var i = 0; i < array_length(selection); i ++){
		if (instance_exists(get_tile_carry(selection[i]))){
			if (get_tile_carry(selection[i]).object_index == obj_piece_King){
				instance_destroy(get_tile_carry(selection[i]))
			break;
			}
		}
	}
	var attackRestriction = attackRestrictionFunction();
	var attackResult = attack_pieces(self, selection, atk, attackRestriction, true);
	return attackResult;
}