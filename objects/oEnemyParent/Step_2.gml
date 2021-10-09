if hp <= 0 
{
	state = "Destroy";
	
	if(kill_counts){
		if(experience_dropped == 0){
			repeat (experience)
			{
				instance_create_layer(x+random_range(-4,4), y+random_range(-4,4), "Effects", oExperience);
			}
			experience_dropped = 1;
			oPlayer.kills++;
		}
	}
	if(coin_dropped == 0){
		coin = instance_create_layer(x, y - 1, "Instances", oGoldCoin);
		coin.vsp = random_range(-3,-5);
		coin.hsp = random_range(-2,2);
		coin_dropped = 1;
	}
	if(item_dropped == 0){
		
		if(random(1) < chance_of_drop) &&(!chance_evaluated){
			chance_evaluated = 1;
			item_dropped = 1;
			drop = instance_create_layer(x,y - 15,"Instances",oHealthPotion);
			drop.vsp = random_range(-3,-5);
			drop.hsp = random_range(-2,2);
		}else{
			chance_evaluated = 1;
		}
	}
}