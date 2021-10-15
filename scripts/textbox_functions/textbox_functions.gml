/// @param text
function add_text_page(_text)
{
	text[page_number] = _text;
	
	page_number++;
}

/// @param option
/// @param link_id
function script_option(_option, _link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id; 
	
	option_number++;
}

function create_textbox(_text_id)
{
	with (instance_create_layer(oPlayer.x, oPlayer.y,"Effects",oTextBox))
	{
		game_text(_text_id);
	}
}
