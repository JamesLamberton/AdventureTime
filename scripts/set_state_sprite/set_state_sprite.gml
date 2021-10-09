///@arg sprite_index 
///@arg image_speed
///@arg image_index

function set_state_sprite()
{
	var new_sprite = argument0;
	var new_speed = argument1;
	var new_index = argument2; 
	
if sprite_index != new_sprite
	{
			sprite_index = new_sprite;
			image_speed = new_speed; 
			image_index = new_index;
	}
}