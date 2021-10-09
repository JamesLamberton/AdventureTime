/// @description Particle Setup

image_alpha = 0;  // don't show in game


particle_system = part_system_create_layer("Weather", 0);  


#region Rain
// Rain

particleType_Rain_StrongWest = part_type_create();

part_type_sprite(particleType_Rain_StrongWest, sRain, 0,0,1 );
part_type_size(particleType_Rain_StrongWest, 0.3,0.8, 0,0);
part_type_gravity(particleType_Rain_StrongWest, 0.02, 250);
part_type_life(particleType_Rain_StrongWest, 150,200);
part_type_orientation(particleType_Rain_StrongWest, 330, 330 , 0,0,0 );


particleType_Rain_StrongEast = part_type_create();

part_type_sprite(particleType_Rain_StrongEast, sRain, 0,0,1 );
part_type_size(particleType_Rain_StrongEast, 2,2, 0,0);
part_type_gravity(particleType_Rain_StrongEast, 0.05, 290);
part_type_life(particleType_Rain_StrongEast, 150,200);
part_type_orientation(particleType_Rain_StrongEast, 20, 20 , 0,0,0 );


particleType_Rain_StrongDown = part_type_create();

part_type_sprite(particleType_Rain_StrongEast, sRain, 0,0,1 );
part_type_size(particleType_Rain_StrongEast, 2,2, 0,0);
part_type_gravity(particleType_Rain_StrongEast, 0.05, 270);
part_type_life(particleType_Rain_StrongEast, 150,200);
part_type_orientation(particleType_Rain_StrongEast, 0, 0 , 0,0,0 );





particleType_Rain_MildWest = part_type_create();

part_type_sprite(particleType_Rain_MildWest, sRain, 0,0,1 );
part_type_size(particleType_Rain_MildWest, 2,2, 0,0);
part_type_gravity(particleType_Rain_MildWest, 0.03, 260);
part_type_life(particleType_Rain_MildWest, 400,400);
part_type_orientation(particleType_Rain_MildWest, 350, 350 , 0,0,0 );


particleType_Rain_MildEast = part_type_create();

part_type_sprite(particleType_Rain_MildEast, sRain, 0,0,1 );
part_type_size(particleType_Rain_MildEast, 2,2, 0,0);
part_type_gravity(particleType_Rain_MildEast, 0.03, 280);
part_type_life(particleType_Rain_MildEast, 400,400);
part_type_orientation(particleType_Rain_MildEast, 20, 20 , 0,0,0 );


particleType_Rain_MildDown = part_type_create();

part_type_sprite(particleType_Rain_MildDown, sRain, 0,0,1 );
part_type_size(particleType_Rain_MildDown, 2,2, 0,0);
part_type_gravity(particleType_Rain_MildDown, 0.03, 270);
part_type_life(particleType_Rain_MildDown, 400,400);
part_type_orientation(particleType_Rain_MildDown, 0, 0 , 0,0,0 );





// Rain End ++++++++++++++++++++++++++++++++++++
#endregion

#region Snow
// snow

particle_Snow =  part_type_create(); 
part_type_sprite(particle_Snow, sSnow, 0, 0 , 1); 
part_type_size(particle_Snow, 0.2,0.6, 0 , 0);

part_type_speed(particle_Snow, 0.4,0.6, 0, 0  );
part_type_direction(particle_Snow, 270,270, 0, 15   );

part_type_life(particle_Snow, 940,940);
part_type_orientation(particle_Snow, 0,359 , 0,15, 0);
part_type_alpha3(particle_Snow, 0.8, 0.7, 0.1);

particle_SnowCloud = part_type_create(); 
part_type_shape(particle_SnowCloud, pt_shape_cloud );
part_type_size(particle_SnowCloud, 2,5, 0.01,  0) ;
part_type_orientation(particle_SnowCloud, 0,359 , 0, 2, 0);
part_type_life(particle_SnowCloud, 300,450);
part_type_blend(particle_SnowCloud, 1);
part_type_alpha3(particle_SnowCloud, 0.001, 0.05, 0.001   );



