if !instance_exists(oPlayer) exit;
var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
var acceleration = 0.5;
motion_add(dir, acceleration);
var max_speed = 3;

if speed > max_speed
{
	speed = max_speed;
}