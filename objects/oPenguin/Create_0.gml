event_inherited();

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

wanderer = 1;//instances that move around every now n then are wanderer's, set 1 in instance create event
wandering = 0;
timer = 0;
toggle = 0;

predator = 0;//scale of predators, 0 is prey, and rest are ranked with bigger meaning bigger predator
targetable = 1;
scared_of_player = 0;
sneaking = 0;
springy = 0;//animal moves by jumping

hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.25;
sneak_sp = walksp/2;
chase_speed = 1.5*walksp;
flysp = 0.7;
jump_height = 2.5;

hp = 15;