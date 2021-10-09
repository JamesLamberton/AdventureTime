#region Horizontal Collisions 

	if (place_meeting(x+hsp,y,oSolid))
		{
			
			hsp = 0;
		}

x = x + hsp;
	
#endregion

#region Vertical Collisions 
	
	if (place_meeting(x,y+vsp,oSolid))
	{
		vsp = 0;
		touching_ground = 1;
	}else{
		touching_ground = 0;
	}

y = y + vsp;

vsp = vsp + grv;
	
#endregion

#region Jump Condition
	
	if ((place_meeting(x+1,y-1,oSolid)) or (place_meeting(x-1,y-1,oSolid)))
	{
		if(state == "Chase"){
			vsp = - jump_height;
		}
	}
	
#endregion

switch (state)  // State Machine \\
{
	#region Idle State 
	
		case "Idle":
		
			if(wanderer){
				timer++;
				if(timer > 4*room_speed) && (timer <= 6*room_speed){
					//wander one way
					wandering = 1;
					toggle = 0;
					move_and_collide(facing * walksp, 0);
					if(touching_ground){
						set_state_sprite(Moving_sprite, 1, 0);
					}else{
						set_state_sprite(Jump_sprite, 1, 0);
					}
				}else if(timer > 6*room_speed) && (timer <= 10*room_speed){
					//idle again
					set_state_sprite(Idle_sprite, 1, 0);
					wandering = 0;
					if(toggle == 0){
						facing = - facing;
						image_xscale = -image_xscale;
						toggle = 1;
					}
				}else if(timer > 10*room_speed) && (timer <= 12*room_speed){
					//wander the other way
					wandering = 1;
					toggle = 0;
					move_and_collide(facing * walksp, 0);
					if(touching_ground){
						set_state_sprite(Moving_sprite, 1, 0);
					}else{
						set_state_sprite(Jump_sprite, 1, 0);
					}
					
				}else if(timer > 12*room_speed){
					set_state_sprite(Idle_sprite, 1, 0);
					wandering = 0;
					timer = 0;
					facing = - facing;
					image_xscale = -image_xscale;
				}
			}else{
				set_state_sprite(Idle_sprite, 1, 0);
			}
			if not instance_exists(oEnemyParent) break;
			
			var closest_enemy = instance_nearest(x,y,oEnemyParent);
			var distance_to_closest_enemy = point_distance(x, y, closest_enemy.x, closest_enemy.y);
			if (distance_to_closest_enemy < 250) && provoked
			{
				state = "Chase";	
			}
			
		
		break;
	
	#endregion
	
	
	#region Chase State
	
		case "Chase":
		
			if(touching_ground){
				set_state_sprite(Moving_sprite, 1, 0);
			}else{
				set_state_sprite(Jump_sprite, 1, 0);
			}
			if not instance_exists(oEnemyParent) break;
			
			facing = image_xscale;
			var closest_enemy = instance_nearest(x,y,oEnemyParent);
			var distance_to_closest_enemy = point_distance(x, y, closest_enemy.x, closest_enemy.y);
			image_xscale = sign(closest_enemy.x - x);
			if image_xscale == 0
			{
				image_xscale = 1;
			}
			facing = image_xscale;
			below = sign(y - closest_enemy.y + follow_height);
			
			//fixes jumpyness of flying entities
			if(flying){
				if(((y - closest_enemy.y + follow_height) > 0) &&((y - closest_enemy.y + follow_height) < 1) ){
					y = y - (y - closest_enemy.y + follow_height);
				}
			}
			
			if distance_to_closest_enemy <= attack_distance
			{
				if(ranged_flag == 1){
					if(projectile_fired == 1){
						if(((power((y - closest_enemy.y),2)) + (power((x - closest_enemy.x),2))) > power((attack_distance)*0.8,2)){
							move_and_collide( 0, (-below) * flysp);
						}else{
							move_and_collide( -facing * walksp, (-below) * flysp);
						}
						move_and_collide(-facing * walksp, (-below) * flysp);
					}else{
						state = "Ranged Attack";
					}
				}else{
					state = "Attack";	
				}
					
			}
			else 
			{
				if(flying){
					move_and_collide(facing * walksp, (-below) * flysp);
				}else{
					move_and_collide(facing * walksp, 0);
				}
			}
			
			if distance_to_closest_enemy > 250
			{
				state = "Idle";	
			}
		
		break;
	
	#endregion
	
	#region Jump State
		case "Jump":
			
			set_state_sprite(Jump_sprite, 1, 0);
			vsp = - jump_height;
			if(provoked){
				state = "Chase";
			}else{
				state = "Idle";
			}
			
		break;
	#endregion
	
	
	#region Attack State 
	
		case "Attack":
		
			hsp = 0
			set_state_sprite(Attack_sprite, 1, 0);
			
			if animation_hit_frame(hit_frame)
			{
				create_hitbox(x, y, self, Damage_sprite, 4, 4, attack_damage, image_xscale);
			}
	
			if animation_end()
			{
				state = "Chase";
				image_index = 0;
			}
			
		break;
	
	#endregion
	
	#region Ranged Attack State
		case "Ranged Attack":
			
			if not instance_exists(oEnemyParent) break;
			
			var closest_enemy = instance_nearest(x,y,oEnemyParent);
			if((last_instance == -1) or (last_instance == closest_enemy.object_index) or (last_facing == facing)){
				closest_target_hsp = closest_enemy.x - last_step_x;
				closest_target_vsp = closest_enemy.y - last_step_y;
				last_step_x = closest_enemy.x;
				last_step_y = closest_enemy.y;
			}else{
				closest_target_hsp = 0;
				closest_target_vsp = 0;
				last_step_x = closest_enemy.x;
				last_step_y = closest_enemy.y;
			}
			last_instance = closest_enemy.object_index;
			last_facing = facing;
			var distance_to_closest_enemy = point_distance(x, y, closest_enemy.x, closest_enemy.y);
			set_state_sprite(Ranged_sprite,1,0);
			
			if(projectile_fired == 0){
				
				create_projectile(x, y - ranged_projectile_height,self.object_index,ammo_type,abs(x - closest_enemy.x),(closest_enemy.y - y),distance_to_closest_enemy,closest_target_hsp,closest_target_vsp,closest_enemy.object_index);
				projectile_fired = 1;
			}
			hsp = 0;
			
			if animation_end(){
				state = "Chase";
				projectile_fired = 0;
			}
		break; 
		
	#endregion
	
	#region Knockback State
	
		case "Knockback":
		
			knockback_state(Hurt_sprite, "Chase");
			
		break;
	
	#endregion
	
	#region Destroy State
	
		case "Destroy":
	
			set_state_sprite(Death_sprite, 1, 0);
		
			if animation_end()
			{
				instance_destroy();
			}
	
		break;
	
	#endregion
}
