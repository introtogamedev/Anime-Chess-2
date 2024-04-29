if (hp <= 0){
	var deathrattle_anim = instance_create_layer(image_x, image_y, "Buttons", obj_landing_animation);
	deathrattle_anim.sprite_index = spr_cavalry_deathrattle_explosion;
	initiateAction(action.death);
}

if(global.turnsystem.currentTurn != teamAssignment){
	currentAction = action.deactivated;
	return;
}
