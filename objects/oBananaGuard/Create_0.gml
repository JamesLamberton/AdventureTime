// Inherit the parent event
event_inherited();
hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.4;
jump_height = 2.5;
wanderer = 0;

ranged_flag = 0;
attack_distance = 32;
attack_damage = 5;
hit_frame = 3;

hp = 25;
max_hp = hp;
flash = 0;

Idle_sprite = BananaGuardIdle;
Attack_sprite = BananaGuardIdle;
Moving_sprite = BananaGuardRunning;
Damage_sprite = BananaGuardIdle;
Ranged_sprite = BananaGuardIdle;
Jump_sprite = BananaGuardRunning;
Feared_sprite = BananaGuardRunning;
Hurt_sprite = BananaGuardIdle;
Death_sprite = BananaGuardIdle;

state = "Idle";