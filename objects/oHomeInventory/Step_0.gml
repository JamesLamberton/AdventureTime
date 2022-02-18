
event_inherited();

if (mouse_x > oPlayer.inventory.right_wall){
	home_or_personal = -1
}else {
	home_or_personal = 1;
}
key_drop = keyboard_check_pressed(ord("Q"));

if(key_drop)&&(inventory[draw_select] != -1) && (home_or_personal == -1){
	if(inventory[draw_select] == oDemonSword.weapon_reference){
		
		found_slot = 0;
		for(var j = 0; j < oPlayer.inventory.slot_num; j++){
	
			if(oPlayer.inventory.inventory[j] == -1){//found empty slot
				found_slot = 1;
				break;
			}
		
		}
		if(!found_slot){
			//did not find an empty slot
			draw_failed_pick_up = 1;
		}else{
			//found one at j
			
			oPlayer.inventory.inventory[j] = oHomeManager.home_inventory.blood_sword.weapon_reference;
			oHomeManager.home_inventory.blood_sword.inventory_index = j;
			oHomeManager.home_inventory.blood_sword.draw_weapon_text = 0;
			oPlayer.blood_sword = oHomeManager.home_inventory.blood_sword;
			oHomeManager.home_inventory.blood_sword = -1;
			oHomeManager.home_inventory.inventory[draw_select] = -1;
		}
		
	}else if(inventory[draw_select] == oYellowSword.weapon_reference){
		found_slot = 0;
		for(var j = 0; j < oPlayer.inventory.slot_num; j++){
	
			if(oPlayer.inventory.inventory[j] == -1){//found empty slot
				found_slot = 1;
				break;
			}
		
		}
		if(!found_slot){
			//did not find an empty slot
			draw_failed_pick_up = 1;
		}else{
			//found one at j
			
			oPlayer.inventory.inventory[j] = oHomeManager.home_inventory.scarlet.weapon_reference;
			oHomeManager.home_inventory.scarlet.inventory_index = j;
			oHomeManager.home_inventory.scarlet.draw_weapon_text = 0;
			oPlayer.scarlet = oHomeManager.home_inventory.scarlet;
			oHomeManager.home_inventory.scarlet = -1;
			oHomeManager.home_inventory.inventory[draw_select] = -1;
		}
		
	}
}
