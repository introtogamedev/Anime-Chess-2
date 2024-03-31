if (mouse_x < x + sprite_width/2 && mouse_x > x - sprite_width/2 &&
	mouse_y < y + sprite_height/2 && mouse_y > y - sprite_height/2){
	
	associate.plannedAction = action_representation;
	
	show_debug_message(action_representation);
	
	associate.buttongroup.clearButtonGroupDisplay();
}