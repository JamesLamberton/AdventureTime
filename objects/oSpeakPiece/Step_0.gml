var _s = id;

if (place_meeting(x,y,oPlayer) and !instance_exists(oTextBox) and keyboard_check_pressed(ord("E")))
{
	show_debug_message("Hello");
	with (instance_create_layer(oPlayer.x, oPlayer.y,"Effects",oTextBox))
	{
		game_text(_s.text_id);
	}
}