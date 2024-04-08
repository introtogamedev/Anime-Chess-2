function attack_pieces(attacker, tilesPos, damage, attackRestriction){
    if (not instance_exists(obj_tile_manager)){
		return;
	}
	var grid = obj_tile_manager.grid;
	for (var i = 0; i < array_length(tilesPos); i ++){
		var foundPiece = false;
		for (var j = 0 ; j < array_length(attackRestriction); j ++){
			if (foundPiece){
				continue;
			}else{
				if (DEBUG_MODE_ACTION){show_debug_message("Matching:" + string(tilesPos[i]) + "" + string(attackRestriction[j].coordinate));}
				if (tilesPos[i] == attackRestriction[j].coordinate){
					foundPiece = true;
					var attackedTile = grid[tilesPos[i][0], tilesPos[i][1]];
					var attackedPiece = get_tile_carry(tilesPos[i]);
					if (instance_exists(attackedPiece)){
						if (attackedPiece.teamAssignment != attacker.teamAssignment){
							if (DEBUG_MODE_ACTION){show_debug_message("Piece Found! Attack!");}
							attackedPiece.takeDamage(damage);
							return true
						}else{
							if (DEBUG_MODE_ACTION){show_debug_message("Piece Found! Not attacked because Piece is ally!");}
							return false;
						}
					}else{
						if (DEBUG_MODE_ACTION){show_debug_message("Piece at {0} not found!", tilesPos[i]);}
						return false
					}
				}
			}
		}
	}
}
