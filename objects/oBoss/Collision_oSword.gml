if (sword_timer >= sword_cooldown)
{
	sword_timer = 0;
	if (other.type == "long_sword")
		hp -= 3;
	else
		hp -= 1;
	flash_for_taking_damage = true;
}
