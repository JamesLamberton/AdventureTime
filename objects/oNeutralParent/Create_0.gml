
event_inherited();

provokable = 1;// if can be provoked
provoked = 1;
target = -1;//instance that provoked this neutral
wanderer = 0;
wandering = 0;
toggle = 0;
timer = 0;
friendly = 0;//neutral enemy
player_provokable = 0;
//all place holders
Idle_sprite = SkeletonIdle;
Attack_sprite = SkeletonAttack;
Moving_sprite = SkeletonWalk;
Damage_sprite = SkeletonAttackDamage;
Ranged_sprite = SkeletonAttackDamage;
Jump_sprite = SkeletonWalk;
Feared_sprite = SkeletonWalk;
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