draw_self();

var target = instance_nearest(x, y, oPlayer);
if (target != noone)
    var dist = point_distance(x, y, target.x, target.y);
if (dist < 64)
{
	draw_text(x - 6, y - 40, "E");
	
	if (keyboard_check_pressed(ord("E")) and player_has_item("key"))
	{
		remove_item_from_inventory("key");
		instance_destroy();
	}
}


