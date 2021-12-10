if(refresh_stock == 1){
	refreshing = 0;
	refresh_stock = 0;
	if(current_store_stage == 0){
		//choose goose stock
		choose_goose_num[|0] = 3;
		choose_goose_num[|1] = 5;
		
		if(ds_list_find_index(shop_no_no_list,3) == -1){//demon blood sword
			choose_goose_num[|2] = 1;
		}
		
		
		//potion stock
		potion_num[|0] = 5;
		
	}else if(current_store_stage == 1){
		choose_goose_num[|0] = 4;
		choose_goose_num[|1] = 7;
		if(ds_list_find_index(shop_no_no_list,3) == -1 ){//demon blood sword
			choose_goose_num[|2] = 1;
		}
		
		
		//potion stock
		potion_num[|0] = 8;
	}
}else if (!refreshing){
	alarm[0] = 300*room_speed;
	refreshing = 1;
}
