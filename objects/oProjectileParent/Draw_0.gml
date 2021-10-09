draw_set_font(fAdventureTime);
if(draw_text_toggle){
    draw_text_transformed_colour(oPlayer.x,oPlayer.y - 20 - ((100 - i)/3), "Ammo +1" ,0.7,0.7,0,c_green,c_green,c_green,c_green,i/75);
    i--;
    draw_sprite_ext(self.sprite_index,0,x,y,1,1,0,c_white,0);
    if(i == 0){
        instance_destroy();

    }
}else{
    if(projectile_direction){
        draw_sprite_ext(self.sprite_index,0,x,y,1,1,0,c_white,1);
    }else{
        draw_sprite_ext(self.sprite_index,0,x,y,1,1,180,c_white,1);
    }
}