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

#region Sun Control 

	layer_y("Sun", room_height - room_height*(mode_color)/0.25);

	if mode_color < 0.25 
	{
		layer_y("Sun", room_height - room_height*(mode_color)/0.25);
	} 

	else if mode_color >= 0.25 
	{
		layer_y("Sun", room_height*((mode_color-0.25)/0.25));
	}

#endregion

#region Moon Control

	layer_y("Moon", room_height - room_height*(mode_color)/1);

	if mode_color < 1 
	{
		layer_y("Moon", room_height - room_height*(mode_color)/1);
	} 

	else if mode_color >= 0.25
	{
		layer_y("Moon", room_height*((mode_color-0.25)/0.25));
	}

#endregion