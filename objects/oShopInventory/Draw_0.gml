
event_inherited();

if(oStoreManager.current_owner == "Choose Goose"){
	
	for(var i = 0; i < ds_list_size(oStoreManager.choose_goose_num); i++){
		
		xx = x + (i mod row_length) * (cell_size + gap) - 2;
		yy = y + (i div row_length) * (cell_size + gap) - 2;
		
		if(i == 0){//potion slot
			draw_text_transformed_colour(xx + gap,yy,string(oStoreManager.choose_goose_num[|0]),0.25,0.25,0,c_white,c_white,c_white,c_white, 1);
			
		}
	}	
}else {
	for(var i = 0; i < ds_list_size(oStoreManager.potion_num); i++){
		xx = x + (i mod row_length) * (cell_size + gap) - 2;
		yy = y + (i div row_length) * (cell_size + gap) - 2;
	}	
}
