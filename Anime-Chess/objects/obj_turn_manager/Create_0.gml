enum turn{
	BLUE_TURN,
	RED_TURN,
	SYSTEM_TURN
}

enum team{
	TEAM_BLUE,
	TEAM_RED
}

global.currentTurn = turn.SYSTEM_TURN;
global.team = team.TEAM_BLUE;

function turn_next(){
	if (global.currentTurn < turn.SYSTEM_TURN){
		global.currentTurn ++;
	}else{
		global.currentTurn = 0;
	}
	show_debug_message(global.currentTurn);
}