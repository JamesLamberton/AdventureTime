 // Textbox Parameters
textbox_width = room_width/1.75; // Width of textbox // 1.485 = Whole screen
textbox_x_placement = -60; 
textbox_height = room_height/1.9; // Height of textbox
textbox_y_placement = room_height/0.77;
border = 24; //  border between text and edge of textbox
line_seperation = 26; // seperation between lines of dialog
line_width = textbox_width - border*2; // How long text lines are inside dialog boxes
txtb_spr[0] = sDialogBoxBlue; // Text box sprite
txtb_img = 0;
txtb_img_spd = 0; // Speed of textbox image
text_x_offset[0] = 0;

// Text Parameters 
page = 0; // what text page we're on 
page_number = 0; // The page number 
text[0] = ""; // Actual text being displayed on the page - is array for multiple pages
text_length[0] = string_length(text[0]); // calculates how much text is on a line FOR TEXT TYPING

char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;
draw_char = 0; // dictates how many characters are being drawn in text string
text_spd = 0.5; // Speed of text being drawn

// Options
option[0] = "";
option_link_id[0] = -1; 
option_pos = 0;
option_number = 0;

setup = false;

// Sound
snd_delay = 4;
snd_count = snd_delay;

// Effects
set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;