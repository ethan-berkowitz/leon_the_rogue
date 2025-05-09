// Manual follow with smoothing
var target_x = oPlayer.x - camera_get_view_width(camera) / 2;
var target_y = oPlayer.y - camera_get_view_height(camera) / 2;

var new_x = lerp(camera_get_view_x(camera), target_x, 0.1);
var new_y = lerp(camera_get_view_y(camera), target_y, 0.1);

// Set camera position
camera_set_view_pos(camera, new_x, new_y);








