


var turnSpriteIndex = global.turnsystem.currentTurn;
var turnSprite = asset_get_index(pieceInformation.sprites[turnSpriteIndex]);
if (turnSprite > -1){
	sprite_index = turnSprite;
}

var xscale = size[0];
var yscale = size[1];

var xscale_adjustment = xscale/sprite_width;
var yscale_adjustment = yscale/sprite_height;

draw_sprite_ext(sprite_index, image_index, x, y, xscale_adjustment, yscale_adjustment, 0, c_white, 1);
image_speed = 0;

var cost_x = x + sprite_width/2;
var cost_y = y + sprite_height/2;
draw_sprite(spr_costs, pieceInformation.cost -1, cost_x, cost_y)

//draw_text(x - sprite_width/2, y, [int64(x),int64(y)])//debugging purposes


