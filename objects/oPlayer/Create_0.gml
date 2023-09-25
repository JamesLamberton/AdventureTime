event_inherited();

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 2;
current_speed = 0;
acc_rate = 0.151234;//make sure its a kinda weird number so he does not == 0 when changing direction
acc_sign = 1;
flag = 0;
rollspd = 3;
jump_boost = 0.5;
prev_move = 0;
jumped = 0;
rolled = 0;
roll_dir = 1;
double_jumped = 0;
roll_jump = 0;
jump_height = -5;
air_attack = 0;

hp = 25;
max_hp = hp;
level = 1;

bag = "small";
inventory = instance_create_layer(x,y,"Inventory",oInventory);
current_weapon_inventory_id = 1;
inventory.inventory[0] = current_weapon_inventory_id;//give sword
inventory.inventory[inventory.row_length - 1] = 0;//give arrows INVENTORY SLOT RESERVED
inventory.inventory[inventory.row_length - 2] = 2;//give health potion INVENTORY SLOT RESERVED



//list of sword instances
scarlet = instance_create_layer(x,y - 10,"Instances",inventory.list_of_item_object_reference[current_weapon_inventory_id]);
scarlet.inventory_index = 0;
blood_sword = -1;

potion_count = 1;
potion_max = 10;
in_inventory = 0;
in_home_inv = 0;
coin = 20;
in_shop = 0;
in_dialogue = 0;
block_dialogue = 0;

equiped_weapon_type = 1;//select melee 1, or ranged -1
melee_weapon = scarlet;
melee_weapon.weapon_in_inventory = 1;
ammo = 5;
ammo_max = 5;
ranged_projectile_height = 6;
ammo_type = oBolt;

experience = 0;
max_experience = 100;
kills = 0;

healthbar_width = 300; 
healthbar_height = 36;
healthbar_x = (320/1.85) - (healthbar_width/2); 
healthbar_y = 28;

state = "Move";

projectile_fired = 0;
targetEnter = 0;
blocking_toggle = 0;//for sprite locking
blocking = 0;
touching_ground = 1;
hit_wall_right = 0;
hit_wall_left = 0;

