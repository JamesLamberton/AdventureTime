if not instance_exists(oPlayer)exit;

//window_set_fullscreen(true);

// Update Camera Position
x += (xTo - x)/25;
y += (yTo - y)/25;

// Keep Camera following oPlayer
x = clamp(x,view_w_half+buff,room_width-view_w_half);
y = clamp(y,view_h_half+buff,room_height-view_h_half);

// Screen Shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y - 35;
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);