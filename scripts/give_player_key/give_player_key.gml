// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function give_player_key()
{
	ds_list_add(oPlayer.inventory, "key");
	key_given = true;
}
