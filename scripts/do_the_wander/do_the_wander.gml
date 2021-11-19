
function do_the_wander(){
	if(self.timer < 4*room_speed){
		self.wandering = 0;
		self.idle = 1;
		self.current_speed = self.hsp;
		self.hsp = acceleration(self.current_speed,self.idle,self.facing,self.prev_facing,self.acc_rate,self.touching_ground,self.walksp);	
	}else if(self.timer > 4*room_speed) && (self.timer <= 6*room_speed){
		//wander one way
		self.wandering = 1;
		self.idle = 0;
		self.toggle = 0;
		self.current_speed = self.hsp;
		self.hsp = acceleration(self.current_speed,self.idle,self.facing,self.prev_facing,self.acc_rate,self.touching_ground,self.walksp);
		//move_and_collide(facing * walksp, 0);
		if(self.touching_ground){
			set_state_sprite(self.Moving_sprite, 1, 0);
		}else{
			set_state_sprite(self.Jump_sprite, 1, 0);
		}
	}else if(self.timer > 6*room_speed) && (self.timer <= 10*room_speed){
		//idle again
		set_state_sprite(self.Idle_sprite, 1, 0);
		self.wandering = 0;
		self.idle = 1;
		self.current_speed = self.hsp;
		self.hsp = acceleration(self.current_speed,self.idle,self.facing,self.prev_facing,self.acc_rate,self.touching_ground,self.walksp);
		if(self.toggle == 0){
			self.prev_facing = self.facing;
			self.facing = - self.facing;
			self.image_xscale = -self.image_xscale;
			self.toggle = 1;
		}
	}else if(self.timer > 10*room_speed) && (self.timer <= 12*room_speed){
		//wander the other way
		self.wandering = 1;
		self.toggle = 0;
		self.idle = 0;
		self.current_speed = self.hsp;
		self.hsp = acceleration(self.current_speed,self.idle,self.facing,self.prev_facing,self.acc_rate,self.touching_ground,self.walksp);
		//move_and_collide(facing * walksp, 0);
		if(self.touching_ground){
			set_state_sprite(self.Moving_sprite, 1, 0);
		}else{
			set_state_sprite(self.Jump_sprite, 1, 0);
		}
					
	}else if(self.timer > 12*room_speed){
		set_state_sprite(self.Idle_sprite, 1, 0);
		self.wandering = 0;
		self.idle = 1;
		self.timer = 0;
		self.prev_facing = facing;
		self.facing = - facing;
		self.image_xscale = -self.image_xscale;
		self.current_speed = self.hsp;
		self.hsp = acceleration(self.current_speed,self.idle,self.facing,self.prev_facing,self.acc_rate,self.touching_ground,self.walksp);
	}
}