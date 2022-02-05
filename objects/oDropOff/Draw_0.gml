draw_self();
if(draw_failed_pick_up){
	draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - k)/3), "No Empty Slot in Bag",0.7,0.7,0,c_red,c_red,c_red,c_red,k/75);
	k--;
}