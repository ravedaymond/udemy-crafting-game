/// @description Pause/Unpause game

if(keyboard_check_pressed(vk_escape)) {
	if(gamePaused) {
		
		gamePaused = false;
		
		// Activate all
		instance_activate_all();
		
		// Remove surface
		if(surface_exists(pauseSurface)) {
			surface_free(pauseSurface);	
		}
		
		// Remove inventory GUI
		event_user(1);
	} else {
		gamePaused = true;
		
		// Deactivate all 
		// If true, calling instance remains active;
		instance_deactivate_all(true);
		
		// Create surface
		pauseSurface = surface_create(RES.WIDTH, RES.HEIGHT);
		
		// Copy application_surface
		surface_copy(pauseSurface, 0, 0, application_surface);
		
		// Create inventory GUI
		event_user(0);
	}
}
