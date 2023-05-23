image_angle += 1;
lifetime++;
if (lifetime < 50) && (!instance_exists(oCoinWarning))
{
	audio_play_sound(snCoinAppear,1,0);
	instance_create_layer(x,y+10,"VFX",oCoinWarning)	
}
else if (lifetime > 50)
{
	speed = 3;
}

if (speed != 0)
{
	if (trailTimer-- <= 0)
	{
		instance_create_layer(x,y-5,"VFX",oTrail, {image_index: 2});	
		trailTimer = trailInterval;
	}
}