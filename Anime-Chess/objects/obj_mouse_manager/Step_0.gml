
switch(global.select_state){
	case (selectState.idle):
			//do nothing
		return;
	case (selectState.deselect):
		deslect_all_tiles();
		global.select_state++;
		global.selectRestriction = [];
		break;
}

if (global.select_state >= selectState.deselect){
	global.select_state = selectState.tileSelect;
}