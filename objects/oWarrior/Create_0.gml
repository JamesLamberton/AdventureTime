
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

attack_distance = 20;
attack_damage = 10;
hit_frame = 5;
ranged_flag = 0;

Idle_sprite = WarriorIdle;
Attack_sprite = WarriorAttack;
Moving_sprite = WarriorMoving;
Damage_sprite = WarriorAttackDamage;
Ranged_sprite = WarriorAttackDamage;
Jump_sprite = WarriorMoving;
Feared_sprite = WarriorAttackDamage;
Hurt_sprite = WarriorHurt;
Death_sprite = SkeletonDead;

state = "Idle";