#endregion

#region Leafes
// Leaves
particleType_Leaf_West = part_type_create(); 

part_type_sprite(particleType_Leaf_West, sLeaf, 0, 0 ,1);  
part_type_size(particleType_Leaf_West, 0.2,0.5,0, 0.05);
part_type_gravity(particleType_Leaf_West, 0.005, 270); // soft falling
part_type_speed(particleType_Leaf_West, 1.2,1.2, 0, 0);   
part_type_direction(particleType_Leaf_West, 200, 240, 0, 0); 
part_type_orientation(particleType_Leaf_West, 0,359 , 0,2, 0);
part_type_life(particleType_Leaf_West, 680,840 );
part_type_alpha3(particleType_Leaf_West, 0.8,0.7,0.1);


particleType_Leaf_East = part_type_create(); 

part_type_sprite(particleType_Leaf_East, sLeaf, 0, 0 ,1);  
part_type_size(particleType_Leaf_East, 1,2.5,0, 0.05);
//part_type_gravity(particleType_Leaf_East, 0.005, 270); // soft falling
part_type_speed(particleType_Leaf_East, 1.2,1.2, 0, 0);   
part_type_direction(particleType_Leaf_East, 200, 240, 0, 0); 
part_type_direction(particleType_Leaf_East, 300, 340, 0, 0); 
part_type_orientation(particleType_Leaf_East, 0,359 , 0,2, 0);
part_type_life(particleType_Leaf_East, 680,840 );
part_type_alpha3(particleType_Leaf_East, 0.8,0.7,0.1);

#endregion

#region Lava on spot

// lava on one spot
particleType_Lava = part_type_create(); 

part_type_sprite(particleType_Lava, RainHardLightBlue, 0, 0 ,1);  
part_type_size(particleType_Lava, 0.5,1.8,0, 0);

part_type_speed(particleType_Lava,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava, 90, 90, 0, 0); // Wiggle west

part_type_orientation(particleType_Lava, 0,359 , 0,15, 0);
part_type_life(particleType_Lava, 80,300 );
part_type_alpha3(particleType_Lava, 0.8,0.6,0.1);



particleType_Heat = part_type_create(); 

part_type_shape(particleType_Heat, pt_shape_smoke );
part_type_size(particleType_Heat, 0.5,0.4,0.001, 0);

part_type_speed(particleType_Heat, 0.005,0.001, 0, 0);  
part_type_direction(particleType_Heat, 90, 90, 0, 15); 

part_type_color3(particleType_Heat,9955, 809204 ,3454463 );
part_type_orientation(particleType_Heat, 0,359 , 0,0, 0);
part_type_life(particleType_Heat, 300,450 );
part_type_blend(particleType_Heat, 1);
part_type_alpha3(particleType_Heat, 0.001, 0.02, 0.001);
//part_type_alpha1(particleType_Heat, 1);


#endregion

#region heat and embers Red
// lava whole camera
particleType_Lava_Red = part_type_create(); 

part_type_sprite(particleType_Lava_Red, RainHardLightBlue, 0, 0 ,1);  
part_type_size(particleType_Lava_Red, 0.05,1.2,0, 0);
part_type_color3(particleType_Lava_Red,9955, 809204 ,3454463 );
part_type_speed(particleType_Lava_Red,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava_Red, 70, 110, 0, 2); // Wiggle west
part_type_blend(particleType_Lava_Red, 1);
part_type_orientation(particleType_Lava_Red, 0,359 , 0, 0, 0);
part_type_life(particleType_Lava_Red, 3200,3800 );
part_type_alpha3(particleType_Lava_Red, 0.8,0.4,0.1);



particleType_Heat_Red = part_type_create(); 

