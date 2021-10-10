var i;

// change control var
mode_color = (mode_color + mode_speed) mod 1;

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

