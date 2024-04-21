/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

setActionLimit(1, false);
chainActionSequence = [action.move];
hasActionSequence = false;

attackRestrictionFunction = function(position){
	return tile_get_restriction(position, tileRestriction.surrounding)
}

moveOverride = true;
	 
movementRestrictionFunction = function(){
	if (instance_exists(obj_tile_manager)){
		var grid = obj_tile_manager.grid;
		
		while (true){
			var x_cor_offset = floor( (VERTICAL_GRID_HEIGHT -1)/2);
		
			var ranH = irandom_range(0, VERTICAL_GRID_HEIGHT-1);
				var x_coordinate = -1 * floor(ranH/2);
				var y_coordinate = ceil(ranH/2);
			
			var ranI = irandom_range(0, HORIZONTAL_GRID_LENGTH-1);
				x_coordinate += x_cor_offset + ranI;
				y_coordinate += ranI;
			if (get_tile_carry([x_coordinate, y_coordinate]) == noone){
				attackFunction([x_coordinate, y_coordinate], false);
				return [x_coordinate, y_coordinate]
			}
		}
	}
}

attackFunction = function(moved_destination, ignoreDef){
	var attackRestriction = attackRestrictionFunction(moved_destination);
	var currentPos = carrier.coordinate;
	var attackTilesPos = [];
	for(var i = 0; i < array_length(attackRestriction); i ++ ){
		if (attackRestriction[i].coordinate != currentPos){
			if (get_tile_carry(attackRestriction[i].coordinate) != noone and 
				get_tile_carry(attackRestriction[i].coordinate).object_index != obj_piece_Pufferfish){
				
				array_push(attackTilesPos, attackRestriction[i].coordinate);
			}
		}
	}
	var selection = attackTilesPos;
	var attackResult = attack_pieces(self, selection, atk, attackRestriction, ignoreDef, true);
}
onDeathFunction = function(){
	if (DEBUG_MODE_ACTION){ show_debug_message("TRIGGERED ON DEATH of {0} ", self.name);}
	attackFunction(carrier.coordinate, true);
}