/// Textbox Parameters
depth = 0;
textbox_width = 200;
textbox_height = 64;
border = 10;
line_seperation = 12;
line_width = textbox_width - border*2;
textb_spr = sInventorySideBox;
textb_img = 0;
textb_img_spd = 6/60;

/// Text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;

draw_char = 0;
text_spd = 1;

/// Options 
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

// Effects
set_default_for_text();
last_free_space = 0;