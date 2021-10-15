var i;

// change control var
mode_color = (mode_color + mode_speed) mod 1;

#region Color Changes

// from dusk till dawn
if (mode_color = clamp(mode_color, 0, 0.25)) {
    for (var i = 0; i < 3; i ++) {
        var_color[i+9] = lerp(var_color[i+3], var_color[i], mode_color*4);
    }
}

if (mode_color = clamp(mode_color, 0.25, 0.5)) {
    for (var i = 0; i < 3; i ++) {
        var_color[i+9] = lerp(var_color[i], var_color[i+3], (mode_color-0.25)*4);
    }
}

if (mode_color = clamp(mode_color, 0.5, 0.75)) {
    for (var i = 0; i < 3; i ++) {
        var_color[i+9] = lerp(var_color[i+3], var_color[i+6], (mode_color-0.5)*4);
    }
}

if (mode_color = clamp(mode_color, 0.75, 1)) {
    for (var i = 0; i < 3; i ++) {
        var_color[i+9] = lerp(var_color[i+6], var_color[i+3], (mode_color-0.75)*4);
    }
}

#endregion
// control var - 0=dawn, 0.25=day, 0.5=sunset, 0.75=night, 1=dawn

#region Sun Control 
	/*
	if mode_color < 0.25 
	{
		layer_y("Sun", room_height - 50 - room_height*(mode_color)/0.25); // Sun Rise
	} 

	else if mode_color > 0.25 
	{
		layer_y("Sun", room_height*((mode_color-0.25)/0.25) - 230); // Sun Set
	}
	*/
	_y_sun = screen_height*sin(2*pi*mode_color - pi) + room_height/2 + screen_height_sun;//could be changed once paralax is added for y
	layer_y("Sun",_y_sun);
	

#endregion

#region Moon Control

	/*
	if mode_color < 0.75 and mode_color > 0.5
	{
		layer_y("Moon", room_height + 130 - room_height*(mode_color - 0.5)/0.25); // Moon Rise
	} 

	else if mode_color >= 0.75 or mode_color < 0.25
	{
		layer_y("Moon", room_height*((mode_color-0.75)/0.25) - 70); // Moon Set
	}
	*/
	_y_moon = screen_height*sin(2*pi*mode_color ) + room_height/2 + screen_height_moon;//could be changed once paralax is added for y
	layer_y("Moon",_y_moon);
#endregion