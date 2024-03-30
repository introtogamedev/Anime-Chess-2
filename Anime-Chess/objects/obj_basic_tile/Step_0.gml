if (selected){
	display = tileDisplay.selected;
}else if (display = tileDisplay.selected and selected == false){
	display = tileDisplay.original;
}

switch(display){
	case(tileDisplay.original):
		sprite_index = spr_basic_tile;
		break;
	case(tileDisplay.selected):
		sprite_index = spr_basic_tile_2;
		break;
	case(tileDisplay.highlight):
		sprite_index = spr_basic_tile_1;
		break;
	default:
		sprite_index = spr_basic_tile
		break;
}