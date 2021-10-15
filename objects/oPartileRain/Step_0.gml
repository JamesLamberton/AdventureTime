if not instance_exists(oPlayer) exit;
xStart = oPlayer.x; 
//yStart = -200;

part_emitter_region(oParticleSetup.particle_system,emitterRain,xStart - bufferX , xStart + CameraWidth + bufferX, yStart - 10, yStart -10, ps_shape_line, ps_distr_linear);