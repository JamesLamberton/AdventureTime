if creator == noone or creator == other or ds_list_find_index(hit_objects, other.object_index) != -1
{
	exit;
	
}

if ((object_get_name(object_get_parent(creator.object_index)) == "oEnemyParent") && (object_get_name(object_get_parent(other.object_index)) == "oEnemyParent"))
{
	exit;//stopping enemies attacking other enemies
	
}
if ((object_get_name(object_get_parent(creator.object_index)) == "oFriendlyTargetParent") && (object_get_name(object_get_parent(object_get_parent(other.object_index))) == "oFriendlyTargetParent"))
{
	exit;//stopping finn attacking friendlies 
	
}

if ((object_get_name(object_get_parent(object_get_parent(creator.object_index))) == "oFriendlyTargetParent") && (object_get_name(object_get_parent(other.object_index)) == "oFriendlyTargetParent"))
{
	exit;//stopping finn getting attacked by friendlies 
	
}
if ((object_get_name(object_get_parent(creator.object_index)) == "oFriendlyParent") && (object_get_name(object_get_parent(other.object_index)) == "oFriendlyParent"))
{
	exit;//stopping friendlies attacking friendlies
	
}

if(other.state == "Blocking") && (other.image_index > 2.8){
	//dont take damage if sheild out in time
	repeat(10)
	{
		instance_create_layer(other.x,other.y-12, "Effects", oHitEffect);
	}
}else{
	other.hp -= damage;
}

if(object_get_name(creator.object_index) == "oPlayer"){
	other.kill_counts = 1;//finn attacked allow kill to count if it kills
}else if(object_get_name(object_get_parent(creator.object_index)) == "oFriendlyParent"){
	other.kill_counts = 0;//ally attacked dont allow kill to count if it kills
}

ds_list_add(hit_objects, other.object_index);
other.state = "Knockback";
other.knockback_speed = knockback * image_xscale;
other.image_xscale = -image_xscale;
