
var display_unit = noone	
if (global.selectedUnit != noone){
	display_unit = global.selectedUnit;
	current_display = display_unit;
	visible = true
}else if (not mouse_check_outOfBounds()){
	display_unit = get_tile_carry(global.mouse_coordinate)
	if (current_display != display_unit){
		visible = true
		current_display = display_unit;
		alarm[0] = 10
	}
	
}else{
	return;
}

if (visible){
	if (display_unit != noone){
		var unit_type = display_unit.object_index;
		var unit_name = object_get_name(unit_type)
		var sprite_name = "spr_card_pufferfish"//string_replace(unit_name, "obj_piece", "spr_card") + string(global.turnsystem.currentTurn+1);
		var sprite = asset_get_index(sprite_name)
		sprite_index = sprite
		show_debug_message(unit_name)
		
	}else{
		//sprite_index = spr_card_pufferfish
	}
}

image_xscale = 0.8147385;
image_yscale = 0.8147385;