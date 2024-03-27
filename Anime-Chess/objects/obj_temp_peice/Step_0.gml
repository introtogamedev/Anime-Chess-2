if(global.selectedTile = carrier and global.selectedUnit == noone){
	global.selectedUnit = self;
	currentAction = action.selectAction;
}

switch(currentAction){
	case action.idle:
		return;
	case action.selectAction:
		global.select_state = selectState.tilesSelect
		currentAction = action.move;//temporary
		break;
	case action.move:
		if (instance_exists(global.selectedTiles[|0])){
			move_peice_to(self, global.selectedTiles[|0].coordinate);
		}
	default: 
		
		break;
}
/*
if (currentAction = action.move){
	if (global.selectedTile != carrier){
		var moveTo = global.selectedTile.coordinate;
		var moveFrom = carrier.coordinate;
		carrier.selected = false;
		set_tile_carry(moveFrom, noone);
		set_tile_carry(moveTo, self);	
		carrier.selected = false;
		global.selectedTile = noone;
		global.selectedUnit = noone;
		currentAction = action.idle;
	}
}


else if (carrier.selected == false and global.selectedUnit == self){
	
	global.selectedUnit = noone;//reset the selected unit if the tile is unselcted	
	sprite_index = spr_temp_peice;
}