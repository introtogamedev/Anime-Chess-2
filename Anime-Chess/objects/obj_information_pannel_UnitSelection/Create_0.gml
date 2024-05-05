global.createUnitType = noone;//temporary
exclude_IDs = [0, 2]

buttonArray = [];

update_trigger = false;

var width = sprite_width 
var height = sprite_height;
var border = 10;

var button_distance_offset = 11;
var icon_sprite_width = 84.25
var icon_sprite_height = 84.25
var placementx = x + icon_sprite_width/2 + border;
var placementy = y + icon_sprite_height/2 + border;

var excludeIndex = 0;
var buttonCount = 0; //stores how many buttons actually is displayed
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
		pieceInformation : information,
		size: [icon_sprite_width, icon_sprite_height]
	}
	
	var display_position_x = (buttonCount %3 )// gets the current position of 3
	placementx = x + border + display_position_x * (icon_sprite_width + button_distance_offset) + icon_sprite_width/2
	var display_position_y = floor(buttonCount /3) //rounded down
	placementy = y + border + display_position_y * (icon_sprite_height + button_distance_offset) + icon_sprite_height/2
	
	var instance = instance_create_depth(placementx, placementy, layer-1, obj_createPiece_button,variableAssignment);
	array_push(buttonArray, instance);//add the created button to the array
	
	buttonCount ++;
	/*OLD PLACEMENT CODE
	if (placementx + icon_sprite_width + button_distance_offset> x + width - border){
		placementy += icon_sprite_height + button_distance_offset;
		placementx = x +icon_sprite_width/2 + border;
	}else{
		placementx += icon_sprite_width + button_distance_offset;
	}
	*/
}



