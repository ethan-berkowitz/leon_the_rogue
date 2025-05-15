// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_chase_player(chase_distance, spd)
{
	var return_dist = 5;

	// === CHASE PLAYER ===
	if (distance_to_object(oPlayer) < chase_distance and room_inst == oPlayer.room_inst)
	{
	    var dx = oPlayer.x - x;
	    var dy = oPlayer.y - y;
	    var dist = point_distance(x, y, oPlayer.x, oPlayer.y);
    
	    if (dist != 0)
		{
	        hspeed = (dx / dist) * spd;
	        vspeed = (dy / dist) * spd;
	    }
	}
	// === RETURN TO START ===
	else
	{
	    var dist_home = point_distance(x, y, starting_x, starting_y);
    
	    if (dist_home > return_dist)
		{
	        var dx = starting_x - x;
	        var dy = starting_y - y;
	        hspeed = (dx / dist_home) * spd / 2;
	        vspeed = (dy / dist_home) * spd / 2;
	    } 
		else
		{
	        // Snap to position and stop all movement
	        x = starting_x;
	        y = starting_y;
	        hspeed = 0;
	        vspeed = 0;
	    }
	}
}