event_inherited();
hsp = 0;
vsp = 2;
grv = 0.3;
walksp = 0.4;
jump_height = 2.5;
wanderer = 0;
provokable = 1;
provoked = 0;
player_provokable = 1;
friendly = 0;
target = -1;

ranged_flag = 0;
attack_distance = 32;
attack_damage = 5;
hit_frame = 3;

hp = 25;
max_hp = hp;
flash = 0;

Idle_sprite = FlameGuardIdle;
Attack_sprite = FlameGuardIdle;
Moving_sprite = FlameGuardIdle;
Damage_sprite = FlameGuardIdle;
Ranged_sprite = FlameGuardIdle;
Jump_sprite = FlameGuardIdle;
Feared_sprite = FlameGuardIdle;
Hurt_sprite = FlameGuardIdle;
Death_sprite = FlameGuardIdle;

state = "Idle";

msg = 
[
["Hey Finn", "Lava Guard", BananaGuardPortrait],
["Hey", "Finn", FinnPortrait]
]