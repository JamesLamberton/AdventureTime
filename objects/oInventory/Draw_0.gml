if not instance_exists(oPlayer) exit;

//must un hard code below
draw_sprite_stretched(sInventoryBorder,0,x-6,y-6,2*border_size + row_length*(cell_size + gap),2*border_size + bottom_border + (((INVENTORY_SLOTS_SMALL - 1) div row_length) + 1)*(cell_size + gap));
draw_sprite_stretched(sInventorySideBox,0,x - 48, y - 6,40,2*border_size + bottom_border + (((INVENTORY_SLOTS_SMALL - 1) div row_length) + 1)*(cell_size + gap));
draw_set_font(fAdventureTime);

if(equip_enable){//must un hard code below
	draw_text_transformed_colour(x - 42,y + 40,"Equip by pressing",0.1,0.1,0,c_white,c_white,c_white,c_white, 1);
	draw_sprite_stretched(sSlot,0,x - 18,y + 37,8,8);
	draw_text_transformed_colour(x - 15,y + 38,"E",0.1,0.1,0,c_white,c_white,c_white,c_white, 1);
}

for(var i = 0; i < INVENTORY_SLOTS_SMALL; i++){
	var xx = x + (i mod row_length) * (cell_size + gap) - 2;
	var yy = y + (i div row_length) * (cell_size + gap) - 2;
	draw_sprite(sSlot,0,xx,yy);
	
	if (inventory[i] != -1){
		var current_sprite = list_of_item_sprites[inventory[i]];
		draw_sprite(current_sprite,0,xx - 1 + gap + ((cell_size - sprite_get_width(current_sprite))/2),yy - 1 + gap + ((cell_size - sprite_get_height(current_sprite))/2));
		
		if(description_scarlet){
			draw_text_transformed_colour(x - 44,y,oPlayer.scarlet.displayable_name,0.5,0.5,0,c_white,c_white,c_white,c_white,1);
			draw_text_transformed_colour(x - 44,y + 8,oPlayer.scarlet.description_string,0.22,0.30,0,c_white,c_white,c_white,c_white,1);
		}else if(description_demon_sword){
			draw_text_transformed_colour(x - 44,y,oPlayer.blood_sword.displayable_name,0.32,0.5,0,c_white,c_white,c_white,c_white,1);
			draw_text_transformed_colour(x - 44,y + 8,oPlayer.blood_sword.description_string,0.22,0.30,0,c_white,c_white,c_white,c_white,1);
		}else{
			
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

draw_text_transformed_colour(x + (row_length - 1)*cell_size + 2*border_size,y + (INVENTORY_SLOTS_SMALL/row_length)*cell_size + 2*border_size - 1,string(oPlayer.coin),0.5,0.5,0,c_white,c_white,c_white,c_white, 1);
draw_sprite_ext(GoldCoin,0,x + (row_length - 1)*cell_size,y + (INVENTORY_SLOTS_SMALL/row_length)*cell_size + border_size + bottom_border/2 + 2,0.40,0.4,0,c_white,1);
draw_text_transformed_colour(x , y + (INVENTORY_SLOTS_SMALL/row_length)*cell_size + 2*border_size - 1, "LvL",0.5,0.5,0,c_white,c_white,c_white,c_white, 1);
draw_text_transformed_colour(x + border_size + cell_size/2 ,y + (INVENTORY_SLOTS_SMALL/row_length)*cell_size + 2*border_size - 1 ,string(oPlayer.level),0.5,0.5,0,c_white,c_white,c_white,c_white, 1);