part_type_shape(particleType_Heat_Red, pt_shape_smoke );
part_type_size(particleType_Heat_Red, 2,3,0.001, 0);
part_type_speed(particleType_Heat_Red, 0,0, 0, 0);  
part_type_direction(particleType_Heat_Red, 90, 90, 0, 15); 
part_type_color3(particleType_Heat_Red,9955, 809204 ,3454463 );
part_type_orientation(particleType_Heat_Red, 0,359 , 0,0, 0);
part_type_life(particleType_Heat_Red, 300,450 );
part_type_blend(particleType_Heat_Red, 1);
part_type_alpha3(particleType_Heat_Red, 0.001, 0.005, 0.001);





particleType_Lava_Green = part_type_create(); 

part_type_sprite(particleType_Lava_Green, RainHardLightBlue, 0, 0 ,1);  
part_type_size(particleType_Lava_Green, 0.05,1.2,0, 0);
part_type_color3(particleType_Lava_Green,906248, 1106698 ,1045513 );
part_type_speed(particleType_Lava_Green,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava_Green, 70, 110, 0, 2); // Wiggle west
part_type_blend(particleType_Lava_Green, 1);
part_type_orientation(particleType_Lava_Green, 0,359 , 0, 0, 0);
part_type_life(particleType_Lava_Green, 3200,3800 );
part_type_alpha3(particleType_Lava_Green, 0.8,0.4,0.1);


particleType_Heat_Green = part_type_create(); 

part_type_shape(particleType_Heat_Green, pt_shape_smoke );
part_type_size(particleType_Heat_Green, 2,3,0.001, 0);
part_type_speed(particleType_Heat_Green, 0,0, 0, 0);  
part_type_direction(particleType_Heat_Green, 90, 90, 0, 15); 
part_type_color3(particleType_Heat_Green,906248, 1106698 ,1045513 );
part_type_orientation(particleType_Heat_Green, 0,359 , 0,0, 0);
part_type_life(particleType_Heat_Green, 300,450 );
part_type_blend(particleType_Heat_Green, 1);
part_type_alpha3(particleType_Heat_Green, 0.001, 0.005, 0.001);




particleType_Lava_Blue = part_type_create(); 

part_type_sprite(particleType_Lava_Blue, RainHardLightBlue, 0, 0 ,1);  
part_type_size(particleType_Lava_Blue, 0.05,1.2,0, 0);
part_type_color3(particleType_Lava_Blue,13144579, 14196491 ,15511570 );
part_type_speed(particleType_Lava_Blue,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava_Blue, 70, 110, 0, 2); // Wiggle west
part_type_blend(particleType_Lava_Blue, 1);
part_type_orientation(particleType_Lava_Blue, 0,359 , 0, 0, 0);
part_type_life(particleType_Lava_Blue, 3200,3800 );
part_type_alpha3(particleType_Lava_Blue, 0.8,0.4,0.1);



particleType_Heat_Blue = part_type_create(); 

part_type_shape(particleType_Heat_Blue, pt_shape_smoke );
part_type_size(particleType_Heat_Blue, 2,3,0.001, 0);
part_type_speed(particleType_Heat_Blue, 0,0, 0, 0);  
part_type_direction(particleType_Heat_Blue, 90, 90, 0, 15); 
part_type_color3(particleType_Heat_Blue,13144579, 14196491 ,15511570 );
part_type_orientation(particleType_Heat_Blue, 0,359 , 0,0, 0);
part_type_life(particleType_Heat_Blue, 300,450 );
part_type_blend(particleType_Heat_Blue, 1);
part_type_alpha3(particleType_Heat_Blue, 0.001, 0.005, 0.001);




particleType_Lava_Violet = part_type_create(); 

part_type_sprite(particleType_Lava_Violet, RainHardLightBlue, 0, 0 ,1);  
part_type_size(particleType_Lava_Violet, 0.05,1.2,0, 0);
part_type_color3(particleType_Lava_Violet,13044141, 14226367 ,15863508 );
part_type_speed(particleType_Lava_Violet,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava_Violet, 70, 110, 0, 2); // Wiggle west
part_type_blend(particleType_Lava_Violet, 1);
part_type_orientation(particleType_Lava_Violet, 0,359 , 0, 0, 0);
part_type_life(particleType_Lava_Violet, 3200,3800 );
part_type_alpha3(particleType_Lava_Violet, 0.8,0.4,0.1);



