event_inherited();

draw_text_transformed_colour(x + (row_length - 1)*cell_size + 2*border_size,y + (slot_num/row_length)*cell_size + 2*border_size - 1,string(oPlayer.coin),0.2,0.2,0,c_white,c_white,c_white,c_white, 1);
draw_sprite_ext(GoldCoin,0,x + (row_length - 1)*cell_size,y + (slot_num/row_length)*cell_size + border_size + bottom_border/2 + 2,0.40,0.4,0,c_white,1);

for(var i = 0; i < slot_num; i++){
	xx = x + (i mod row_length) * (cell_size + gap) - 2;
	yy = y + (i div row_length) * (cell_size + gap) - 2;
	if(i == (row_length - 1)){
		//ammo slot
		draw_sprite(sSlotLocked,0,xx,yy);
		draw_text_transformed_colour(xx + gap,yy,string(oPlayer.ammo),0.25,0.25,0,c_white,c_white,c_white,c_white, 1);
		draw_sprite(sArrowInv,0,xx - 1 + gap + ((cell_size - sprite_get_width(sArrowInv))/2),yy - 1 + gap + ((cell_size - sprite_get_height(sArrowInv))/2));
	}else if(i == (row_length - 2)){
		//health potion slot
		draw_sprite(sSlotLocked,0,xx,yy);
		draw_text_transformed_colour(xx + gap,yy,string(oPlayer.potion_count),0.25,0.25,0,c_white,c_white,c_white,c_white, 1);
		draw_sprite(sHealthPotionInv,0,xx - 1 + gap + ((cell_size - sprite_get_width(sHealthPotionInv))/2),yy - 1 + gap + ((cell_size - sprite_get_height(sHealthPotionInv))/2));
	}
	
	if(i == draw_select){
		draw_sprite(sSlotSelected,0,xx,yy);
	}
}

/*
if not instance_exists(oPlayer) exit;


draw_sprite_stretched(sInventoryBorder,0,x-6,y-6,2*border_size + row_length*(cell_size + gap),2*border_size + bottom_border + (((slot_num - 1) div row_length) + 1)*(cell_size + gap));

draw_set_font(fAdventureTime);


for(var i = 0; i < slot_num; i++){
	var xx = x + (i mod row_length) * (cell_size + gap) - 2;
	var yy = y + (i div row_length) * (cell_size + gap) - 2;
	draw_sprite(sSlot,0,xx,yy);
	
	if (inventory[i] != -1){
		var current_sprite = list_of_item_sprites[inventory[i]];
		draw_sprite(current_sprite,0,xx - 1 + gap + ((cell_size - sprite_get_width(current_sprite))/2),yy - 1 + gap + ((cell_size - sprite_get_height(current_sprite))/2));
		
		//below is specific to player inventory
		
		if(description_scarlet){
			draw_text_transformed_colour(x - 44,y,oPlayer.scarlet.displayable_name,0.5,0.5,0,c_white,c_white,c_white,c_white,1);
			draw_text_transformed_colour(x - 44,y + 8,oPlayer.scarlet.description_string,0.22,0.30,0,c_white,c_white,c_white,c_white,1);
		}else if(description_demon_sword){
			draw_text_transformed_colour(x - 44,y,oPlayer.blood_sword.displayable_name,0.32,0.5,0,c_white,c_white,c_white,c_white,1);
			draw_text_transformed_colour(x - 44,y + 8,oPlayer.blood_sword.description_string,0.22,0.30,0,c_white,c_white,c_white,c_white,1);
		}
		
		if(i == (row_length - 1)){
			//ammo slot
			draw_sprite(sSlotLocked,0,xx,yy);
			draw_text_transformed_colour(xx + gap,yy,string(oPlayer.ammo),0.5,0.5,0,c_white,c_white,c_white,c_white, 1);
			draw_sprite(current_sprite,0,xx - 1 + gap + ((cell_size - sprite_get_width(current_sprite))/2),yy - 1 + gap + ((cell_size - sprite_get_height(current_sprite))/2));
		}else if(i == (row_length - 2)){
			//health potion slot
			draw_sprite(sSlotLocked,0,xx,yy);
			draw_text_transformed_colour(xx + gap,yy,string(oPlayer.potion_count),0.5,0.5,0,c_white,c_white,c_white,c_white, 1);
			draw_sprite(current_sprite,0,xx - 1 + gap + ((cell_size - sprite_get_width(current_sprite))/2),yy - 1 + gap + ((cell_size - sprite_get_height(current_sprite))/2));
		}
		
	}
	if(i == draw_select){
		draw_sprite(sSlotSelected,0,xx,yy);
	}
	
}
//specific to player inventory

draw_text_transformed_colour(x + (row_length - 1)*cell_size + 2*border_size,y + (slot_num/row_length)*cell_size + 2*border_size - 1,string(oPlayer.coin),0.5,0.5,0,c_white,c_white,c_white,c_white, 1);
draw_sprite_ext(GoldCoin,0,x + (row_length - 1)*cell_size,y + (slot_num/row_length)*cell_size + border_size + bottom_border/2 + 2,0.40,0.4,0,c_white,1);

*/
