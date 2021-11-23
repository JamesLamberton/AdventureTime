if not instance_exists(oPlayer) exit;

if isOpen = true 
{
	draw_sprite_stretched_ext(sJournal,0,x-10,y-200,750,100,c_white,0.95);
	draw_sprite_stretched_ext(sJournal,0,x-10,y-80,750,600,c_white,0.95);
	
	draw_set_font(fAdventureTime);
	draw_text_transformed(x+10,y-175,"Quest: "+questNameText,1.25,1.25,0);
	draw_text_transformed_color(x+10,y-65,questDescText,1.25,1.25,0,c_black,c_black,c_black,c_black,1);
}