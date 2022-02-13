if hp <= 0
{
	state = "Destroy";
}

if place_meeting(x+hsp,y,oWall)
{
	hsp = 0;
}

if place_meeting(x,y+vsp,oWall)
{
	vsp = 0;
	touching_ground = 1;
	if self == oPlayer
	{
		jumped = 0;
		double_jumped = 0;
		roll_jump = 0;
		air_attack = 0;
	}
}
else 
{
	touching_ground = 0;
}