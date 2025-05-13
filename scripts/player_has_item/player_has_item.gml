
function player_has_item(item)
{
	index = ds_list_find_index(oPlayer.inventory, item);
	if (index = -1)
		return (false);
	return (true);
}
