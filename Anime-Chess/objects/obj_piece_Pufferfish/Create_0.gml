/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

buttongroup = new buttonGroup(self);
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton, action.move));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.reset));
	 
attackRestrictionFunction = function(){
	 return []
}
	 
movementRestrictionFunction = function(){
	//IMCOMPLETE
	return tile_get_restriction(carrier.coordinate, tileRestriction.XYZ)
}