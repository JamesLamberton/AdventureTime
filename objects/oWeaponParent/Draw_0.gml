if(weapon_in_inventory){
	image_alpha = 0;
	
}else{
	draw_self();
	image_alpha = 1;
}
if(draw_weapon_text){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - i)/3), "Piciked up " + displayable_name,0.7,0.7,0,c_green,c_green,c_green,c_green,i/75);
	i--;
	if(i == 0){
		weapon_in_inventory = 1;
		
	}
}
if(draw_failed_pick_up){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - k)/3), "No Empty Slot in Bag",0.7,0.7,0,c_red,c_red,c_red,c_red,k/75);
	k--;
}