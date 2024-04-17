global.createUnitType = obj_piece_Pufferfish;//temporary
unitArray = [
	[obj_piece_Pufferfish, spr_cost_1], 
	[obj_piece_test_bunny, spr_cost_2], 
	[obj_piece_Pawn, spr_cost_2],
	[obj_piece_Infantry, spr_cost_3]
	];
		
create_selection_screen = function (width, height){
	var button_distance_offset = 20;
	var placementx = x; 
	var placementy = y;
	
	for(var i = 0; i < array_length(unitArray); i ++){
		var instance = instance_create_layer(x, y, "Buttons", obj_createPiece_button, {pieceAssignment: unitArray[i][0]});
		if (i == 0 ){
			placementx += instance.sprite_width/2;
			placementy += instance.sprite_height/2;

		}else{
			if (placementx + instance.sprite_width + button_distance_offset> x + width){
				placementy += instance.sprite_height + button_distance_offset;
				placementx = x + instance.sprite_width/2;
			}else{
				placementx += instance.sprite_width + button_distance_offset;
			}
		}
		
		instance.x = placementx;
		instance.y = placementy;
		var cost_icon = layer_sprite_create("cost_sprites", placementx + 40, placementy + 40, unitArray[i][1]);
		//show_debug_message([placementx, placementy])
		
	}
}

create_selection_screen(sprite_width, sprite_height);
show_debug_message([sprite_width, sprite_height])