if place_meeting(x,y,oPlayer) and keyboard_check_pressed(ord("E")) and !instance_exists(oTextbox)
{
	var _tb = instance_create_layer(0, 0, "Instances", oTextbox);
	var _list = _tb.messages; // Add messages to textboxs list
	
	for (var i=0; i<array_length_1d(msg); i++) // Array contains all messages
	{
		var _arr = msg[i];		
		ds_list_add(_list, _arr); // Puts messages inside DS List
	}
}