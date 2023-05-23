if (speed != 0)
{
	if (trailTimer-- <= 0)
	{
		instance_create_layer(x,y-8,"VFX",oTrail);	
		trailTimer = trailInterval;
	}
}