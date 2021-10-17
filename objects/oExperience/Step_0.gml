if !instance_exists(oPlayer) exit;
var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
var acceleration_ = 0.5;
motion_add(dir, acceleration_);
var max_speed = 3;

if speed > max_speed
{
	speed = max_speed;
}