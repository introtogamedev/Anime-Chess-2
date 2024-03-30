// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function highlight_possible_movement(possible_moves){
	for(var i = 0; i < array_length(possible_moves); i ++){
		possible_moves[i].display = tileDisplay.highlight;
	}
}