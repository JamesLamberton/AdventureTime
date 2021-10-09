draw_set_font(fAdventureTime);
if(draw_value){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - i)/3), "Coin +" + string(count),0.7,0.7,0,c_green,c_green,c_green,c_green,i/75);
	i--;
	if(i == 0){
		instance_destroy();
		
	}
}else{
	draw_sprite(GoldCoin,0,x,y);
}
