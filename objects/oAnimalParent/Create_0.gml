event_inherited();

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
Sneak_sprite = SkeletonWalk;

flying = 0;
wanderer = 1;//instances that move around every now n then are wanderer's, set 1 in instance create event
wandering = 0;
timer = 0;
toggle = 0;
below = -1;
follow_height = 45;

predator = 0;//scale of predators, 0 is prey, and rest are ranked with bigger meaning bigger predator
current_predator = -1;//stores id of current predator chasing this animal
distance_to_current_predator = 10000;
targetable = 0;
scared_of_player = 0;
sneaking = 0;
springy = 0;//animal moves by jumping

flee_distance = 200;
chase_distance = 250;
attack_distance = 20;
hit_frame = 2;
attack_damage = 15;

hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.5;
chase_speed = 1.5*walksp;
sneak_sp = walksp/2;
flysp = 0.7;
jump_height = 2.5;

hp = 15;
max_hp = hp;
flash = 0;

state = "Idle";
