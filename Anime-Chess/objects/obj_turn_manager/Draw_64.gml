var currentTeam = global.turnsystem.teams[global.turnsystem.currentTurn];
max_energy = currentTeam.maxEnergy;
var current_energy = currentTeam.currentEnergy;
draw_text(10, 700, "Current Energy: " + string(currentTeam.currentEnergy));
draw_text(10, 720, "Current # of Pieces: " + string(currentTeam.createdPieces));

for (var i = 0; i < max_energy; i++){
	if (i < current_energy){
		var shard_index = 0;
	} else {
		var shard_index = 1;
	}
	draw_sprite_ext(spr_energy_shard, shard_index, energy_x + i * 80, 700, 1, 1, 0, c_white, 1);
}