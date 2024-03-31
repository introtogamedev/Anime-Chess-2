function selectionButton(icon, action_representation) constructor{
	sprite_index = icon;
	self.action_representation = action_representation;
}

function buttonGroup(association) constructor{
	self.association = association;
	group = [];
	static buttonInstances = 0;
	
	addToButtonGroup = function(button){
		if (is_instanceof(button, selectionButton)){
			array_push(group, button);
			if (DEBUG_MODE_CONSTRUCTOR){show_debug_message("Added Button to group: {0}", button);}
		}else{
			if (DEBUG_MODE_CONSTRUCTOR){show_debug_message("ERROR! ATTEMPTED TO ADD ELEMENT BUT TYPE MISMATCH!: {0}", button);}
		}
	}
	
	getButtonGroup = function(){
		return group;
	}
	
	static createButtonObjects = function(h_offset = association.sprite_width, maxAngle = 180){
		var origin_x = association.x;
		var origin_y = association.y;
		
		var angle_offset = 0;
		var amount_of_buttons = array_length(group);
		var angleDifference = maxAngle/amount_of_buttons;
		
		if (amount_of_buttons%2 == 0){//odd amount of buttons
			angle_offset = angleDifference/2;
		}else{//even amount of buttons
			//do nothing
		}
		if (buttonInstances == 0){
			for (var i = 0; i < amount_of_buttons; i ++){
				var angle_shift = (angleDifference * i - floor(amount_of_buttons/2) * angleDifference + angle_offset);
				var _xx = origin_x + lengthdir_x(h_offset, angle_shift);
				var _yy = origin_y + lengthdir_y(h_offset, angle_shift);
				buttonInstances[i] = instance_create_layer(_xx, _yy, "Buttons", obj_actionSelection_button, group[i]);
				buttonInstances[i].buttonGroup = self;
				show_debug_message("CREATED BUTTON at {0} at angle {1} in array {2}", [_xx, _yy], angle_shift, buttonInstances);
			}
		}
	}
}