if not instance_exists(creator) exit;

if(instance_exists(oPlayer)) && (other.object_index == oPlayer.object_index){
	
	exit;//handled seperetly
}
if((object_get_name(object_get_parent(creator.object_index)) == "oEnemyParent") && (object_get_name(object_get_parent(other.object_index)) == "oNeutralParent")){
	if(!other.friendly){
		exit;//stopping enemies attacking neutral enemies
	}
}

if ((object_get_name(object_get_parent(creator.object_index)) == "oFriendlyTargetParent") && (object_get_name(object_get_parent(other.object_index)) == "oNeutralParent"))
{
	
	if(other.friendly){
		if(!other.player_provokable){
			exit;//stopping finn attacking friendly neutrals that are not player provokable
		}
		
	}
	
}

if((object_get_name(object_get_parent(creator.object_index)) == "oNeutralParent") && (object_get_name(object_get_parent(other.object_index)) == "oNeutralParent")){
	if(creator.friendly){
		if(other.friendly){
			exit;//stopping friendly neutrals hitting friendly nuetrals
		}
	}
	if(!creator.friendly){
		if(!other.friendly){
			exit;//stopping enemy neutrals hitting enemy nuetrals
		}
	}
}

if ((object_get_name(object_get_parent(creator.object_index)) == "oEnemyParent") && (object_get_name(object_get_parent(other.object_index)) == "oEnemyParent"))
{
	exit;//stopping enemies attacking enemies
	
	
}
if ((object_get_name(object_get_parent(creator.object_index)) == "oFriendlyTargetParent") && (object_get_name(object_get_parent(object_get_parent(other.object_index))) == "oFriendlyTargetParent"))
{
	
	exit;//stopping finn attacking friendlies 
	
}
if ((object_get_name(object_get_parent(creator.object_index)) == "oFriendlyParent") && (object_get_name(object_get_parent(other.object_index)) == "oFriendlyParent"))
{
	
	exit;//stopping friendlies attacking friendlies
	
}
if(other.object_index == creator.object_index)
{
	
	exit;
}
if(other.state == "Blocking") && (other.image_index > 2.8){
	//dont take damage if sheild out in time
	
	repeat(10)
	{
		instance_create_layer(other.x,other.y-12, "Effects", oHitEffect);
	}
	
}else{
	
	other.hp -= damage;
	if(other.provokable){
		other.provoked = 1;
		other.target = creator.object_index;
	}
}
if(object_get_name(creator.object_index) == "oPlayer"){
	
	other.kill_counts = 1;//finn attacked allow kill to count if it kills
}else if(object_get_name(object_get_parent(creator.object_index)) == "oFriendlyParent"){
	
	other.kill_counts = 0;//ally attacked dont allow kill to count if it kills
}
other.state = "Knockback";
other.knockback_speed = knockback * projectile_direction;

if(stuck == 0){
	instance_destroy();
}