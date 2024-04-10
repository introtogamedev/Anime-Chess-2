selected = false;
carry = noone; //peice carrier
selected = false;
coordinate = [x_coordinate, y_coordinate]

enum tileDisplay{
	original,
	selected,
	highlight_moveable,
	highlight_nonmovable
}
display = tileDisplay.original;
savedDisplay = tileDisplay.original;

name = coordinate;