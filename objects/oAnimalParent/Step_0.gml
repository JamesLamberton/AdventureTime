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
			
			if distance_to_closest_animal < 250 && predator > closest_animal.predator
			{
				state = "Chase";	
				timer = 0;
			}
			if distance_to_closest_animal < 200 && predator < closest_animal.predator
			{
				state = "Flee";	
				timer = 0;
			}
			
			
		
		break;
	
	#endregion
	
	#region Sneak State
		case "Sneak":
			set_state_sprite(Sneak_sprite, 1, 0);
			facing = image_xscale;
		break;
	#endregion
	
	#region Flee State
		case "Flee":
			if(touching_ground){
				set_state_sprite(Moving_sprite, 1, 0);
			}else{
				set_state_sprite(Jump_sprite, 1, 0);
			}
			facing = image_xscale;
		break;
	#endregion
	
	#region Chase State
	
		case "Chase":
		
			if(touching_ground){
				set_state_sprite(Moving_sprite, 1, 0);
			}else{
				set_state_sprite(Jump_sprite, 1, 0);
			}
			if not instance_exists(oAnimalParent)
			{
				state = "Idle";
				break;
			}
			
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
			}else{
				closest_animal = noone;
				distance_to_closest_animal = 100000;
				
			}	
			image_xscale = sign(closest_animal.x - x);
			if image_xscale == 0
			{
				image_xscale = 1;
			}
			facing = image_xscale;
			below = sign(y - closest_animal.y + follow_height);
			
			//fixes jumpyness of flying entities
			if(flying){
				if(((y - closest_animal.y + follow_height) > 0) &&((y - closest_animal.y + follow_height) < 1) ){
					y = y - (y - closest_animal.y + follow_height);
				}
			}
			
			if distance_to_closest_animal <= attack_distance
			{
				state = "Attack";	
			}
			else 
			{
				if(flying){
					move_and_collide(facing * walksp, (-below) * flysp);
				}else{
					move_and_collide(facing * walksp, 0);
				}
			}
			
			if distance_to_closest_animal > 250
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
