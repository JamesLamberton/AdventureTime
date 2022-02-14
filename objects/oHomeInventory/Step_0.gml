
event_inherited();
key_drop = keyboard_check_pressed(ord("Q"));

if(key_drop)&&(inventory[draw_select] != -1){
	if(inventory[draw_select] == oDemonSword.weapon_reference){
		oDemonSword.weapon_in_inventory = 0;
		oDemonSword.collision = 0;
		oDemonSword.draw_weapon_text = 0;
		oDemonSword.x = oPickUp.x;
		oDemonSword.y = oPickUp.y - 20;
		inventory[draw_select] = -1;
	}else if(inventory[draw_select] == oYellowSword.weapon_reference){
		oYellowSword.weapon_in_inventory = 0;
		oYellowSword.collision = 0;
		oYellowSword.draw_weapon_text = 0;
		oYellowSword.x = oPickUp.x;
		oYellowSword.y = oPickUp.y - 20;
		inventory[draw_select] = -1;
	}
}