particleType_Heat_Violet = part_type_create(); 

part_type_shape(particleType_Heat_Violet, pt_shape_smoke );
part_type_size(particleType_Heat_Violet, 2,3,0.001, 0);
part_type_speed(particleType_Heat_Violet, 0,0, 0, 0);  
part_type_direction(particleType_Heat_Violet, 90, 90, 0, 15); 
part_type_color3(particleType_Heat_Violet,13044141, 14226367 ,15863508 );
part_type_orientation(particleType_Heat_Violet, 0,359 , 0,0, 0);
part_type_life(particleType_Heat_Violet, 300,450 );
part_type_blend(particleType_Heat_Violet, 1);
part_type_alpha3(particleType_Heat_Violet, 0.001, 0.005, 0.001);



particleType_Lava_Yellow = part_type_create(); 

part_type_sprite(particleType_Lava_Yellow, RainHardLightBlue, 0, 0 ,1);  
part_type_size(particleType_Lava_Yellow, 0.05,1.2,0, 0);
part_type_color3(particleType_Lava_Yellow,447696, 1237469 ,782572 );
part_type_speed(particleType_Lava_Yellow,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava_Yellow, 70, 110, 0, 2); // Wiggle west
part_type_blend(particleType_Lava_Yellow, 1);
part_type_orientation(particleType_Lava_Yellow, 0,359 , 0, 0, 0);
part_type_life(particleType_Lava_Yellow, 3200,3800 );
part_type_alpha3(particleType_Lava_Yellow, 0.8,0.4,0.1);



particleType_Heat_Yellow = part_type_create(); 

part_type_shape(particleType_Heat_Yellow, pt_shape_smoke );
part_type_size(particleType_Heat_Yellow, 2,3,0.001, 0);
part_type_speed(particleType_Heat_Yellow, 0,0, 0, 0);  
part_type_direction(particleType_Heat_Yellow, 90, 90, 0, 15); 
part_type_color3(particleType_Heat_Yellow,447696, 1237469 ,782572 );
part_type_orientation(particleType_Heat_Yellow, 0,359 , 0,0, 0);
part_type_life(particleType_Heat_Yellow, 300,450 );
part_type_blend(particleType_Heat_Yellow, 1);
part_type_alpha3(particleType_Heat_Yellow, 0.001, 0.005, 0.001);




particleType_Lava_Orange = part_type_create(); 

part_type_sprite(particleType_Lava_Orange, RainHardLightBlue, 0, 0 ,1);  
part_type_size(particleType_Lava_Orange, 0.05,1.2,0, 0);
part_type_color3(particleType_Lava_Orange,950226, 1806309 ,430326 );
part_type_speed(particleType_Lava_Orange,0.2,0.1, 0, 0);   // extra wiggle
part_type_direction(particleType_Lava_Orange, 70, 110, 0, 2); // Wiggle west
part_type_blend(particleType_Lava_Orange, 1);
part_type_orientation(particleType_Lava_Orange, 0,359 , 0, 0, 0);
part_type_life(particleType_Lava_Orange, 3200,3800 );
part_type_alpha3(particleType_Lava_Orange, 0.8,0.4,0.1);



particleType_Heat_Orange = part_type_create(); 

part_type_shape(particleType_Heat_Orange, pt_shape_smoke );
part_type_size(particleType_Heat_Orange, 2,3,0.001, 0);
part_type_speed(particleType_Heat_Orange, 0,0, 0, 0);  
part_type_direction(particleType_Heat_Orange, 90, 90, 0, 15); 
part_type_color3(particleType_Heat_Orange,950226, 1806309 ,430326 );
part_type_orientation(particleType_Heat_Orange, 0,359 , 0,0, 0);
part_type_life(particleType_Heat_Orange, 300,450 );
part_type_blend(particleType_Heat_Orange, 1);
part_type_alpha3(particleType_Heat_Orange, 0.001, 0.005, 0.001);



#endregion
