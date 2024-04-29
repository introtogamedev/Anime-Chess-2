global.createUnitType = obj_piece_pufferfish;//temporary
exclude_IDs = [0, 2]

create_selection_screen = function (width, height){
	var button_distance_offset = 20;
	var icon_sprite_width = 90
	var icon_sprite_height = 90
	var placementx = x + icon_sprite_width/2;
	var placementy = y + icon_sprite_height/2;;
	
	var excludeIndex = 0;
	for(var i = 0; i < array_length(global.unitInformation); i ++){
		if (excludeIndex < array_length(exclude_IDs) and i == exclude_IDs[excludeIndex]){
			excludeIndex++;
			continue;	
		}
		var information = global.unitInformation[i]
		if (asset_get_index(information.object) <= -1){
			continue;
		}
		var variableAssignment = {
			pieceAssignment: asset_get_index(information.object),
			pieceInformation : information
		}
		var instance = instance_create_depth(x, y, layer-1, obj_createPiece_button,variableAssignment);
				
		instance.x = placementx;
		instance.y = placementy;
		
		if (placementx + icon_sprite_width + button_distance_offset> x + width){
			placementy += icon_sprite_height + button_distance_offset;
			placementx = x +icon_sprite_width/2;
		}else{
			placementx += icon_sprite_width + button_distance_offset;
		}
		
	}
}

create_selection_screen(sprite_width, sprite_height);

max_energy = 1;
energy_x = 1000;
units_x = 1000;
selection = false;