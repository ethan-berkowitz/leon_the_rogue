x = oPlayer.x;
y = oPlayer.y;


if (ds_list_find_index(oPlayer.inventory, "long_sword") != -1)
{
    sprite_index = sLongSword;
	type = "long_sword";
}



if (end_angle < angle and image_angle > end_angle)
	image_angle -= swing_spd;
else if (end_angle > angle and image_angle < end_angle)
	image_angle += swing_spd;
else
	instance_destroy();

