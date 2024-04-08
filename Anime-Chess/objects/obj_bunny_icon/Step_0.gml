if (mouse_check_button_pressed(mb_left) && mouse_x > x - sprite_width/2 && mouse_y > y - sprite_height/2
	&& mouse_x < x + sprite_width/2 && mouse_y < y + sprite_height/2){
	global.selectedUnitType = obj_piece_test_bunny;
}