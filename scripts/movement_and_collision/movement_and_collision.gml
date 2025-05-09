// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movement_and_collision()
{
	var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	// Normalize diagonal movement
	if (move_x || move_y)
	{
	    var len = point_distance(0, 0, move_x, move_y);
	    move_x /= len;
	    move_y /= len;
	}

	// Apply movement with collision check
	var new_x = x + move_x * spd;
	var new_y = y + move_y * spd;

	// Horizontal collision
	if (!place_meeting(new_x, y, oCollision)) {
	    x = new_x;
	}

	// Vertical collision
	if (!place_meeting(x, new_y, oCollision)) {
	    y = new_y;
	}
}