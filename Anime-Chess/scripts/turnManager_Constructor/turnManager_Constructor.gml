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
		
		//change color scheme
		var layer_background = layer_background_get_id("Background");
		layer_background_index(layer_background, currentTurn);

		//reset tile highlights
		obj_basic_tile.display = tileDisplay.original
		
		//reset tile selector
		global.select_state =  selectState.deselect;

		if (DEBUG_MODE_TURN){show_debug_message("Advanced to Turn: {0}", currentTurn);}
	}
	
	reset = function() {
		for(var i = 0; i < array_length(teams); i ++){
			teams[i].maxEnergy = 0;
			teams[i].currentActions = 0;
			teams[i].createdPieces = 0;
			teams[i].currentEnergy = 0;
		}
	}
	
	
}

global.turnsystem = new turnManager();

