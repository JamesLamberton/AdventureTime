///@arg height

function Jump(){
	var height = argument0;
	
	if ((place_meeting(x+1,y-1,oSolid)) or (place_meeting(x-1,y-1,oSolid)))
			{
				vsp = - height;
				
			}
}