if (current[0] == "Coin"){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - i)/3), "Coin +" + string(current[1]),0.7,0.7,0,c_green,c_green,c_green,c_green,i/75);
	if (i > 0) {
		i--;

	}
	else{
		i = 0;
		current = ["",0];
	}
		
		
		
}
if (current[0] == "HealthPotion"){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - i)/3), "Health Potion +1",0.7,0.7,0,c_green,c_green,c_green,c_green,i/75);
	if (i > 0) {
		i--;
	}
	else{
		i = 0;
		current = ["",0];
	}
		
}
	
	
	
	



