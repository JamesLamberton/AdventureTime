// Textbox Parameters
textbox_width = room_width/1.485; // Width of textbox
texbox_x_placement = -35; 
textbox_height = room_height/1.9; // Height of textbox
texbox_y_placement = room_height/0.77;
border = 20; //  border between text and edge of textbox
line_seperation = 12; // seperation between lines of dialog
line_width = textbox_width - border*2; // How long text lines are inside dialog boxes
txtb_spr = sDialogBox; // Text box sprite
txtb_img = 0;
txtb_img_spd = 0; // Speed of textbox image

// Text Parameters
page = 0; // what text page we're on
page_number = 0; // The page number
text[0] = "Heres a bit of text"; // Actual text being displayed on the page - is array for multiple pages
text[1] = "Heres some more text";
text_length[0] = string_length(text[0]); // calculates how much text is on a line FOR TEXT TYPING
draw_char = 0; // dictates how many characters are being drawn in text string
text_spd = 1; // Speed of text being drawn

setup = false;
