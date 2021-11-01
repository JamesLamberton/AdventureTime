accept_key = keyboard_check_pressed(ord("E"));

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 100;

#region Setup
if setup == false 
{
	setup = true;
	draw_set_font(fAdventureTime);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// Loop through pages
	page_number = array_length(text);
	
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
			instance_destroy(); 
		}
	}
	else // If not done typing
	{
		draw_char = textlength[page];
	}
}
#endregion

#region Draw Textbox 
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

// ---------- Draw back of Textbox ----------
draw_sprite_ext(txtb_spr,txtb_img,textbox_x+text_x_offset[page]+texbox_x_placement,textbox_y+texbox_y_placement,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,0,c_white,1); 

// ---------- Draw Text ----------
var _drawtext = string_copy(text[page],1,draw_char);
draw_text_ext_transformed(textbox_x+text_x_offset[page]+texbox_x_placement+border,textbox_y+texbox_y_placement+border,_drawtext,line_seperation,line_width,3,3,0);
#endregion