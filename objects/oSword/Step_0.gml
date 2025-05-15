x = oPlayer.x;
y = oPlayer.y;


	


if (end_angle < angle and image_angle > end_angle)
	image_angle -= swing_spd;
else if (end_angle > angle and image_angle < end_angle)
	image_angle += swing_spd;
else
	instance_destroy();

