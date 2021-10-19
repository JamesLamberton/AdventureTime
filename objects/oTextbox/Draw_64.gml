var _arr = messages[| messageID]; // Getting current message from array and storing it in local variable

var _name = _arr[MSG.NAME];
var _image = _arr[MSG.IMAGE]; 

draw_set_font(fAdventureTime); // Set Text Font

draw_9slice(x, y, width, height, sDialogBox, 0); // Draw Textbox Utilizing nine slice

// Draw Position
var _drawX = x + padding; 
var _drawY = y + padding;

// Draw Image
if (sprite_exists(_image)) // Checks images existence 
{
	var _imageW = sprite_get_width(_image);
	var _imageH = sprite_get_height(_image);
	
	draw_sprite_ext(_image, 0, _drawX + _imageW / 6, _drawY + _imageH / 6.5, 2, 2, 0, c_white, 1); // Draws Image
	
	_drawX += _imageW + padding; // Offset draw position for text
}

draw_set_color(c_dkgray); // Set Text Color

draw_text_transformed(_drawX * 1.8, _drawY, _name, 3.5, 3.5, 0); // Draw Name

_drawY += string_height(_name) + padding; // Settings message position as lower than name

var _maxW = width - (_drawX + padding); // Get maximum text width

draw_text_ext_transformed(_drawX * 1.8, _drawY, messageText, -1, _maxW, 2.5, 2.5, 0); // Draw Text

draw_set_color(c_dkgray); // Reset


