event_inherited();
text_id = "";
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


flying = 0;
below = -1;
follow_height = 45;
wanderer = 0;//instances that move around every now n then are wanderer's, set 1 in instance create event
wandering = 0;
timer = 0;
toggle = 0;
idle = 1;


attack_distance = 32;
attack_damage = 10;
hit_frame = 7;

hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.5;
flysp = 0.7;
jump_height = 2.5;

hp = 15;
max_hp = hp;
flash = 0;

state = "Idle";