if (goldCoin > 0){
	ds_queue_enqueue(item_text_queue,["Coin",goldCoinCount]);
	goldCoin = 0;
	goldCoinCount = 0;
}
if (healthPotion > 0){
	ds_queue_enqueue(item_text_queue,["HealthPotion",healthPotionCount]);
	healthPotion = 0;
}
if (weapon > 0){
	ds_queue_enqueue(item_text_queue,["Weapon",weapontype]);
	weapon = 0;
}
if (ammo > 0){
	ds_queue_enqueue(item_text_queue,["Ammo",ammoCount]);
	ammo = 0;
	ammoCount = 0;
}
if !ds_queue_empty(item_text_queue) && (timer == 1){
	timer = 0;
	item = instance_create_layer(0, 0, "Instances", oItemText)
	item.current = ds_queue_dequeue(item_text_queue);
	alarm[0] = 0.3*room_speed;
	
}