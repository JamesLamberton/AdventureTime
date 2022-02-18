event_inherited();

if not instance_exists(oPlayer) exit;

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
if(cant_drop){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - k)/3), "Cant Drop Equipped",0.25,0.25,0,c_red,c_red,c_red,c_red,k/75);
	k--;
	if(k < 0){
		cant_drop = 0;
		k = 100;
	}
}
