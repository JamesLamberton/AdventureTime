if(collision == 0){
	count = irandom_range(1,2)*value;
	oPlayer.coin += count;
	oItemTextParent.goldCoin = 1;
	oItemTextParent.goldCoinCount += count;
	draw_value = 1;
	collision = 1;
}
