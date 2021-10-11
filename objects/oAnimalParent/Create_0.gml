event_inherited();

//all place holders
Idle_sprite = WarriorIdle;
Attack_sprite = WarriorAttack;
Moving_sprite = WarriorMoving;
Damage_sprite = WarriorAttackDamage;
Ranged_sprite = WarriorAttackDamage;
Jump_sprite = WarriorAttackDamage;
Feared_sprite = WarriorAttackDamage;
Hurt_sprite = WarriorHurt;
Death_sprite = SkeletonDead;
Sneak_sprite = WarriorIdle;

flying = 0;
wanderer = 1;//instances that move around every now n then are wanderer's, set 1 in instance create event
wandering = 0;
timer = 0;
toggle = 0;
below = -1;
follow_height = 45;

predator = 0;//scale of predators, 0 is prey, and rest are ranked with bigger meaning bigger predator
targetable = 0;
scared_of_player = 0;
sneaking = 0;
springy = 0;//animal moves by jumping

hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.5;
sneak_sp = walksp/2;
flysp = 0.7;
jump_height = 2.5;

hp = 15;
max_hp = hp;
flash = 0;

state = "Idle";
