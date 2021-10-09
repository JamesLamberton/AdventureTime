/// @desc ScreenShake
/// @arg Magnitude
/// @arg Frames

function screenshake()
{
	with (oCamera)
	{
		if (argument0 > shake_remain)
		{
			shake_magnitude = argument0;
			shake_remain = argument0;
			shake_length = argument1;
		}
	}
}