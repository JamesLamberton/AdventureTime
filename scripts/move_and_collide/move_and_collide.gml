function move_and_collide()
{
	
	if not place_meeting(x + argument0, y, oSolid)
		{
			x += argument0; 
		}
			
	if not place_meeting(x, y + argument1, oSolid)
		{
			y += argument1; 
		}	
	
} 