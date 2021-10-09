other.state = "Knockback";
other.knockback_speed = knockback * projectile_direction;
other.image_xscale = -image_xscale;
other.hp -= 2.5;
instance_destroy();