// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function team(_teamAssignment) constructor{
	maxAllowedActions =  10;
	currentActions = 0;
	
	maxEnergy = 10;
	currentEnergy = 0;

	createPiece_limit = 1;
	createdPieces = 0;
	
	actionCompleted = function(){
		currentActions ++;
		if (DEBUG_MODE_TURN){show_debug_message("Current Team Actions Taken:{0}", currentActions);}
	}
	
	canAct = function(){
		if (currentActions < maxAllowedActions){
			return true;
		}
		return false
	}
	
	reset = function(){
		currentActions = 0;
		createdPieces = 0;
		currentEnergy = 0;
	}
	
	function create_piece(piece = global.createUnitType, position = global.mouse_coordinate){
		if(not createdPieces < createPiece_limit and canAct()){
			if (DEBUG_MODE_ACTION){ show_debug_message("Unable to created piece becausae reached turn creation limit");}
			return;
		}
		if (object_get_parent(piece) = obj_piece or object_get_parent(piece) == -100){
			if (DEBUG_MODE_CARRY){show_debug_message("Valid Piece Creation: {0}. Continuing....", piece);}
		}else{
			if (DEBUG_MODE_CARRY){show_debug_message("Piece creation Terminated because object type not piece! {0}", piece);}
			return;
		}

		if (position == global.mouse_coordinate){
			if (mouse_check_outOfBounds()){
				if (DEBUG_MODE_CARRY){show_debug_message("Mouse out of bounds! unable to create piece at location!");}
				return;
			}else{
				if (DEBUG_MODE_CARRY){show_debug_message("Attempting to create piece at default position: {0}....", position);}
			}
		}else{
			if (DEBUG_MODE_CARRY){show_debug_message("Attempting to create piece at indicated position: {0}....", position);}
		}	

		if (get_tile_carry(position) == noone){
			var variableAssignment = {
				teamAssignment : global.turnsystem.currentTurn
			}
			var carry = instance_create_depth(0, 0, 0, global.createUnitType, variableAssignment);
			set_tile_carry(position, carry);
			actionCompleted();
			createdPieces ++;
		}else{
			//ERROR MESSAGE
			if (DEBUG_MODE_CARRY){show_debug_message_ext(
				"Tile at {0} failed initiate carry because it is carrying {1}", 
				[global.mouse_coordinate, get_tile_carry(global.mouse_coordinate)]
			);}
		}
	}

	
	function pieceName(){
	    static teamNames = 0;
		return teamNames ++;
	}
}


