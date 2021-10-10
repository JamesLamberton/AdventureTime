if(stuck){
	hsp = 0;
	ysp = 0;
	grv = 0;
}else if particle_distant{
	particle_distant = 0;
	particle = instance_create_layer(other.x,other.y, "Effects", particle_sprite);
	particle.direction = 0;
	alarm[0] = 5
	

}

x = x + hsp;
y = y + grv + ysp;
