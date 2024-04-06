/*
	NOTE: TURN AND TEAM MUST BE CONSISTANT IN ORDER. 
*/
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
	global.currentTurn ++;
	show_debug_message(global.currentTurn);
}