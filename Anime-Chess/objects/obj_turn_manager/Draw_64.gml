var currentTeam = global.turnsystem.teams[global.turnsystem.currentTurn]
draw_text(10, 700, "Current Energy: " + string(currentTeam.currentEnergy));
draw_text(10, 720, "Current # of Pieces: " + string(currentTeam.createdPieces));