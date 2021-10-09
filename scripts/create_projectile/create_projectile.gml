///@arg x
///@arg y
///@arg creator
///@arg projectile_type
///@arg x_target
///@arg y_target
///@arg attack_range
///@arg hsp_target
///@arg vsp_target
///@arg object_index_target
function create_projectile(){
	var x_position = argument0;
	var y_position = argument1;
	var creator = argument2;
	var projectile_type = argument3;//obj
	var x_target = argument4;
	var y_target = argument5;
	var attack_range = argument6;
	var hsp_target = argument7;
	var vsp_target = argument8;
	var target_obj = argument9;

	if not instance_exists(oFriendlyTargetParent) exit;
	var projectile = instance_create_layer(x_position,y_position,"Instances",projectile_type);
	projectile.creator = creator;
	projectile.projectile_direction = creator.facing;
	
	
	if(creator == oPlayer){
		projectile.initial_ysp = -0.25;//for finn exlcusively
	}else{
		//npc shooting
		if instance_exists(oPlayer) && (target_obj.object_index == oPlayer.object_index){
			y_target = y_target;
			x_target = x_target;
		}else if(creator.facing == 1){
			y_target = y_target + 0.25*vsp_target;
			x_target = x_target + 0.30*hsp_target;
		}else{
			y_target = y_target + 0.25*vsp_target;
			x_target = x_target - 0.40*hsp_target;
		}
		
		projectile.initial_ysp = (y_target/attack_range)*projectile.velocity - 0.6;
		projectile.initial_hsp = (x_target/attack_range)*projectile.velocity;
		var speed_correction = (power(projectile.velocity,2))/((power(projectile.initial_ysp,2)) + (power(projectile.initial_hsp,2)));
		projectile.initial_ysp = speed_correction*projectile.initial_ysp;
		projectile.initial_hsp = speed_correction*projectile.initial_hsp;
		
	}
	
}