/// @param text string
function add_text(_text)
{
	text[page_number] = _text;
	
	page_number++;
}

/// @param option
/// @param link_id
function text_option(_option,_link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

/// @param text_id
function create_textbox(_text_id)
{
	with (instance_create_depth(0,0,-9999,oTextbox))
	{
		game_text(_text_id);
	}
}