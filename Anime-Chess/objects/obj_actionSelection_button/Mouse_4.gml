if (mouse_x < x + sprite_width/2 && mouse_x > x - sprite_width/2 &&
	mouse_y < y + sprite_height/2 && mouse_y > y - sprite_height/2){
	
	associate.currentAction = action_representation;
	
	for (var i = 0; i < array_length(buttonGroup); i ++){
		instance_destroy(buttonGroup[i]);
	}
}