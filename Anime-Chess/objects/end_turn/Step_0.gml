if (mouse_check_button_pressed(mb_left) && mouse_x > x && mouse_y > y
	&& mouse_x < x + sprite_width && mouse_y < y + sprite_height){
	obj_turn_manager.turn_next();
}