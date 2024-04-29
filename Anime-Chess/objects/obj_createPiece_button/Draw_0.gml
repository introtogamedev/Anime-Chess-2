//var linked_piece = asset_get_index(pieceInformation.object);
//if (linked_piece >-1){
	var turnSpriteIndex = global.turnsystem.currentTurn;
	var turnSprite = asset_get_index(pieceInformation.sprites[turnSpriteIndex]);
	if (turnSprite > -1){
		sprite_index = turnSprite;
	}
	
	draw_sprite(sprite_index, image_index, x, y);
	image_speed = 0;

	draw_sprite(spr_costs, pieceInformation.cost -1, x + sprite_width/2, y)
//}

