image_angle += 0.75;
if (speed != 0)
{
	if (trailTimer-- <= 0)
	{
		var _randX = irandom_range(x-5,x+5);
		instance_create_layer(_randX,y-8,"VFX",oTrail, {image_index: 1});	
		trailTimer = trailInterval;
	}
}

if (y > 360) instance_destroy();