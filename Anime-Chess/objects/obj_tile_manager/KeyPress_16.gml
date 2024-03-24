if (get_tile_carry(global.mouse_coordinate) == noone){
	var carry = instance_create_depth(0, 0, 0, obj_temp_peice)
	set_tile_carry(global.mouse_coordinate, carry);
}else{
	
}