/*
	NOTE: TURN AND TEAM MUST BE CONSISTANT IN ORDER. 
*/
enum turn{
	BLUE_TURN,
	RED_TURN,
	SYSTEM_TURN
}

enum teamsEnum{
	TEAM_BLUE,
	TEAM_RED
}

function turnManager() constructor{
	static currentTurn = 0;
	
	teams = [new team(teamsEnum.TEAM_BLUE), 
			new team(teamsEnum.TEAM_RED)]
	
	
	turn_next = function(){
		//reset all piece states to default
		//obj_temp_piece.reset();
		
		currentTurn ++;
		if (currentTurn >= turn.SYSTEM_TURN){
			currentTurn = 0;
		}
		teams[currentTurn].reset();
	
		//reset tile highlights
		obj_basic_tile.display = tileDisplay.original
		
		//reset tile selector
		global.select_state =  selectState.deselect;

		if (DEBUG_MODE_TURN){show_debug_message("Advanced to Turn: {0}", currentTurn);}
	}
	
}

global.turnsystem = new turnManager();

