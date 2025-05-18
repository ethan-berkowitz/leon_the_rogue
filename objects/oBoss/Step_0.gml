randomize();

sword_timer++;

if (hp <= 0)
{
	ds_list_add(oPlayer.inventory, "final_key");
	instance_destroy();
}

if (distance_to_object(oPlayer) < 100)
	active = true;

if (active == false)
	exit;
	
move_towards_point(current_pos[0], current_pos[1], 2);

if (distance_to_point(current_pos[0], current_pos[1]) <= 3)
{
	i = irandom(8);
	current_pos = pos_array[i];
}

//attack_time_counter++;
//if (attack_time_counter >= attack_time)
//{
//	attack_time_counter = 0;
//	instance_create_layer(x, y, "BossAttack", oBossAttack);
//}
	

	