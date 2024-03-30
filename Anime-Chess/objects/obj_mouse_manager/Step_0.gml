switch(global.select_state){
	case (selectState.idle):
		global.select_state = selectState.tileSelect;//temprary
		break;
	case (selectState.tilesSelect):
		/*var places_to_go = tile_get_lines(global.selectedTile.coordinate);
		for(var h = 0; h <  array_length(places_to_go); h++){
			places_to_go[h].image_angle += 180;
		}*/
		break
	case (selectState.deselect):
		deslect_all_tiles();
		global.select_state++;
		break;

}

if (global.select_state >= selectState.deselect){
	global.select_state = selectState.idle;
}