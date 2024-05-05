if (global.selectedUnit == obj_piece_king or global.selectedUnit == noone){
	visible = true
}else{
	visible = false;
}

if (visible != update_trigger){
	for (var i = 0; i < array_length(buttonArray); i ++){
		buttonArray[i].visible = visible;
	}
	if (visible){
		instance_activate_object(obj_createPiece_button);
	}else{
		instance_deactivate_object(obj_createPiece_button);
		global.createUnitType = noone;//temporary
	}
	update_trigger = visible;
}
