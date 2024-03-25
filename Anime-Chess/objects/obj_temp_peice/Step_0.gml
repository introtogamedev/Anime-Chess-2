if(carrier.selected and global.selectedUnit == noone){
	global.selectedUnit = self;
	sprite_index = spr_temp_peice1;
	currentAction = action.selectAction;
}
switch(currentAction){
	case action.idle:
		return;
	case action.selectAction:
		currentAction = action.move;//temporary
	break;
	default: 
		
	break;
}

if (currentAction = action.move){
	if (global.selectedTile != carrier){
		var moveTo = global.selectedTile.coordinate;
		var moveFrom = carrier.coordinate;
		set_tile_carry(moveFrom, noone);
		set_tile_carry(moveTo, self);	
		
		global.selectedTile = noone;
		currentAction = action.idle;
	}
}


else if (carrier.selected == false and global.selectedUnit == self){
	
	
	global.selectedUnit = noone;//reset the selected unit if the tile is unselcted	
	sprite_index = spr_temp_peice;
}