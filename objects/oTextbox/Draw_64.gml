accept_key = keyboard_check_pressed(ord("E"));

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 100;

#region Setup
if setup == false 
{
	//page_number = 0;
	setup = true;
	draw_set_font(fAdventureTime);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	// Loop through pages
	for (var p = 0; p < page_number; p++)
	{
		text_length[p] = string_length(text[p]); // Length of text on each page
			
		// ------ Setting Portrait Textbox ------

			// Left Character
			text_x_offset[p] = room_width/7.25;
			portrait_x_offset[p] = 8;
			// Right Character
			if speaker_side[p] == -1
			{
				text_x_offset[p] = 68;
				portrait_x_offset[p] = 1169;
			}
			if speaker_sprite[p] == noone
			{
				text_x_offset[p] = 74;
			}
		
		
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1;
			
			char [c,p] = string_char_at(text[p],_char_pos); // Store individual characters in char array
			
			// Get current width of the line
			var _txt_up_to_char = string_copy(text[p],1,_char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p]);
			
			// get last free space
			if char[c,p] == " " 
			{
				last_free_space = _char_pos+1;
			}
			
			// Get line breaks
			if _current_txt_w - line_break_offset[p] > line_width 
			{
				line_break_pos[line_break_num[p],p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(text[p],1,last_free_space);
				var _last_free_space_string = string_char_at(text[p],last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
			
		}
		
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1;
			var _txt_x = textbox_x + text_x_offset[p] + textbox_x_placement + border;
			var _txt_y = textbox_y + textbox_y_placement + border;
			
			var _txt_up_to_char = string_copy(text[p],1,_char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p]);
			var _txt_line = 0;
			
			for (var lb = 0; lb < line_break_num[p]; lb++)
			{
				if _char_pos >= line_break_pos[lb,p]
				{
					var _str_copy = string_copy(text[p],line_break_pos[lb,p],_char_pos-line_break_pos[lb,p]);
					_current_txt_w = string_width(_str_copy);
					
					_txt_line = lb+1;
				}
			}
			char_x[c,p] = _txt_x + _current_txt_w;
			char_y[c,p] = _txt_y + _txt_line*line_seperation;
		}
	}
}
#endregion




#region Typing Text
if text_pause_timer <= 0
{
	if draw_char < text_length[page]
	{
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page],draw_char);
		if _check_char = "." || _check_char = "?" || _check_char = "!"
		{
			text_pause_timer = text_pause_time;
		}
		if _check_char = ","
		{
			text_pause_timer = text_pause_time/2;
		}
		else 
		{
			if snd_count < snd_delay 
			{
				snd_count++;
			}
			else 
			{
				snd_count = 0;
				audio_play_sound(snd[page],8,false);
			}
		}
	}
}
else 
{
	text_pause_timer--;
}
#endregion




#region Flip Through Pages
if accept_key
{
	
	
	if draw_char == text_length[page] // If typing is done, go to next page
	{
		if page < page_number-1 // Next page
		{
			page++;
			draw_char = 0;
		}
		else // Destroy Old Textbox 
		{
			// Link text if option
			if option_number > 0 
			{
				create_textbox(option_link_id[option_pos]);
			}
			
			instance_destroy(); 
			
		}
	}
	else // If not done typing
	{
		draw_char = text_length[page];
	}
}
#endregion




#region Draw Textbox 
// Draw Textbox
var _txtb_x = textbox_x + text_x_offset[page] + textbox_x_placement;
var _txtb_y = textbox_y + textbox_y_placement;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);
speaker_y = textbox_y+room_height*1.3;

// Draw Character Textbox
if speaker_sprite[page] != noone
{
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page]
	{
		image_index = 0;
	}
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1
	{
		_speaker_x += sprite_width; 
	}
	// Draw the Character Textbox
	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], speaker_y , sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x,speaker_y , speaker_side[page],1,0,c_white,1);
}

// ---------- Draw back of Textbox ----------
draw_sprite_ext(txtb_spr[page],txtb_img,_txtb_x,_txtb_y,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,0,c_white,1); 
#endregion




#region Draw Options 
if draw_char == text_length[page] && page == page_number - 1
{
	// Option Selection
	option_pos += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	option_pos = clamp(option_pos, 0, option_number-1);
	
	var _op_space = 70; // Space between option boxes
	var _op_bord = 120; // Space between text and edge of box
	for (var op = 0; op < option_number; op++)
	{
		// Option Box
		var _option_width = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(txtb_spr[page],txtb_img,_txtb_x,_txtb_y-_op_space*option_number+_op_space*op,_option_width/txtb_spr_w,(_op_space-5)/txtb_spr_h,0,c_white,1);
		
		// Selection Arrow
		if option_pos == op
		{
			draw_sprite(sDialogSelect,0,_txtb_x+_option_width,_txtb_y-_op_space*option_number+_op_space*op);
		}
		
		// Draw Option Text
		draw_text_ext_transformed(_txtb_x + _op_bord - 50, _txtb_y - _op_space*option_number + _op_space*op + 14, option[op],line_seperation,line_width,1,1,0);
	}
	
		
}
#endregion




#region Draw Text

for (var c = 0; c < draw_char; c++)
{
	draw_text_color(char_x[c,page], char_y[c,page],char[c,page],col_1[c,page],col_2[c,page],col_3[c,page],col_4[c,page],1); 
}

#endregion