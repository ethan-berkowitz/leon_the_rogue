if (fade == true)
{
	if (dropped_gold == false)
	{	
		dropped_gold = true;
		instance_create_layer(x, y, "Gold", oGold);
	}
	image_angle += 10;
	image_alpha -= 0.05;
	if (image_alpha <= 0)
		instance_destroy();
	hspeed = 0;
	vspeed = 0;
	exit;
}

enemy_chase_player(100, chase_speed);
