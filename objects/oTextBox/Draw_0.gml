accept_key = keyboard_check_pressed(ord("E"));

textbox_x = camera_get_view_x(view_camera[0]) + 400;
textbox_y = camera_get_view_y(view_camera[0]) + 230;

#region Setup

if setup == false
{
	setup = true;
	draw_set_color(c_white);
	draw_set_font(fAdventureTime);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// Loop Through pages
	for (var p = 0; p < page_number; p++)
	{
		// Finds how many characters are on a page and stores it in an array (text_length)
		text_length[p] = string_length(text[p]);
		
			// Get textbox x pos
			text_x_offset[p] = 44;
		
		// Setting individual Characters and finding where lines of text should break
		for (var c = 0; c < text_length[p]; c++)
		{		
			var _char_pos = c+1;
			
			// Store Individual Characters in char array
			char[c,p] = string_char_at(text[p],_char_pos);	
			
			// Get line width 
			var _txt_up_to_char = string_copy(text[p],1,_char_pos); 
			var _current_txt_w = string_width(_txt_up_to_char) = string_width(char[c,p]);
			
			// Get last free space
			if char[c,p] == " " { last_free_space = _char_pos+1 }; 
			
			// get the line breaks
			if _current_txt_w - line_break_offset[p] > line_width
			{
				line_break_pos[line_break_num[p],p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p],last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		// Getting each Characters coordinates
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1; 
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			// Get current width of the line
			var _txt_up_to_char = string_copy(text[p],1,_char_pos); 
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p]);
			var _txt_line = 0;
			
			// Compensate for string breaks 
			for (var lb = 0; lb < line_break_num[p]; lb++)
			{
				//if the current looping character is after a line break
				if _char_pos >= line_break_pos[lb,p]
				{
					var _str_copy = string_copy(text[p],line_break_pos[lb,p], _char_pos-line_break_pos[lb,p]);
					_current_txt_w = sintrg_width(_str_copy);
					
					// record the line this character should be on
					_txt_line = lb+1; // +1 because lb starts at 0
				}
			}
			
			// Add to x and y co ordinates based on the new info
			char_x[c,p] = _txt_x + _current_txt_w;
			char_y[c,p] = _txt_y + _txt_line*line_seperation;
		}
	}

}

#endregion

#region Typing Text

if draw_char < text_length[page]
{
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

// Flip through pages
if accept_key 
{
	// If typing done
	if draw_char == text_length[page]
	{
		// Next page
		if page < page_number - 1
		{
			page++;
			draw_char = 0;
		}
		else 
		{
			// Link Text Options
			if option_number > 0
			{
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}
	}
	// If not done typing
	else 
	{
		draw_char = text_length[page];
	}
}

#endregion

#region Draw Texbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
textb_img += textb_img_spd;
textb_spr_w = sprite_get_width(textb_spr);
textb_spr_h = sprite_get_height(textb_spr);

// Draw the back of the Textbox
draw_sprite_ext(textb_spr,textb_img,_txtb_x,_txtb_y+5,textbox_width/textb_spr_w,textbox_height/textb_spr_h,0,c_white,1);

#endregion

#region Options

if draw_char = text_length[page] && page == page_number - 1
{
	// Option Selection
	option_pos += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	option_pos = clamp(option_pos,0,option_number-1);
	
	// Draw Options
	var _op_space = 15;
	var _op_bord = 5;
	for (var op = 0; op < option_number; op++)
	{
		// Draw Option Box
		var _option_width = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(textb_spr,textb_img,_txtb_x,_txtb_y-_op_space*option_number+_op_space*op,_option_width/textb_spr_w,(_op_space-1)/textb_spr_h,0,c_white,1);
		
		// Draw Arrow
		if option_pos == op
		{
			draw_sprite(sTextboxSelect, 0, _txtb_x-20, _txtb_y-_op_space*option_number+_op_space*op);
		}
		
		// Draw Option Text
		draw_text(_txtb_x+_op_bord,_txtb_y-_op_space*option_number+_op_space*op+0.3,option[op]);
	}
}

#endregion

#region Draw Text
for (var c = 0; c < draw_char; c++)
	{
		draw_text(char_x[c,page],char_y[c,page],char[c,page]);
	}


#endregion
