shop_inventory = instance_create_layer(x,y,"Inventory",oShopInventory);

current_store_stage = 0;//different stages of the game will allow more items to be displayed
shop_no_no_list = ds_list_create();
ds_list_add(shop_no_no_list,1);

choose_goose_num = ds_list_create();
potion_num = ds_list_create();
refresh_stock = 1;
refreshing = 0;
current_owner = "Choose Goose";

for(var i = 0; i < array_length(shop_inventory.inventory); i++){
	ds_list_add(choose_goose_num,0);
	ds_list_add(potion_num,0);
}



