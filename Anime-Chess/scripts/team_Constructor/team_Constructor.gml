function team(_teamAssignment) constructor{
	maxAllowedActions =  10;
	currentActions = 0;
	
	maxEnergyCap = 5;
	maxEnergy = 0;
	currentEnergy = 0;

	createdPiecesLimit = 5;
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
	
	increaseMaxEnergy = function(){
		if (maxEnergy < maxEnergyCap){
			maxEnergy ++;
			if (DEBUG_MODE_TURN){show_debug_message("Increased Max Energy to {0}", maxEnergy);}
		}
	}
	
	reset = function(){
		currentActions = 0;
		currentEnergy = maxEnergy;
	}
	
	create_piece = function (piece = global.createUnitType, SubUnit = false, position = [], restricted = true){
		#region Creation Checks
		if (createdPieces >= createdPiecesLimit){
			if (DEBUG_MODE_ACTION){ show_debug_message("Unable to created piece because exceeds creation limit");}
			return;
		}
		if (piece == 0){
			return	
		}
		var object = asset_get_index(piece.object)
		if (piece == 0 or object == -1){
			if (DEBUG_MODE_CARRY){show_debug_message("Piece creation Terminated because object type is empty! {0}", piece.name);}
			return;
		}else if (object_get_parent(object) = obj_piece or object == -100){
			if (DEBUG_MODE_CARRY){show_debug_message("Valid Piece Creation: {0}. Continuing....", piece.name);}
		}else{
			if (DEBUG_MODE_CARRY){show_debug_message("Piece creation Terminated because object type not piece! {0}", piece.name);}
			return;
		}

		if (array_length(position) == 0){
			if (mouse_check_outOfBounds()){
				if (DEBUG_MODE_CARRY){show_debug_message("Mouse out of bounds! unable to create piece at location!");}
				return;
			}else{
				position = global.mouse_coordinate;
				if (DEBUG_MODE_CARRY){show_debug_message("Attempting to create piece at default position: {0}....", position);}
			}
		}else{
			if (DEBUG_MODE_CARRY){show_debug_message("Attempting to create piece at indicated position: {0}....", position);}
		}	
		
		//PUT RESTRICTION CODE HERE. ------------------------------------------------------------------------------------------
		if (get_tile_carry(position) == noone){
			
			var variableAssignment = {
				teamAssignment : global.turnsystem.currentTurn,
				isSubUnit: SubUnit
			}
			if (object == obj_piece_king){
				var carry = instance_create_layer(0, 0, "Pieces", object, variableAssignment);
				set_tile_carry(position, carry);
			
			}

			if (check_legal_landing(position, piece)){
				var cost = piece.cost
				if (cost > currentEnergy){
					if (DEBUG_MODE_ACTION){ show_debug_message("Unable to created piece because exceeds current energy");}
					return;
				}
				
				var carry = instance_create_layer(0, 0, "Pieces", object, variableAssignment);
				set_tile_carry(position, carry);
			
				//landing animation
				var landing = instance_create_layer(0, 1, "Buttons", obj_landing_animation, variableAssignment);
				set_landing_animation(position, landing);
				actionCompleted();
				if (not SubUnit){
					createdPieces ++;
				}
				currentEnergy -= piece.cost;
				global.createUnitType = 0;
				if (DEBUG_MODE_CARRY or DEBUG_MODE_ACTION){
					show_debug_message("Piece {0} created at position: {1}", carry.name, position);
				}
			}
		}else{
			//ERROR MESSAGE
			if (DEBUG_MODE_CARRY){show_debug_message_ext(
				"Tile at {0} failed initiate carry because it is carrying {1}", 
				[global.mouse_coordinate, get_tile_carry(global.mouse_coordinate)]
			);}
		}
	}

	//returns the piece number. This includes all pieces created which called this function. 
	pieceName = function (){
	    static teamNames = 0;
		return teamNames ++;
	}
}

