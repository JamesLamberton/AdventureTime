if(stuck) {
	if(!draw_text_toggle){
		other.ammo++;
	}
	draw_text_toggle = 1;
	//instance_destroy();//get arrow back from wall
}
if(creator.object_index == oPlayer.object_index){
	exit;
}
if((object_get_name(object_get_parent(object_get_parent(creator.object_index))) == "oFriendlyTargetParent")){
	exit;//stop friendlies attacking finn
}
if(oPlayer.state == "Blocking") && (oPlayer.image_index > 2.8){
	//dont take damage if sheild out in time
	repeat(10)
	{
		instance_create_layer(other.x,other.y-12, "Effects", oHitEffect);
	}
	blocked = 1;
}else{
	if(damage_inflicted == 0) && (!blocked){
		other.hp -= damage;
		damage_inflicted = 1;
		instance_destroy();
	}
}
other.state = "Knockback";
other.knockback_speed = knockback * projectile_direction;