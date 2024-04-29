//draw self sprite first
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

//layered information pannel
var currentTeam = global.turnsystem.teams[global.turnsystem.currentTurn];
var max_energy = currentTeam.maxEnergy;
var current_energy = currentTeam.currentEnergy;
draw_text(x+40, y+256, "Current Energy: " + string(currentTeam.currentEnergy) + "/" + string(max_energy));
draw_text(x+40, y+436, "Current # of Pieces: " + string(currentTeam.createdPieces) + "/5");

for (var i = 0; i < max_energy; i++){
	var shard_index = 1;
	if (i < current_energy){
		shard_index = 0;
	}
	var yplace = 420;
		var xplace = (i-5) * 50;
	if (i < 5){
		yplace = 360;
		xplace = i * 50;
	}
	draw_sprite_ext(spr_energy_shard, shard_index, energy_x + xplace, yplace, 1, 1, 0, c_white, 1);
}

for (var i = 0; i < 5; i++){
	if (i < currentTeam.createdPieces){
		var occupy_index = 1;
	} else {
		var occupy_index = 0;
	}
	draw_sprite_ext(spr_units_count, occupy_index, units_x + i * 50, 550, 1, 1, 0, c_white, 1);
}