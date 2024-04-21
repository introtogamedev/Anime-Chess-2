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
		
		teams[currentTurn].increaseMaxEnergy();
		teams[currentTurn].reset();
		
		//increase visual amount of energy
		
		currentTurn ++;
		if (currentTurn >= turn.SYSTEM_TURN){
			currentTurn = 0;
		}
		
		//change screen background
		if (currentTurn == 0){
			obj_manual_background.index = 0;
			obj_mouse_manager.team_color = 0;
			end_turn_button._turn = 0;
		} else if (currentTurn == 1){
			obj_manual_background.index = 1;
			obj_mouse_manager.team_color = 1;
			end_turn_button._turn = 1;
		}

		//reset tile highlights
		obj_basic_tile.display = tileDisplay.original
		
		//reset tile selector
		global.select_state =  selectState.deselect;

		if (DEBUG_MODE_TURN){show_debug_message("Advanced to Turn: {0}", currentTurn);}
	}
	
}

global.turnsystem = new turnManager();

