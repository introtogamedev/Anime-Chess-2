draw_sprite(sprite_index, image_index, x, y);
var percent;
percent = (hp/startingHealth) * 100;
draw_healthbar(x-30, y+38, x + 30, y + 45, percent, c_gray, c_red, c_green, 0, true, false);


draw_text(10, y, actionCount)

draw_text(10, y+10, actionLimit)

