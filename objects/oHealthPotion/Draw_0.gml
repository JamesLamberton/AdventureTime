
draw_set_font(fAdventureTime);
if(draw_value){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - i)/3), "Health Potion +1",0.7,0.7,0,c_green,c_green,c_green,c_green,i/75);
	i--;
	if(i == 0){
		instance_destroy();
		
	}
}else{
	draw_sprite_ext(sHealthPotion,0,x,y,0.5,0.5,0,c_white,1);
}
