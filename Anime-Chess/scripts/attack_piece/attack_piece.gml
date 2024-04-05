function attack_pieces(attacker, tilesPos, damage, attackRestriction){
    if (not instance_exists(obj_tile_manager)){
		return;
	}
	var grid = obj_tile_manager.grid;
	for (var i = 0; i < array_length(tilesPos); i ++){
		for (var j = 0 ; j < array_length(attackRestriction); j ++){
			if (tilesPos[i] == attackRestriction[j]){
				var attackedTile = grid[tilesPos[i][0], tilesPos[i][1]]
				var attackedPiece = get_tile_carry(tilesPos[i]);
				
			}
		}
	}
}
