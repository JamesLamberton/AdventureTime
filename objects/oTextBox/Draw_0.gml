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
draw_sprite_ext(textb_spr,textb_img,_txtb_x,_txtb_y,textbox_width/textb_spr_w,textbox_height/textb_spr_h,0,c_white,1);

#endregion

#region Options

if draw_char = text_length[page] && page == page_number - 1
{
	var _op_space = 15;
	var _op_bord = 4;
	for (var op = 0; op < option_number; op++)
	{
		// Draw Option Box
		var _option_width = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(textb_spr,textb_img,_txtb_x,_txtb_y-_op_space*option_number+_op_space*op,_option_width/textb_spr_w,(_op_space-1)/textb_spr_h,0,c_white,1);
		
		// Draw Option Text
		draw_text(_txtb_x+_op_bord,_txtb_y-_op_space*option_number+_op_space*op+2,option[op]);
	}
}

#endregion

#region Draw Text

var _drawtext = string_copy(text[page],1,draw_char);
draw_text_ext(_txtb_x+border,_txtb_y+border,_drawtext,line_seperation,line_width);

#endregion
