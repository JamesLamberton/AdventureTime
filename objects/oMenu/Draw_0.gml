// Calculate width + height of menu
var _new_w = 0;
for (var i = 0; i < op_length; i++)
{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}

// Draw Menu Background
draw_sprite_ext(sprite_index, image_index, x + 3, y + 5, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Draw Options
draw_set_font(fAdventureTime);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length; i++)
{
	var _color = c_white; 
	if pos == i {_color = c_yellow};
	draw_text_color(x + 12, y + 10 + op_space*i, option[menu_level, i], _color, _color, _color, _color, 1);
}