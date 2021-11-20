#region Dialog 
if place_meeting(x,y,oPlayer) and keyboard_check_pressed(ord("E")) and !instance_exists(oTextbox)
{
	create_textbox(text_id);
}
#endregion