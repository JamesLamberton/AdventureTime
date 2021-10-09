event_inherited();
hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.5;
jump_height = 2.5;

hp = 15;
max_hp = hp;
flash = 0;
experience = 1;

attack_distance = 32;
attack_damage = 10;
hit_frame = 7;
ranged_flag = 0;

Idle_sprite = SkeletonIdle;
Attack_sprite = SkeletonAttack;
Moving_sprite = SkeletonWalk;
Damage_sprite = SkeletonAttackDamage;
Ranged_sprite = WarriorAttackDamage;
Jump_sprite = SkeletonWalk;
Feared_sprite = WarriorAttackDamage;
Hurt_sprite = SkeletonHit;
Death_sprite = SkeletonDead;

state = "Idle";
