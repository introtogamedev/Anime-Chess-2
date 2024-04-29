///@description State Detect/Update
if (hp <= 0){
	var spawnable_places = tile_get_restriction([image_x, image_y], tileRestriction.surrounding);
	for (var i = 0; i < array_length(spawnable_places); i++){
		var tilex = spawnable_places[i].x_coordinate;
		var tiley = spawnable_places[i].y_coordinate;
		global.turnsystem.teams[global.turnsystem.currentTurn].create_piece(obj_piece_pawn, [tilex, tiley]);
	}
	initiateAction(action.death);
}

if(global.turnsystem.currentTurn != teamAssignment){
	currentAction = action.deactivated;
	return;
}