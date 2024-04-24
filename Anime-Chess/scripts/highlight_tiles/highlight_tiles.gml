// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function highlight_tiles(tiles){
	for(var i = 0; i < array_length(tiles); i ++){
		 if (tiles[i].carry != noone){
			tiles[i].display = tileDisplay.highlight_moveable;
		} else {
			tiles[i].display = tileDisplay.highlight_nonmovable;
		}
	}
}

