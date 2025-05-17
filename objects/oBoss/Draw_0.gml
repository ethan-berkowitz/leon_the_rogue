if (flash_for_taking_damage == true)
{
	draw_sprite_ext(sBoss, 0, x, y, 1, 1, 0, c_blue, 1);
	
	flash_timer++;
	if (flash_timer >= flash_length)
	{
		flash_for_taking_damage = false;
		flash_timer = 0;
	}
}
else
	draw_self();
