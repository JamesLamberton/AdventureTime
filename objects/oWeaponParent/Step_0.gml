
if (place_meeting(x+hsp,y,oSolid)){	
	hsp = -hsp/2;
}
vsp = vsp + grv;
if (place_meeting(x,y+vsp,oSolid)){
	vsp = -vsp/2;
	hsp = hsp/2;
	if((vsp > -1) && (vsp < 1)){
		vsp = 0;
	}
}
if((hsp > -0.25) && (hsp < 0.25)){
	hsp = 0;
}

y = y + vsp;
x = x + hsp;
