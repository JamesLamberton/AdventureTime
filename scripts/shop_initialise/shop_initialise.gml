// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shop_initialise(merchant){
	
	var list_to_add = ds_list_create();
	for(var i = 0; i < array_length(oStoreManager.shop_inventory); i++){
		oStoreManager.shop_inventory[i] = -1;//reset everything	
	}
	
	//choose goose - anything
	if(merchant == "ChooseGoose"){
		if(oStoreManager.current_store_stage == 0){
			oStoreManager.shop_inventory.inventory[|0] = 2;
			oStoreManager.shop_inventory.inventory[|1] = 0;
			show_debug_message("here");
			if(ds_list_find_index(oStoreManager.shop_no_no_list, 3) == -1 ){//demon blood sword
				oStoreManager.choose_goose_num[|2] = 1;
			}
			
		}else{
			
		}
	}
	//potion merchant 
	else if(merchant == "Potion Guy"){//rename potion guy appropriately
		if(oStoreManager.current_store_stage == 0){
			oStoreManager.shop_inventory.inventory[|0] = 2;
			
		}else{
			
		}
	}
	//amulet merchant
	
	//blacksmith
	
	ds_list_destroy(list_to_add);
}