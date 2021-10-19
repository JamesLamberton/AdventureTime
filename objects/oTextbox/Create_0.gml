// Messages
messages = ds_list_create(); // Store Textbox Messages in Array
messageID = 0; // Stores current message number 

messageText = ""; // Stores Text in string
messageChar = 0; // Stores string character count
messageSpeed = 0.3; // Speed text is typed 

enum MSG {TEXT, NAME, IMAGE} //

// Gui Dimensions
var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

// Text Dimensions 
height = floor(_guiH * 0.30); // Height of GUI element (45% of gui height), floored to avoid decimel numbers
width = _guiW; 

// position on screen
x = 0;
y = _guiH - height;

// other properties
padding = 22;