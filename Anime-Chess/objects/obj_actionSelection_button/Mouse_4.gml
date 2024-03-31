if (mouse_x < x + sprite_width/2 && mouse_x > x - sprite_width/2 &&
	mouse_y < y + sprite_height/2 && mouse_y > y - sprite_height/2){
	
	associate.initiateAction(action_representation);
	
	if (DEBUG_MODE_SELECT){show_debug_message("Selected action :{0} from {1}", action_representation, self);}
	
	associate.buttongroup.clearButtonGroupDisplay();
}