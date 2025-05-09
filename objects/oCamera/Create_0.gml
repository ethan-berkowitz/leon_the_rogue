// Create Event of oCamera or oPlayer (you choose where this lives)

// Set camera size
var cam_width = 640;
var cam_height = 640;

// Create the camera
camera = camera_create_view(0, 0, cam_width, cam_height, 0, oPlayer, -1, -1, cam_width, cam_height);

// Assign the camera to viewport 0
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera;









