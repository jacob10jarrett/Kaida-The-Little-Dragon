var _player_defeated = obj_player.hp <= 0;

if (!_player_defeated)
{
	if (file_exists("checkpoint.ini"))
	{
		file_delete("checkpoint.ini");
	}
}