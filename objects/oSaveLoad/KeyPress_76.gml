/// @desc Load Game
// Erase Current game state
with (oPlayer) instance_destroy();

if (file_exists("savedgame.save"))
{
	show_debug_message("rgkejngjibh");
	var _buffer = buffer_load("savedgame.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	while (array_length(_loadData) > 0)
	{
		var _loadEntity = array_pop(_loadData);	
		with (instance_create_layer(0,0,layer,asset_get_index(_loadEntity.obj)))
		{
			reference = 1;
			y = _loadEntity.y; 
			x = _loadEntity.x;
			image_blend = _loadEntity.image_blend;
			image_index = _loadEntity.image_index;
			ammo = _loadEntity.ammo; 
			coin = _loadEntity.coin;
			potion_count = _loadEntity.potion_count;
			level = _loadEntity.level;
			hp = _loadEntity.hp; 
		}
	}
	with (oPlayer)
	{
		show_debug_message("poop");
		if reference == 2 
		{
			instance_destroy();
		}
	}
	show_debug_message("Game loaded!" + _string);
}	