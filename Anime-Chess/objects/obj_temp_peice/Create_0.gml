enum action{
	idle,
	selectAction,
	move,
	attack,
	special,
	reset
}
currentAction = action.idle
plannedAction = action.idle

movementRestriction = []

 buttongroup = new buttonGroup(self);
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton, action.move));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton1, action.attack));
	 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.special));
	 //buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.special)); 
