if (timer == 0){
	if (object_exists(obj_transition_puff)){
		instance_destroy(obj_transition_puff);
	}
	var transition_puff = instance_create_layer(0, 0, "Transitions", obj_transition_puff);
	timer = 1;
}