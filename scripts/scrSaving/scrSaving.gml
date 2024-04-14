
function save_game()
{
	
	
	var _array = [];
	with (obj_player)
	{
	
	var _struct = 
	{
		x: obj_player.x,
		y: obj_player.y,
		image_index: obj_player.image_index
		
		
	};
	
	array_push(_array, _struct);
	
	}
	
	
var _string = json_stringify(_array);
	
var _file =	file_text_open_write("save.txt");

file_text_write_string(_file, _string);

file_text_close(_file);

}
function load_game(){
	
	if (file_exists("save.txt"))
	{
		var _file = file_text_open_read("save.txt");
		var _json = file_text_read_string(_file);
		
		var _struct = json_parse ( _json);
		obj_player.x = _struct.x;
		obj_player.y = _struct.y;
		obj_player.image_index = _struct.image_index;
		
		file_text_close(_file);
		
	}
}