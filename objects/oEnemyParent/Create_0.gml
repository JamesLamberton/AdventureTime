
event_inherited();

//all place holders
Idle_sprite = SkeletonIdle;
Attack_sprite = SkeletonAttack;
Moving_sprite = SkeletonWalk;
Damage_sprite = SkeletonAttackDamage;
Ranged_sprite = SkeletonReact;
Jump_sprite = SkeletonReact;
Feared_sprite = SkeletonReact;
Hurt_sprite = SkeletonHit;
Death_sprite = SkeletonDead;

ranged_flag = 0;//used to determine if instance is ranged or not
ranged_projectile_height = 6;
projectile_fired = 0;
ammo_type = oBolt;

last_step_x = 0;//these are used for determining speed of target
last_step_y = 0;
closest_target_hsp = 0;
closest_target_vsp = 0;
last_instance = 0;
last_facing = 0;


flying = 0;
below = -1;
follow_height = 45;


attack_distance = 32;
attack_damage = 10;
hit_frame = 7;

hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.5;
flysp = 0.7;
jump_height = 2.5;
idle_distance = 250;

hp = 15;
max_hp = hp;
flash = 0;
experience = 0;
coin = 0;//used to store object coin when created
coin_dropped = 0;
kill_counts = 1;//to decide if we should count the kill for this death for Finn
item_dropped = 0;
chance_of_drop = 0.2;//portion of 1 of dropping item
drop = 0;//used to store object that is dropped
chance_evaluated = 0;

state = "Idle";

msg = 
[
["Hey Finn", "Lava Guard", BananaGuardPortrait],
["Hey", "Finn", FinnPortrait]
]

