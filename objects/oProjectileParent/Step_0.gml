if(stuck){
	hsp = 0;
	ysp = 0;
	grv = 0;
}else{
	repeat(1)
	{
		instance_create_layer(other.x,other.y, "Effects", particle_sprite);
	}

}

x = x + hsp;
y = y + grv + ysp;
