if not instance_exists(oPlayer) exit;

if(open == 1){
	depth = 0;
	
	if(oPlayer.in_home_inv){
		if(self.type == "Home"){
			x = lerp(oPlayer.x,oPlayer.x, 0.5) - 22 + 0.5*(object_get_sprite(oPlayer.inventory).sprite_width);
		}else if(self.type == "Finns"){
			x = lerp(oPlayer.x,oPlayer.x, 0.5) - 28 - 0.5*(object_get_sprite(oPlayer.inventory).sprite_width);
		}else{
			x = lerp(oPlayer.x,oPlayer.x, 0.5) - 25;
		}
		
	}else{
		x = lerp(oPlayer.x,oPlayer.x, 0.5) - 25;
	}
	
	y = lerp(oPlayer.y,oPlayer.y, 0.5) - 70;
	
	if(first_open){
		draw_select = 0;
		first_open = 0;
	}
	
	
	for(var i = 0; i < slot_num; i++){
		left_wall = (x + (i mod row_length) * (cell_size + gap) - 2);
		right_wall = left_wall + cell_size - 1;
		upper_wall = (y + (i div row_length) * (cell_size + gap) - 2);
		lower_wall = upper_wall + cell_size - 1;
		if(mouse_x >= left_wall) && (mouse_x <= right_wall) && (mouse_y >= upper_wall) && (mouse_y <= lower_wall){
			draw_select = i;
		}
	}
	
	if(inventory[draw_select] != -1){
		
		var selected_item = list_of_item_object_reference[inventory[draw_select]];
		if(selected_item == oYellowSword ) ||(selected_item == oDemonSword ){
			//can equip item is weapon
			
			/*
			if (oPlayer.blood_sword != -1) && (draw_select == oPlayer.blood_sword.inventory_index){
				description_demon_sword = 1;
				description_scarlet = 0;
			}else if (oPlayer.scarlet != -1) && (draw_select == oPlayer.scarlet.inventory_index){
				description_scarlet = 1;
				description_demon_sword = 0;
			}
			*/
			/*
			if(key_equip){
				if (oPlayer.blood_sword != -1) && (draw_select == oPlayer.blood_sword.inventory_index){
					//item is blood_sword
					oPlayer.melee_weapon.inventory_index = oPlayer.blood_sword.inventory_index;
					oPlayer.blood_sword.inventory_index = 0;//set as main weapon index
					oPlayer.inventory.inventory[0] = oPlayer.blood_sword.weapon_reference;
					oPlayer.inventory.inventory[oPlayer.melee_weapon.inventory_index] = oPlayer.melee_weapon.weapon_reference;
					oPlayer.melee_weapon = oPlayer.blood_sword;
					
					
				}else if (oPlayer.scarlet != -1) && (draw_select == oPlayer.scarlet.inventory_index){
					//item is scarlet
					oPlayer.melee_weapon.inventory_index = oPlayer.scarlet.inventory_index;
					oPlayer.scarlet.inventory_index = 0;//set as main weapon index
					oPlayer.inventory.inventory[0] = oPlayer.scarlet.weapon_reference;
					oPlayer.inventory.inventory[oPlayer.melee_weapon.inventory_index] = oPlayer.melee_weapon.weapon_reference;
					oPlayer.melee_weapon = oPlayer.scarlet;
					
				}
			}
			*/
		
		}else{
			
			description_demon_sword = 0;
			description_scarlet = 0;
			
		}
	}else{
		
		description_demon_sword = 0;
		description_scarlet = 0;
	}
	
	
}else{
	depth = 2000;
	draw_select = 0;
	first_open = 1;
}