key_open = keyboard_check_pressed(ord("E"));

if not instance_exists(oPlayer) exit;

if(key_open) && (!oPlayer.in_home_inv){
	
	oPlayer.in_home_inv = 1;
	oPlayer.inventory.open = 1;
	oHomeManager.home_inventory.open = 1;
	
	
}else if(key_open) && (oPlayer.in_home_inv){
	
	oPlayer.in_home_inv = 0;
	oHomeManager.home_inventory.open = 0;
	oPlayer.inventory.open = 0;
	
}