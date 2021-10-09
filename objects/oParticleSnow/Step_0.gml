if not instance_exists(oPlayer) exit;
xStart = oPlayer.x;	
yStart = oPlayer.y - 160;


part_emitter_region(oParticleSetup.particle_system, emitterSnow,  xStart - 800,  xStart + CameraWidth + 800, yStart, yStart, ps_shape_rectangle,  ps_distr_linear );
part_emitter_region(oParticleSetup.particle_system, emitterSnowCloud,  xStart - bufferX,  xStart + CameraWidth + bufferX, yStart, yStart + CameraHeight, ps_shape_rectangle,  ps_distr_linear );