if not instance_exists(oPlayer)exit;

layer_x("ForeForeground", oCamera.x / 2);
layer_x("Foreground", oCamera.x / 1.5);
layer_x("MidBackground", oCamera.x / 1.4);
layer_x("FarBackground", oCamera.x / 1.1);

/*
if oShaderStart.mode_color >= 0.25 
{
	layer_x("Sun", oCamera.x / 1.03 + 70);
}
else 
{
	layer_x("Sun", oCamera.x / 1.03 - 110);	
}

if oShaderStart.mode_color >= 0.75
{
	layer_x("Moon", oCamera.x / 1.03 + 70);
}
else 
{
	layer_x("Moon", oCamera.x / 1.03 -110);
}
*/
var _x_sun = oCamera.x/1.0 + 100*sin(2*pi*oShaderStart.mode_color - 0.5*pi) - 30;
var _y_sun = oCamera.y/1.0;
layer_x("Sun", _x_sun);	
var _x_moon = oCamera.x/1.0 + 100*sin(2*pi*oShaderStart.mode_color + 0.5*pi) - 30;
var _y_moon = oCamera.y/1.0;
layer_x("Moon", _x_moon);	