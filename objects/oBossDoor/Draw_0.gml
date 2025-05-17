draw_self();

var target = instance_nearest(x, y, oPlayer);
if (target != noone)
    var dist = point_distance(x, y, target.x, target.y);
if (dist < 84)
{
	draw_text(x - 3, y - 52, "E");
	
	if (keyboard_check_pressed(ord("E")) and player_has_item("boss_key"))
	{
		remove_item_from_inventory("boss_key");
		instance_destroy();
	}
}


