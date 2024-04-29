var currentTeam = global.turnsystem.teams[global.turnsystem.currentTurn];
max_energy = currentTeam.maxEnergy;
var current_energy = currentTeam.currentEnergy;
draw_text(1000, 320, "Current Energy: " + string(currentTeam.currentEnergy) + "/" + string(max_energy));
draw_text(1000, 470, "Press Shift to Deploy Units ");
draw_text(1000, 500, "Current # of Pieces: " + string(currentTeam.createdPieces) + "/5");

for (var i = 0; i < max_energy; i++){
	if (i < current_energy){
		var shard_index = 0;
	} else {
		var shard_index = 1;
	}
	if (i < 5){
		var yplace = 360;
		var xplace = i * 50;
	} else {
		var yplace = 420;
		var xplace = (i-5) * 50;
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