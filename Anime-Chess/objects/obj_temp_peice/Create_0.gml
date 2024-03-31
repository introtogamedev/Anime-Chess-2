enum action{
	idle,
	selectAction,
	move,
	attack,
	special,
	reset
}
currentAction = action.idle

movementRestriction = []

 buttongroup = new buttonGroup(self);
 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton, action.move, buttongroup));
 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton1, action.attack, buttongroup));
 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.special, buttongroup));
 buttongroup.addToButtonGroup(new selectionButton(spr_actionSelectionButton2, action.special, buttongroup));
 