currentTurn = global.turnsystem.currentTurn;

image_index = currentTurn
if (currentTurn %2 == 0){
	x = room_width + sprite_width;
	_direction = -1;
	image_xscale = -1;
}else{
	x = -sprite_width;
	_direction = 1;
}
y = 0;

