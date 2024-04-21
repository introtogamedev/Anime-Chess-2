if (end_turn_button._turn == 0){
	if (x < room_width){
		x += 50;
	} else {
		instance_destroy();
	}
}

if (end_turn_button._turn == 1){
	if (x + sprite_width > 0){
		x -= 50;
	} else {
		instance_destroy();
	}
}