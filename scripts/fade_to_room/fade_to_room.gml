/// @arg room
/// @arg duration
/// @arg color
function fade_to_room()
{
	var _room = argument[0];
	var _duration = argument[1];
	var _color = argument[2];
	
	var _inst = instance_create_depth(0, 0, 0, oFade);
	
	with (_inst)
	{
		targetRoom = _room;
		duration = _duration;
		color = _color;
	}
}