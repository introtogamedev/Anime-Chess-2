switch(action_representation){
	case(action.move):
		sprite_index = spr_actionSelectionButton;
	break;
	case(action.attack):
		sprite_index = spr_actionSelectionButton1;
	break;
	case(action.reset):
		sprite_index = spr_actionSelectionButton2;
	break;
}

if (not active){
image_index = 2;	
}

if (highlight){
image_index = 1;
}