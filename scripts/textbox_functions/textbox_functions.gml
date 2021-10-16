function set_default_for_text()
{
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
}

/// @param text
function add_text_page(_text)
{
	set_default_for_text();
	
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
