if (place_meeting(x,y,oPlayer) and !instance_exists(oTextBox) and keyboard_check_pressed(ord("E")))
{
	create_textbox(text_id);
}