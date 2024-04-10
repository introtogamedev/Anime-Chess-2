if (selected and display != tileDisplay.selected){
	savedDisplay = display;
	display = tileDisplay.selected	
}else if (not selected and display == tileDisplay.selected){
	display = savedDisplay;	
}


switch(display){
	case(tileDisplay.original):
		sprite_index = spr_basic_tile;
		break;
	case(tileDisplay.selected):
		sprite_index = spr_basic_tile_2;
		break;
	case(tileDisplay.highlight_moveable):
		sprite_index = spr_basic_tile_1;
		break;
	case(tileDisplay.highlight_nonmovable):
		sprite_index = spr_basic_tile_3;
		break;
	default:
		sprite_index = spr_basic_tile
		break;
}