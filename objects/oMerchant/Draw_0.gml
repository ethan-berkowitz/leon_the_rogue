draw_self();

var target = instance_nearest(x, y, oPlayer);
if (target != noone)
    var dist = point_distance(x, y, target.x, target.y);
if (dist < 64 and key_given == false)
{
	draw_text(x - 6, y - 40, "E");
	
	if (keyboard_check_pressed(ord("E")))
		oPlayer.text_mode = true;


}
if (oPlayer.text_mode = true)
	draw_npc_text();
