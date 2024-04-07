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

global.turnsystem = new turnManager();

function turnManager() constructor{
	static currentTurn = 0;
	
	turn_next = function(){
		//reset all piece states to default
		obj_temp_piece.reset();
		
		currentTurn ++;
	
		//reset tile highlights
		obj_basic_tile.display = tileDisplay.original
		
		//reset tile selector
		global.select_state =  selectState.deselect;
		
		if (currentTurn >= turn.SYSTEM_TURN){
			currentTurn = 0;
		}
		if (DEBUG_MODE_TURN){show_debug_message("Advanced to Turn: {0}", currentTurn);}
	}
	
}