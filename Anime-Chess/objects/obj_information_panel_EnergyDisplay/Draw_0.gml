draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)

//layered information pannel
var currentTeam = global.turnsystem.teams[global.turnsystem.currentTurn];
var max_energy = currentTeam.maxEnergy;
var current_energy = currentTeam.currentEnergy;
var absolute_max_energy = currentTeam.maxEnergyCap

var width = abs(sprite_width) 
var height = abs(sprite_height)

var drawn_sprite =  blue_crystal

var energy_sprite_x_offset = sprite_get_width(drawn_sprite)
var energy_x_offset_gap = (width - absolute_max_energy * energy_sprite_x_offset )/(absolute_max_energy+1)
/*if (global.selectedUnit.object_index == obj_piece_king){
	
	
}else{
	visible = false;
}*/
var energy_y_offset_gap = 5
var energy_sprite_y = y  +  height - sprite_get_height(drawn_sprite) - energy_y_offset_gap;

var text_display_x = x + 1;
var text_display_y = y + 1;
draw_set_color(c_black);//temporary
draw_text(text_display_x, text_display_y, "Current Energy: " + string(current_energy) + "/" + string(max_energy));
draw_set_color(c_white);//temporary

for( var i = 0 ; i < max_energy; i ++){
	var shard_index = 1;
	if (i < current_energy){
		shard_index = 0;
	}
	var energy_display_y =  energy_sprite_y
	var energy_display_x =  x + (i * (energy_sprite_x_offset + energy_x_offset_gap)) + energy_x_offset_gap
	draw_sprite_ext(drawn_sprite, shard_index,energy_display_x, energy_display_y, 1, 1, 0, c_white, 1);
}


/*
units_x = 1000;
selection = false;

var text_display_x = x + 14;
var energy_display_x = text_display_x;
var text_display_y1 = y+436;
var text_display_y2 = 0;
var energy_display_y = 491;
var energy_display_y_offset = 40 + 10
draw_text(text_display_x, text_display_y1, "Current Energy: " + string(currentTeam.currentEnergy) + "/" + string(max_energy));
draw_text(text_display_x, text_display_y2, "Current # of Pieces: " + string(currentTeam.createdPieces) + "/5");



for (var i = 0; i < max_energy; i++){
	var shard_index = 1;
	if (i < current_energy){
		shard_index = 0;
	}
	var yplace = energy_display_y ;
		var xplace = (i-5) * 50;
	if (i < 5){
		yplace = energy_display_y;
		xplace = i * 50;
	}
	draw_sprite_ext(spr_energy_shard, shard_index, energy_display_x + xplace, yplace, 1, 1, 0, c_white, 1);
}

for (var i = 0; i < 5; i++){
	if (i < currentTeam.createdPieces){
		var occupy_index = 1;
	} else {
		var occupy_index = 0;
	}
	draw_sprite_ext(spr_units_count, occupy_index, units_x + i * 50,  y+436, 1, 1, 0, c_white, 1);
}
//710, 490  = 930,555 -> 219, 64