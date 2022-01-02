
event_inherited();

if(oStoreManager.current_owner == "Choose Goose"){
	
	for(var j = 0; j < ds_list_size(oStoreManager.choose_goose_num); j++){
		
		xx = x + (j mod row_length) * (cell_size + gap) - 2;
		yy = y + (j div row_length) * (cell_size + gap) - 2;
		
		
		if(j == 0){//potion slot
			draw_sprite(sSlot,0,xx,yy);
			
			draw_text_transformed_colour(xx + gap,yy,string(oStoreManager.choose_goose_num[|0]),0.25,0.25,0,c_white,c_white,c_white,c_white, 1);
			
		}
	}	
}else {
	for(var j = 0; j < ds_list_size(oStoreManager.potion_num); j++){
		xx = x + (j mod row_length) * (cell_size + gap) - 2;
		yy = y + (j div row_length) * (cell_size + gap) - 2;
		
	}	
}
