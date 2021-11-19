// Get Inputs 
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
enter_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// Store No. of Options
op_length = array_length(option[menu_level]); 

// Change Selection
pos += down_key - up_key; 
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};

// Pressing Options 
if enter_key 
{
	var _sml  = menu_level;
	
	switch(menu_level)
	{	
		// Pause + Menu
		case 0:
		switch(pos)
		{
			case 0:	fade_to_room(rm01, 60, c_white); break;
			
			case 1: break;
			
			case 2: menu_level = 2; break;
	
			case 3: break;
		
			case 4: game_end(); break;
		}
		break;
		
		// Options Menu
		case 2:
			switch(pos)
		{
			// Window Size
			case 0: break;
			
			// Brightness
			case 1: break;
			
			// Controls
			case 2: break;
			
			// Back
			case 3: menu_level = 0; break;
		}
		
		break;
	}
	
	if _sml != menu_level {pos = 0};
	
	// Store No. of Options
	op_length = array_length(option[menu_level]); 
	
}