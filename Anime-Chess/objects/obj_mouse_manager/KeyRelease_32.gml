if (mouse_check_outOfBounds() == false){
	var instance = instance_place(mouse_x, mouse_y, obj_basic_tile);
	if (selectedTile == noone){
		instance.selected = true;
		selectedTile = instance;
		show_debug_message("Tile Selected: {0}", selectedTile);
	}else if (instance != selectedTile){
		instance.selected = true;
		selectedTile.selected = false;
		selectedTile = instance;
		show_debug_message("Changed Selected Tile to {0}", selectedTile);
	}else{
		show_debug_message("Unselected Tile: {0}", selectedTile);
		selectedTile.selected = false;
		selectedTile = noone;
		
	}
}