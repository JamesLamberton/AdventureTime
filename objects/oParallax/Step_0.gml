if not instance_exists(oPlayer)exit;

layer_x("ForeForeground", oCamera.x / 2);
layer_x("Foreground", oCamera.x / 1.5);
layer_x("MidBackground", oCamera.x / 1.4);
layer_x("FarBackground", oCamera.x / 1.1);

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

