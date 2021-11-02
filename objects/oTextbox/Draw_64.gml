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
	
	// Loop through pages
	for (var p = 0; p < page_number; p++)
	{
		text_length[p] = string_length(text[p]); // Length of text on each page
		
		text_x_offset[p] = 44; // text distance from left side of screen
	}
}
#endregion

#region Typing Text
if draw_char < text_length[page]
{
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
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
var _txtb_x = textbox_x + text_x_offset[page] + textbox_x_placement;
var _txtb_y = textbox_y + textbox_y_placement;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

// ---------- Draw back of Textbox ----------
draw_sprite_ext(txtb_spr,txtb_img,_txtb_x,_txtb_y,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,0,c_white,1); 
#endregion

#region Draw Options 
if draw_char == text_length[page] && page == page_number - 1
{
	// Option Selection
	option_pos += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	option_pos = clamp(option_pos, 0, option_number-1);
	
	var _op_space = 80; // Space between option boxes
	var _op_bord = 120; // Space between text and edge of box
	for (var op = 0; op < option_number; op++)
	{
		// Option Box
		var _option_width = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(txtb_spr,txtb_img,_txtb_x,_txtb_y-_op_space*option_number+_op_space*op,_option_width/txtb_spr_w,(_op_space-5)/txtb_spr_h,0,c_white,1);
		
		// Selection Arrow
		if option_pos == op
		{
			draw_sprite(sDialogSelect,0,_txtb_x+_option_width,_txtb_y-_op_space*option_number+_op_space*op);
		}
		
		// Draw Option Text
		draw_text_ext_transformed(_txtb_x + _op_bord - 50, _txtb_y - _op_space*option_number + _op_space*op + 12, option[op],line_seperation,line_width,3,3,0);
	}
	
		
}
#endregion

#region Draw Text
var _drawtext = string_copy(text[page],1,draw_char);
draw_text_ext_transformed(_txtb_x+border+8,_txtb_y+border,_drawtext,line_seperation,line_width,3,3,0);
#endregion