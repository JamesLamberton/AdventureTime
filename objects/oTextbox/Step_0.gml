var _arr = messages[| messageID];

var _text = _arr[MSG.TEXT];

messageText = string_copy(_text, 1, messageChar); // Get message String

if (messageChar <= string_length(_text)) messageChar += messageSpeed; // Check if string isnt fully drawn 

else if (keyboard_check_pressed(ord("E"))) // If string fully drawn
{
	if (messageID < ds_list_size(messages) - 1) 
	{
		messageID++;
		messageChar = 0;
	}
	else // close textbox
	{
		instance_destroy();
	}
}