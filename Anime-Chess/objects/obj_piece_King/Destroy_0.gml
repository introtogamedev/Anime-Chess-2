/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


show_debug_message("KING KILLED! ROOM RESTARTING....");
if (instance_exists(obj_end_screen_manager)){
	obj_end_screen_manager.game_ended = true;
	obj_end_screen_manager.team_win = teamAssignment;
}
room_goto(End_Screen);
