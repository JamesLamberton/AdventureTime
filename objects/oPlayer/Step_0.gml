#region Get Player Input

	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
	key_roll = keyboard_check_pressed(vk_control);
	key_inventory = keyboard_check_pressed(ord("I"));
	key_health_potion = keyboard_check_pressed(ord("H"));
	key_attack = mouse_check_button_pressed(mb_left);
	key_block = mouse_check_button_pressed(mb_right);
	key_block_stopped = mouse_check_button_released(mb_right);
	key_swap_weapon_type = keyboard_check_pressed(ord("Z"));
	key_esc = keyboard_check_pressed(vk_escape);
	
	
#endregion

#region swap weapon type Melee & Ranged
	if(key_swap_weapon_type){
		equiped_weapon_type = -equiped_weapon_type;
	}

#endregion

#region Horizontal Collision

	if (place_meeting(x+hsp,y,oSolid))
	{	
		if(sign(hsp)) && (hsp != 0){
			hit_wall_right = 1;
		}else if(!sign(hsp)) && (hsp != 0){
			hit_wall_left = 1;
		}
	}else{
		hit_wall_right = 0;
		hit_wall_left = 0;
	}
	if(hit_wall_right || hit_wall_left){
		if(sign(current_speed)) && (hit_wall_left){
			//hit left wall but moving away
			
		}else if(!sign(current_speed)) && (hit_wall_right){
			//hit right wall but moving away
		}else{
			hsp = 0;
		}
	}
	x = x + hsp;

#endregion

#region Vertical Collision

	if (place_meeting(x,y+vsp,oSolid))
	{
		vsp = 0;
		touching_ground = 1;
		jumped = 0;
		double_jumped = 0;
		roll_jump = 0;
		air_attack = 0;
		
	}else{
		touching_ground = 0;
	}
	y = y + vsp;

#endregion

#region Movement + Jumping
	var move = key_right - key_left;
	if(in_inventory) || (in_shop) || (in_dialogue) || (in_home_inv){
		move = 0;
	}
	if(rolled && touching_ground){
		move = prev_move;
	}
	
	if(move == 0){
		idle = 1;
		if(flag == 0){
			flag = 1;
			acc_sign = -prev_move;
		}
	}else{
		idle = 0;
		if(flag == 1){
			flag = 0;
			acc_sign = move;
		}
	}
	
	current_speed = acceleration(current_speed,idle,move,prev_move,acc_rate,touching_ground,walksp);
	// add jump boost if jumped
	if(!touching_ground) && (jumped) && (sign(current_speed)) && (current_speed >= walksp){
		if(rolled == 1){
			current_speed = rollspd + jump_boost;
			double_jumped = 0;
			rolled = 2;
		}else{
			
			current_speed += jump_boost;
		}
	}
	if(!touching_ground) && (jumped)&&(!sign(current_speed)) && (current_speed <= -walksp){
		if(rolled == 1){
			current_speed = -rollspd - jump_boost;
			double_jumped = 0;
			rolled = 2;
		}else{
			
			current_speed -= jump_boost;
		}
	}
	
		
	vsp = vsp + grv;
		
	if (place_meeting(x,y+1,oSolid)) and (key_jump) and (!in_inventory) and (state != "Blocking") and (!in_shop) and (!in_dialogue) and (!in_home_inv)
	{
			
		vsp = jump_height;
		jumped = 1;
			
			
	}else if (place_meeting(x,y+1,oSolid)) and (key_jump) and (!in_inventory) and (state == "Blocking") and (!in_dialogue) and (!in_home_inv)
	{
		vsp = jump_height/2;
		jumped = 1;
	}
	
	if(double_jumped == 0) && (key_jump) && (vsp != jump_height) && (!in_inventory) && (!in_shop) && (!in_dialogue) && (!in_home_inv){
		double_jumped = 1;
		vsp = jump_height;
		if(image_xscale == sign(current_speed)){
			hsp = current_speed;
		}else{
			current_speed = -current_speed;
			hsp = current_speed;
		}
		
	}
	hsp = current_speed;
	prev_move = move;
