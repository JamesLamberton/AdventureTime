if not instance_exists(oPlayer) exit;

if(open == 1){
	depth = 0;
	key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	key_equip = keyboard_check_pressed(ord("E"));
	x = lerp(oPlayer.x,oPlayer.x, 0.5) - 25;
	y = lerp(oPlayer.y,oPlayer.y, 0.5) - 70;
	if(first_open){
		draw_select = 0;
		first_open = 0;
	}
	if(key_left){
		draw_select--;
		for(var i = 0; i <= (INVENTORY_SLOTS_SMALL/row_length - 1); i++){
			if(draw_select == (i*row_length - 1)){
				draw_select = (i+1)*row_length - 1;
				break;
			}
		}
	}else if(key_right){
		draw_select++;
		for(var i = 1; i <= (INVENTORY_SLOTS_SMALL/row_length); i++){
			if(draw_select == (i*row_length)){
				draw_select = (i-1)*row_length;
			}
		}
	}else if(key_up){
		draw_select = draw_select - row_length;
		 
		if(draw_select < 0){
			draw_select = INVENTORY_SLOTS_SMALL + draw_select;
		}
		
	}else if(key_down){
		draw_select = draw_select + row_length;
		if(draw_select > INVENTORY_SLOTS_SMALL - 1){
			draw_select = draw_select - INVENTORY_SLOTS_SMALL;
		}
	}
	
	if(inventory[draw_select] != -1){
		
		var selected_item = list_of_item_object_reference[inventory[draw_select]];
		if(selected_item == oYellowSword ) ||(selected_item == oDemonSword ){
			//can equip item is weapon
			equip_enable = 1;
			
			if(key_equip){
				if (oPlayer.blood_sword != -1) && (draw_select == oPlayer.blood_sword.inventory_index){
					//item is blood_sword
					oPlayer.melee_weapon.inventory_index = oPlayer.blood_sword.inventory_index;
					oPlayer.blood_sword.inventory_index = 0;//set as main weapon index
					oPlayer.inventory.inventory[0] = oPlayer.blood_sword.weapon_reference;
					oPlayer.inventory.inventory[oPlayer.melee_weapon.inventory_index] = oPlayer.melee_weapon.weapon_reference;
					oPlayer.melee_weapon = oPlayer.blood_sword;
					
				}else if (oPlayer.scarlet != -1) && (draw_select == oPlayer.scarlet.inventory_index){
					//item is scarlet
					oPlayer.melee_weapon.inventory_index = oPlayer.scarlet.inventory_index;
					oPlayer.scarlet.inventory_index = 0;//set as main weapon index
					oPlayer.inventory.inventory[0] = oPlayer.scarlet.weapon_reference;
					oPlayer.inventory.inventory[oPlayer.melee_weapon.inventory_index] = oPlayer.melee_weapon.weapon_reference;
					oPlayer.melee_weapon = oPlayer.scarlet;
				}
			}
		
		}else{
			equip_enable = 0;
		}
	}else{
		equip_enable = 0;
	}
	
	
}else{
	depth = 1400;
	draw_select = -1;
	first_open = 1;
}