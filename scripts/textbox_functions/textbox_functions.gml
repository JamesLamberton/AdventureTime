function set_defaults_for_text()
{
	line_break_pos[0,page_number] = 100;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	// Variables for every letter/character
	for (var c = 0; c < 500; c++)
	{
		col_1[c,page_number] = c_white;
		col_2[c,page_number] = c_white;
		col_3[c,page_number] = c_white;
		col_4[c,page_number] = c_white;
	}
	
	txtb_spr[page_number] = sDialogBoxBlue;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1; // 1 = left, -1 = right
	snd[page_number] = sndTalk2;
}




///@param 1st_char
///@param last_char
///@param col1
///@param col2
///@param col3
///@param col4
function text_color(_start,_end,_col1,_col2,_col3,_col4)
{
	for (var c = _start; c <= _end; c++)
	{
		col_1[c,page_number-1] = _col1;
		col_2[c,page_number-1] = _col2;
		col_3[c,page_number-1] = _col3;
		col_4[c,page_number-1] = _col4;
	}
}




/// @param text string
/// @param [character]
/// @param [side]
function add_text(_text)
{
	set_defaults_for_text();
	
	text[page_number] = _text;
	
	if argument_count > 1 
	{
		switch (argument[1])
		{
			case "Finn": 
				speaker_sprite[page_number] = FinnPortrait; 
				snd[page_number] = sndTalk3;
			break;
			
			case "ChooseGoose": 
				speaker_sprite[page_number] = ChooseGoosePortrait; 
				snd[page_number] = sndTalk4; 
			break;
			
			case "Bemo":
				speaker_sprite[page_number] = BemoPortrait;
				snd[page_number] = sndTalk1;
			break;
			
			case "Jake":
				speaker_sprite[page_number] = JakePortrait;
				snd[page_number] = sndTalk3;
			break; 
			
		}
	}
	
	if argument_count > 2
	{
		speaker_side[page_number] = argument[2];
	}
	
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