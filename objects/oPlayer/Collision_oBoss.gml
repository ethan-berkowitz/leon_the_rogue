if (boss_damage_cooldown_counter >= boss_damage_cooldown)
{
	boss_damage_cooldown_counter = 0;
	hp -= 3;
	flash_for_taking_damage = true;
}
