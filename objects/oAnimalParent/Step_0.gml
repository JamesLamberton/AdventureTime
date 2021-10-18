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
		if(state == "Chase") || (wandering){
			vsp = - jump_height;
		}
	}
	
#endregion

switch (state)  // State Machine \\
{
	#region Idle State 
	
		case "Idle":
		sneaking = 0;
			if(wanderer){
				timer++;
				do_the_wander();
				
			}else{
				idle = 1;
				set_state_sprite(Idle_sprite, 1, 0);
				hsp = acceleration(current_speed,idle,facing,prev_facing,acc_rate,touching_ground,walksp);
			}
			if not instance_exists(oAnimalParent) break;
			
			var _x = x;
			x -= 10000000;//yeet it
			var closest_animal = instance_nearest(_x, y, oAnimalParent);
			var distance_to_closest_animal = 100000;
			x = _x;
			if closest_animal != id && closest_animal != noone && closest_animal.targetable && !closest_animal.sneaking
			{
				// You found an instance!
				
				distance_to_closest_animal = point_distance(x, y, closest_animal.x, closest_animal.y);
			}else{
				closest_animal = noone;
				distance_to_closest_animal = 100000;
				
			}	
			
			if distance_to_closest_animal < chase_distance && predator > closest_animal.predator
			{
				state = "Chase";	
				timer = 0;
				current_predator = -1;
			}
			if distance_to_closest_animal < flee_distance && predator < closest_animal.predator
			{
				state = "Flee";	
				timer = 0;
				current_predator = closest_animal;
				distance_to_current_predator = distance_to_closest_animal;
				
			}
			
			
		
		break;
	
	#endregion
	
	#region Sneak State
		case "Sneak":
			idle = 0;
			set_state_sprite(Sneak_sprite, 1, 0);
			prev_facing = facing;
			facing = image_xscale;
		break;
	#endregion
	
	#region Flee State
		case "Flee":
			idle = 0;
			if(touching_ground){
				set_state_sprite(Feared_sprite, 1.5, 0);
			}else{
				set_state_sprite(Jump_sprite, 1, 0);
			}
			image_xscale = current_predator.image_xscale;
			prev_facing = facing;
			facing = image_xscale;
			var _x = x;
			x -= 10000000;//yeet it
			var closest_animal = instance_nearest(_x, y, oAnimalParent);
			var distance_to_closest_animal = 100000;
			x = _x;
			if closest_animal != id && closest_animal != noone && closest_animal.targetable && !closest_animal.sneaking
			{
				// You found an instance!
				if(closest_animal != current_predator) && closest_animal.predator > predator{
					//new predator
					current_predator = closest_animal
				}
				distance_to_closest_animal = point_distance(x, y, closest_animal.x, closest_animal.y);
			}else{
				closest_animal = noone;
				distance_to_closest_animal = 100000;
				current_predator = -1;
				state = "idle";
			}	
			//fixes jumpyness of flying entities
			if(flying){
				if(((y - closest_animal.y + follow_height) > 0) &&((y - closest_animal.y + follow_height) < 1) ){
					y = y - (y - closest_animal.y + follow_height);
				}
			}
			
			if(flying){
				move_and_collide(facing * chase_speed, (-below) * flysp);
			}else{
				hsp = acceleration(current_speed,idle,facing,prev_facing,acc_rate,touching_ground,walksp);
				//move_and_collide(facing * chase_speed, 0);
			}
			
			if distance_to_closest_animal < chase_distance && predator > closest_animal.predator && distance_to_current_predator > flee_distance
			{
				state = "Chase";	
				timer = 0;
				current_predator = -1;
			}
			if distance_to_closest_animal < flee_distance && predator < closest_animal.predator
			{
				state = "Flee";	
				timer = 0;
				current_predator = closest_animal;
				distance_to_current_predator = distance_to_closest_animal;
				
			}
			
		break;
	#endregion
	
	#region Chase State
	
		case "Chase":
			idle = 0;
			if(touching_ground){
				set_state_sprite(Moving_sprite, 1.5, 0);
			}else{
				set_state_sprite(Jump_sprite, 1, 0);
			}
			if not instance_exists(oAnimalParent)
			{
				state = "Idle";
				break;
			}
			prev_facing = facing;
			facing = image_xscale;
			var _x = x;
			x -= 10000000;//yeet it
			var closest_animal = instance_nearest(_x, y, oAnimalParent);
			var distance_to_closest_animal = 100000;
			x = _x;
			if closest_animal != id && closest_animal != noone && closest_animal.targetable && !closest_animal.sneaking
			{
				// You found an instance!
				
				distance_to_closest_animal = point_distance(x, y, closest_animal.x, closest_animal.y);
				if(closest_animal.predator > predator) && (distance_to_closest_animal < flee_distance){
					state = "Flee";
					current_predator = closest_animal;
					distance_to_current_predator = distance_to_closest_animal;
				}
			}else{
				closest_animal = noone;
				distance_to_closest_animal = 100000;
				
			}	
			if not instance_exists(closest_animal)
			{
				state = "Idle";
				break;
			}
			image_xscale = sign(closest_animal.x - x);
			if image_xscale == 0
			{
				image_xscale = 1;
			}
			prev_facing = facing;
			facing = image_xscale;
			below = sign(y - closest_animal.y + follow_height);
			
			//fixes jumpyness of flying entities
			if(flying){
				if(((y - closest_animal.y + follow_height) > 0) &&((y - closest_animal.y + follow_height) < 1) ){
					y = y - (y - closest_animal.y + follow_height);
				}
			}
			
			if distance_to_closest_animal <= attack_distance && closest_animal.predator < predator
			{
				state = "Attack";	
			}
			else 
			{
				if(flying){
					move_and_collide(facing * chase_speed, (-below) * flysp);
				}else{
					hsp = acceleration(current_speed,idle,facing,prev_facing,acc_rate,touching_ground,walksp);
					//move_and_collide(facing * chase_speed, 0);
				}
			}
			
			if distance_to_closest_animal > chase_distance
			{
				state = "Idle";	
			}
		
		break;
	
	#endregion
	
	#region Jump State
		case "Jump":
			
			set_state_sprite(Jump_sprite, 1, 0);
			vsp = - jump_height;
			if(wandering){
				state = "Idle";
			}else{
				state = "Chase";
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
