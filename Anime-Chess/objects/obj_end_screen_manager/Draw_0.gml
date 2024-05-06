if (game_ended && team_win == 1){
	draw_sprite(spr_blue_win, -1, 100, 100);
} else if (game_ended && team_win == 0){
	draw_sprite(spr_red_win, -1, 100, 100);
}