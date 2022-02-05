found_slot = 0;
for(var j = 0; j < oHomeManager.home_inventory.slot_num; j++){
	
	if(oHomeManager.home_inventory.inventory[j] == -1){//found empty slot
		other.weapon_in_inventory = 1;
		found_slot = 1;
		break;
	}
	
}
if(!found_slot){
	//did not find an empty slot
	draw_failed_pick_up = 1;
}
 