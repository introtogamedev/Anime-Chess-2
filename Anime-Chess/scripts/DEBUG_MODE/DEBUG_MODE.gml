/*
	Any action related function and warning. 
		- whether the movement was sucessful or the movement was unsucessful. 
		- Attack states and errors
		- special abilities: its execution states and errors
*/
#macro DEBUG_MODE_ACTION false

/*
	Any Select related function and warning.
		- Was the selection executed?
		- Was it within restrictions?
		- Was there an conflict?
		- Selection state and errors
*/
#macro DEBUG_MODE_SELECT false

/*
	Any interaction between tiles and carried pieces
		- Was the carry executed?
		- Was there conflict?
		- Selection and errors
*/
#macro DEBUG_MODE_CARRY false

/*
	Messages related to the creation of "structs"/constructors. 
		- Function execution and errors. 
		
		These are function messages from constuctors which are 
		often temporary "objects". 
*/
#macro DEBUG_MODE_CONSTRUCTOR false

/*
	Display and realtime object sprite change updates
*/
#macro DEBUG_MODE_DISPLAY false