#endregion

#region dialogue toggle
	if in_dialogue && instance_exists(oTextbox){
		
		state = "Speaking";
		
	}else if(in_shop) && (key_esc) && !instance_exists(oTextbox){
		state = "Move";
		in_dialogue = 0;
		
	}else if(in_dialogue) && !instance_exists(oTextbox) && !(in_shop){
		state = "Move";
		
		in_dialogue = 0;
	}
#endregion

#region shop toggle
	if (in_shop)&& (!key_esc) && !instance_exists(oTextbox) && in_dialogue{
		oStoreManager.shop_inventory.open = 1;
		state = "Checking Shop";
		in_dialogue = 0;
		block_dialogue = 1;
		
	}else if(in_shop) && (key_esc) && !instance_exists(oTextbox){
		in_shop = 0;
		state = "Move";
		oStoreManager.shop_inventory.open = 0;
		block_dialogue = 0;
		
	}
#endregion


#region Inventory toggle
	
	if((key_inventory)&&(!in_inventory)) and (!in_shop)
	{
		state = "Checking Inventory";
	}
	
	else if((in_inventory) && (key_inventory)) and (!in_shop)
	{
		inventory.open = 0;
		state = "Move";
		in_inventory = 0;
	}
	
#endregion

#region Health Potion 
	if((key_health_potion) && (hp <= max_hp - 10) && (state != "Destroy") && (potion_count > 0)){
		hp += 10;
		potion_count--;
	}else if((key_health_potion) && (hp < max_hp) && (state != "Destroy") && (potion_count > 0)){
		hp = max_hp;
		potion_count--;
	}
	
#endregion

switch (state) // STATE MACHINE \\ 

