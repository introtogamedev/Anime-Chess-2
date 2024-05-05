visible = !obj_information_panel_UnitSelection.visible

if (visible){
	var unit_selected = global.selectedUnit
	
	if (unit_selected != noone){
		var unit_type = unit_selected.object_index;
		var unit_name = object_get_name(unit_type)
		var sprite_name = "spr_card_pufferfish"//string_replace(unit_name, "obj_piece", "spr_card") + string(global.turnsystem.currentTurn+1);
		var sprite = asset_get_index(sprite_name)
		show_debug_message(sprite_name);
		sprite_index = sprite
		
	}else{
		//sprite_index = spr_card_pufferfish
	}
}

image_xscale = 0.8147385;
image_yscale = 0.8147385;