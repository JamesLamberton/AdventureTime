/// @description UI
if not instance_exists(oPlayer)exit;

#region Draw Healthbar

//	draw_sprite(sHealthbarborder_bg,0,healthbar_x,healthbar_y);
//	draw_sprite_stretched(sHealthbar,0,healthbar_x,healthbar_y,min((hp/max_hp) * healthbar_width, healthbar_width), healthbar_height);
//	draw_sprite(sHealthbarborder,0,healthbar_x,healthbar_y);

#endregion

#region kill counter

//	draw_text_transformed(115,80,string(kills),3,3,0);
//	draw_text_transformed(20,80,"Kills: ",3,3,0);

#endregion

#region Equiped Weapon Type
	if(equiped_weapon_type == 1){
		draw_sprite_ext(melee_weapon.inventory_sprite,0,220,85,5,5,0,c_white,1);
	}else{
		draw_sprite_stretched(sCrossbowIcon,0,220,85,70,70);
	}

#endregion