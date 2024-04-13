// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function toggle_activate_game(){
	var gameLayers = [
		layer_get_id("Buttons"),
		layer_get_id("Pieces"),
		layer_get_id("Board")
	]
	
	for(var i = 0; i < array_length(gameLayers); i ++){
		 if (layer_get_visible(gameLayers[i])){
			 layer_set_visible(gameLayers[i], false);
			 instance_deactivate_layer(gameLayers[i]);
		 }else{
			 layer_set_visible(gameLayers[i], true);
			 instance_activate_layer(gameLayers[i]);
		 }
	}
}

function toggle_activate_Transition(){
	var transitionLayers = [
		layer_get_id("Turn_transition"),
		layer_get_id("TransitionBackground")
	]
	
	for(var i = 0; i < array_length(transitionLayers); i ++){
		 if (layer_get_visible(transitionLayers[i])){
			 layer_set_visible(transitionLayers[i], false);
			 instance_deactivate_layer(transitionLayers[i]);
		 }else{
			 layer_set_visible(transitionLayers[i], true);
			 instance_activate_layer(transitionLayers[i]);
		 }
	}
}