/*#macro ANIMATION_START_FRAME 0
#macro ANIMATION_END_FRAME 3

iF ()*/

var percent;
percent = (hp/maxHealth) * 100;
draw_healthbar(x-30, y+38, x + 30, y + 45, percent, c_gray, c_red, c_green, 0, true, false);


draw_text(10, y, actionCount)

draw_text(10, y+10, actionLimit)

