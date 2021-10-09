if(object_get_name(self.object_index) == "oBolt"){
	stuck = 1;// only arrows get stuck
}
if(!stuck){
	if (place_meeting(x,y-3,oSolid))
	{
		instance_destroy();
	}
	
}