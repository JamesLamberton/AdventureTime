// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shop_initialise(merchant){
	
	var list_to_add = ds_list_create();
	for(var i = 0; i < array_length(oStoreManager.shop_inventory); i++){
		oStoreManager.shop_inventory[i] = -1;//reset everything	
	}
	
	//choose goose - anything
	if(merchant == "ChooseGoose-TradeYes"){
		if(oStoreManager.current_store_stage == 0){
			oStoreManager.shop_inventory.inventory[0] = 2;
			oStoreManager.shop_inventory.inventory[1] = 0;
			
			
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