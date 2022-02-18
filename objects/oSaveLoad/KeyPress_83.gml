/// @desc  Game

// Make save array 
var _saveData = array_create(0);

// For every insstance, create a struct and add it to the array
with (oInventory)

with (oPlayer)
{
	var _saveEntity = 
	{
		obj : object_get_name(object_index), 
		y : y, 
		x : x, 
		image_index : image_index,
		image_blend : image_blend, 
		ammo : ammo, 
		coin : coin, 
		potion_count : potion_count, 
		level : level, 
		hp : hp, 
	}		
	array_push(_saveData, _saveEntity); 
}

// Turn data into Json string and save via buffer
var _string = json_stringify(_saveData); 
var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);

show_debug_message("Game Saved!" + _string);