
event_inherited();

key_buy = mouse_check_button_pressed(mb_left);

if(key_buy) && (oPlayer.in_shop){
	
	if(inventory[draw_select] != -1){//item found
		
		if(oPlayer.coin >= list_of_item_prices[inventory[draw_select]]){
			
			oPlayer.coin -= list_of_item_prices[inventory[draw_select]];
			if(list_of_item_object_reference[inventory[draw_select]] == oBolt){
				oPlayer.ammo++;
				if(oStoreManager.current_owner == "Choose Goose"){
					oStoreManager.choose_goose_num[|draw_select]--;
				}
				
			}else if(list_of_item_object_reference[inventory[draw_select]] == oHealthPotion){
				oPlayer.potion_count++;
				if(oStoreManager.current_owner == "Choose Goose"){
					oStoreManager.choose_goose_num[|draw_select]--;
				}
			}
		}
		
	}
}