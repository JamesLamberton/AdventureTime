
if(collision == 0) && (!weapon_in_inventory){
	collision = 1;
	alarm[0] = 5*room_speed;
	for(var j = 0; j < oPlayer.inventory.slot_num; j++){
		if(oPlayer.inventory.inventory[j] == -1){
			//found vacant spot at j
			if(inventory_index == oPlayer.inventory.inventory[j]){
				//cant have 2 of the same weapon, shouldnt even spawn 2 ever
				break;
			}
			draw_weapon_text = 1;
			oItemTextParent.weapon = 1;
			oItemTextParent.weapontype = displayable_name;
			weapon_in_inventory  = 1;
			//list of weapons to check off
			if(inventory_index == 1){
				//scarlet added
				//oPlayer.has_scarlet = j;
				oPlayer.scarlet = self;
				oPlayer.scarlet.inventory_index = j;
			}else if(inventory_index == 3){
				//demon blood sword added
				//oPlayer.has_blood_sword = j;
				
				oPlayer.blood_sword = self;
				oPlayer.blood_sword.inventory_index = j;
				
			}
			oPlayer.inventory.inventory[j] = weapon_reference;
			break;
		}
	}
	if(j == oPlayer.inventory.slot_num){
		//did not find an empty slot
		draw_failed_pick_up = 1;
	}
}