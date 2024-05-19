global.particle_system = part_system_create();
global.particle_type = part_type_create();

part_type_shape(global.particle_type, pt_shape_flare);
part_type_size(global.particle_type, 0.1, 0.3, 0, 0); 
part_type_scale(global.particle_type, 0.5, 0.5);
part_type_color1(global.particle_type, c_white);
part_type_alpha3(global.particle_type, 1, 0.5, 0);
part_type_speed(global.particle_type, 1, 2, 0, 0);
part_type_direction(global.particle_type, 0, 360, 0, 0);
part_type_gravity(global.particle_type, 0, 0);
part_type_life(global.particle_type, 30, 60);