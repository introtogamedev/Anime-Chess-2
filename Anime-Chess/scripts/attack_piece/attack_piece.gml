function attack_pieces(attacker, tilesPos, damage, attackRestriction, defIgnore = false, attackAlly = false){
    if (not instance_exists(obj_tile_manager)){
		return;
	}
	var grid = obj_tile_manager.grid;
	var attacked = false;
	for (var i = 0; i < array_length(tilesPos); i ++){
		var foundPiece = false;
		for (var j = 0 ; j < array_length(attackRestriction); j ++){
			if (foundPiece){
				continue;
			}else{
				//if (DEBUG_MODE_ACTION){show_debug_message("Matching:" + string(tilesPos[i]) + "" + string(attackRestriction[j].coordinate));}
				if (tilesPos[i] == attackRestriction[j].coordinate){
					foundPiece = true;
					var attackedTile = grid[tilesPos[i][0], tilesPos[i][1]];
					var attackedPiece = get_tile_carry(tilesPos[i]);
					if (instance_exists(attackedPiece)){
						if (attackAlly or attackedPiece.teamAssignment != attacker.teamAssignment){
							if (DEBUG_MODE_ACTION){show_debug_message("Attacked Piece: {0}, Attacker: {1}, defIgnored: {2}", attackedPiece.name, attacker.name, defIgnore);}
							attackedPiece.takeDamage(damage, defIgnore);
							var attack_anim = instance_create_layer(attackedPiece.x, attackedPiece.y, "Buttons", obj_landing_animation);
							attack_anim.sprite_index = spr_temp_attack_animation;
							attacked = true;
						}else{
							if (DEBUG_MODE_ACTION){show_debug_message("Piece Found! Not attacked because Piece is ally!");}
						}
					}else{
						if (DEBUG_MODE_ACTION){show_debug_message("Piece at {0} not found!", tilesPos[i]);}
					}
				}
			}
		}
	}
	return attacked;
}