{
	#region Move State 
	
		case "Move":
	
		if (!place_meeting(x,y+1,oSolid))
		{
			set_state_sprite(FinnJump, 1, 0);

		}
		else 
		{
			image_speed = (abs(hsp)+ walksp)/(2*walksp);
			if (hsp == 0)
			{
				image_speed = 1;		
				sprite_index = FinnIdle;			
			}
			
			else 
			{
				sprite_index = FinnMoving;
			}
		}	
		
		if (key_attack) && (equiped_weapon_type)
		{
			
			if (!touching_ground && !air_attack){
				air_attack = 1;
				state = "Attack";
			}
			else if air_attack == 1{
				state = "Move";
			}
			else if (touching_ground) && (!in_home_inv){
				state = "Attack";
			}
		}
		
		if (key_attack) && (ammo > 0) && (!equiped_weapon_type)
		{
			state = "Ranged Attack";
		}
		
		if ((key_roll and place_meeting(x,y+1,oSolid ))|| (double_jumped == 1))&&(!in_home_inv)
		{
			state = "Roll";   
			
			
			
		}
		
		if key_block
		{
			state = "Blocking";
		}
		if(jumped) && (rolled == 1){
			rolled = 1;
		}else{
			rolled = 0;
		}
		break; 
		
	
	#endregion 
	
	#region Blocking state
		case "Blocking":
			
			walksp = 0.5;
			sprite_index = FinnDefend;
			blocking = 1;
			
			if(blocking_toggle == 0){
				image_index = 0;
				blocking_toggle = 1;
			}
			if (image_index >= 4.01 && image_index <5){
				image_speed = 0;
			}
			if(key_block_stopped){
				state = "Move";
				walksp = 2;
				blocking_toggle = 0;
				blocking = 0;
			}
			
		break;
	#endregion 
	
	#region Checking Inventory state
		case "Checking Shop":
		
			in_shop = 1;
			sprite_index = FinnIdle;
			
		break;
	#endregion 
	
	#region In Dialogue state
		case "Speaking":
		
			in_dialogue = 1;
			sprite_index = FinnIdle;
			
		break;
	#endregion 
	
	#region Checking Inventory state
		case "Checking Inventory":
		
			inventory.open = 1;
			in_inventory = 1;
			sprite_index = FinnIdle;
			
		break;
	#endregion 
	
	#region Attack State 
	
		case "Attack":
			if (hsp == 0){
				hsp = 1.5;
			}
			set_state_sprite(melee_weapon.attack_sprite, 1, 0);
			if animation_hit_frame(melee_weapon.hit_frame)
			{
				finn_box = create_hitbox(x, y, self, melee_weapon.damage_sprite, melee_weapon.knockback, 4, melee_weapon.damage, image_xscale);
			}
			
			if (place_meeting(x,y+1,oSolid))
			{
				hsp = hsp*1.2; 
			}
			else
			{
				if (image_index > 2){
					hsp = hsp*1.2;
					//vsp = 0.2;
					}
				
				
			}
			if animation_end()
			{
				state = "Move";
			}
			if (image_xscale == sign(hsp)){
				
			}
			else{
				hsp = -hsp;
				current_speed = -current_speed;
			}
		break;
	
	#endregion
	
	#region Roll Attack State 
	
		case "RollAttack":
			if (hsp == 0){
				hsp = 1.5;
			}
			set_state_sprite(melee_weapon.attack_sprite, 1, 0);
	
			if animation_hit_frame(melee_weapon.hit_frame)
			{
				create_hitbox(x, y, self, melee_weapon.damage_sprite, melee_weapon.knockback, 4, melee_weapon.damage, image_xscale);
			}
	
			if (place_meeting(x,y+1,oSolid))
			{
				hsp = hsp*1.2; 
			}
			else
			{
				if (image_index > 2){
					hsp = hsp*1.2;
					//vsp = 0.2;
				}
				
				
			}
		
			if animation_end()
			{
				state = "Move";
				
			}
			double_jumped = 2;
			if (image_xscale == sign(hsp)){
				
			}
			else{
				hsp = -hsp;
				current_speed = -current_speed;
			}
		break;
	
	#endregion
	
	#region Ranged Attack State
		case "Ranged Attack":
			if(projectile_fired == 0){
				set_state_sprite(FinnAttackRanged,1,0);
				create_projectile(x, y - ranged_projectile_height,self.object_index,ammo_type,0,0,self.object_index);
			    
				projectile_fired = 1;
				ammo--;
			}
			hsp = 0;
			
			if animation_end(){
				state = "Move";
				projectile_fired = 0;
			}
		break; 
		
	#endregion
	
	#region Roll State
	
		case "Roll":
		
			set_state_sprite(FinnRoll, 1, 0);
			if(touching_ground){
				rolled = 1;
				roll_jump = 1;
				roll_dir = image_xscale;
			}
			if(double_jumped == 0){
				hsp = image_xscale*rollspd;
			}
			if animation_end()
			{
				state = "Move";
				if(roll_jump == 1){
					roll_jump = 2;
					double_jumped = 0;
				}else {
					double_jumped = 2;
				}
				
			}
			if (touching_ground){
				double_jumped = 0;
			}
			if (key_attack) && (equiped_weapon_type){
				if (!touching_ground && !air_attack){
					air_attack = 1;
					state = "RollAttack";
				}
				else if air_attack == 1{
					state = "Move";
				}
				else if (touching_ground){
					state = "RollAttack";
				}
				
			}
				
		break;
	
	#endregion

	#region Knockback State
	
		case "Knockback":
			walksp = 2;
			blocking_toggle = 0;
			projectile_fired = 0;
			
			screenshake(2,30);
			
			if(in_inventory) {
				knockback_state(FinnHurt, "Checking Inventory");
				
			}else if(blocking) {			
				knockback_state(FinnIdle, "Move");
				
			}else{
				
				knockback_state(FinnHurt, "Move");	
			}
		break;
	
	#endregion
	
	#region Destroy State
	
		case "Destroy":
			
			set_state_sprite(FinnDeath, 1, 0);
			
			if animation_end()
			{
				instance_destroy();
			}
			
		break;
	
	#endregion
}

#region Animation

	if (move != 0) {
		image_xscale = sign(move);
		facing = sign(move);
	}
	

#endregion