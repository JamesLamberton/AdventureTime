var enemy_count = instance_number(oEnemyParent);

if instance_exists(oPlayer) && enemy_count < oPlayer.kills
{
	if enemy_count > 3
	{
		exit;
	}
	
	var enemy = choose(oSkeleton, oGoblin, oWarrior);
	
	var new_x = random_range (200, room_width - 220);
	
	while point_distance(new_x, 0, oPlayer.x, 0) < 200
	{
		new_x = random_range(150, room_width - 220);
	}
	
	instance_create_layer(new_x, oPlayer.y - 50, "Instances", enemy);
}