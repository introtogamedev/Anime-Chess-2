///@description Select
if (not activated){
	return;	
}
switch (global.select_state){
	case(selectState.idle):

		break;
	case(selectState.tileSelect):
		if (mouse_check_outOfBounds() == false){
			global.selectedTile = select_tile(global.mouse_coordinate, global.selectedTile)
		}
		break;
	case (selectState.tilesSelect):
		if (mouse_check_outOfBounds() == false){
			global.selectedTiles = addTile_ToList(global.selectedTiles,global.mouse_coordinate, global.selectRestriction)
		}
		break;
	default:
		//do nothing. 
	break;
}
select_activate_cooldown();

