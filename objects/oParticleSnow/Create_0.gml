image_alpha = 0;  // don't show in game

bufferX = 500;   // buffer left and right outsite from camera


 // Capture x,y and with + height of camera 0
xStart = camera_get_view_x(view_camera[0]);
yStart = camera_get_view_y(view_camera[0]);
 
CameraWidth = camera_get_view_width(view_camera[0]);
CameraHeight = camera_get_view_height(view_camera[0]);
  
  
  // Blank emitter, region/space to use , stream 
emitterSnow = part_emitter_create(oParticleSetup.particle_system); 
emitterSnowCloud = part_emitter_create(oParticleSetup.particle_system);

   // Create snow particles
part_emitter_region(oParticleSetup.particle_system, emitterSnow,  xStart - bufferX,  xStart + CameraWidth + bufferX, yStart, yStart, ps_shape_rectangle,  ps_distr_linear );
part_emitter_stream(oParticleSetup.particle_system, emitterSnow, oParticleSetup.particle_Snow, 5 );
  
   // Create snow clouds 
part_emitter_region(oParticleSetup.particle_system, emitterSnowCloud,  xStart - bufferX,  xStart + CameraWidth + bufferX, yStart, yStart + CameraHeight, ps_shape_rectangle,  ps_distr_linear );
part_emitter_stream(oParticleSetup.particle_system, emitterSnowCloud, oParticleSetup.particle_SnowCloud, -2 );
   

