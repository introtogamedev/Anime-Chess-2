enum turn{
	PLAYER_1_TURN,
	PLAYER_2_TURN,
	SYSTEM_TURN
}

global.currentTurn = turn.SYSTEM_TURN;

function turn_next(){
	if (global.currentTurn < turn.SYSTEM_TURN){
		global.currentTurn ++;
	}else{
		global.currentTurn = 0;
	}
	show_debug_message(global.currentTurn);
}