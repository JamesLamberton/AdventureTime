
function acceleration(current_speed,idle,current_facing,prev_facing,acc_rate,touching_ground,walksp){
	var acc_sign_ = self.acc_sign;
	if(idle == 1){
		//stopped moving
		if(prev_facing == 1){
			//was prev moving positive
			acc_sign_ = -1;//slow down
		}else if(prev_facing == -1){
			//was prev moving negative
			acc_sign_ = 1;//slow down
			
		}
		current_speed = current_speed + 1.2*acc_sign_*acc_rate;
		if((current_speed <= 0) && (!acc_sign_)) || ((current_speed >= 0) && (acc_sign_)) {
			current_speed = 0;
		}
	}else if(prev_facing == current_facing) ||(prev_facing == current_facing + 2) || (prev_facing == current_facing - 2){
		//moving in same direction or changing direction
		acc_sign_ = current_facing;
		if(sign(current_speed) == acc_sign_){
			//accelrate normally
			current_speed = current_speed + acc_sign_*acc_rate;
		}else{
			// braking decelerate more
			current_speed = current_speed + 1.8*acc_sign_*acc_rate;
		}
	}
		
	if(!touching_ground) && ((current_facing == 1)|| (current_facing == -1)){
		current_speed = current_speed - acc_sign_*acc_rate/3;
	}
	if(current_speed >= walksp){
		current_speed = walksp;
	}else if(current_speed <= -walksp){
		current_speed = -walksp;
	}
	
	return current_speed;
}