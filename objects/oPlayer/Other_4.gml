if (instance_exists(oDataCarrier))
{
	/*
	hp = oDataCarrier.hp;
	level = oDataCarrier.level;
	ammo = oDataCarrier.ammo;
	experience = oDataCarrier.experience;
	targetEnter = oDataCarrier.targetEnter;
	coin = oDataCarrier.coin;
	potion_count = oDataCarrier.potion_count;
	equiped_weapon_type = oDataCarrier.equiped_weapon_type;
	kills = oDataCarrier.kills;
	current_weapon_inventory_id = oDataCarrier.current_weapon_inventory_id;
	has_scarlet = oDataCarrier.has_scarlet;
	has_blood_sword = oDataCarrier.has_blood_sword;
	*/
	
	//create instances of weapons that finn has 
	/*
	if(has_scarlet != -1) {
		inventory.inventory[has_scarlet] = 1;
		scarlet = instance_create_layer(x,y - 10,"Instances",inventory.list_of_item_object_reference[1]);
		scarlet.weapon_in_inventory = 1;
		if(current_weapon_inventory_id == 1){
			melee_weapon = scarlet;
		}
	}
	if(has_blood_sword != -1){
		inventory.inventory[has_blood_sword] = 3;
		blood_sword = instance_create_layer(x,y - 10,"Instances",inventory.list_of_item_object_reference[3]);
		blood_sword.weapon_in_inventory = 1;
		if(current_weapon_inventory_id == 3){
			melee_weapon = blood_sword;
		}
	}
	*/
	hsp = 0;
	vsp = 0;
	grv = 0.3;
	walksp = 2;
	current_speed = 0;
	acc_rate = 0.151234;//make sure its a kinda weird number so he does not == 0 when changing direction
	acc_sign = 1;
	rollspd = 3;
	jump_boost = 0.5;
	prev_move = 0;
	jumped = 0;
	rolled = 0;
	double_jumped = 0;
	roll_jump = 0;
	instance_destroy(oDataCarrier);
	
	if (instance_exists(targetEnter))
	{
		x = targetEnter.x;
		y = targetEnter.y;
	}
}