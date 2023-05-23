//Get Input
var _keyRight = keyboard_check(ord("D"));
var _keyLeft = keyboard_check(ord("A"));
var _keyGlide = keyboard_check(vk_space);

//Hori Movement
hsp = (_keyRight - _keyLeft) * hspWalk;

//Vert Movement
if (_keyGlide) 
{
	grv = 0.2
	if (vsp > 0) vsp = 1;
	if !(instance_exists(oUmbrella)) instance_create_layer(x,y,"Player",oUmbrella);
}
else 
{
	grv = 0.3;
	if (instance_exists(oUmbrella)) instance_destroy(oUmbrella);
}
vsp = vsp + grv

//Can Jump
//if (canJump-- > 0) && (_keyJump)
//{
//	vsp = vspJump;
//	canJump = 0;
//}


//Collide and Move
if (place_meeting(x + hsp, y, oCol))
{
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, oCol)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, oCol))
{
	//if (vsp > 0) canJump = 10;
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oCol)) y += vsp;
	}
	vsp = 0;
}
y += vsp;

if instance_exists(oDrop)
{
	if (place_meeting(x, bbox_bottom, oDrop))
	{
		vsp = -6;
		var nearestDrop = instance_nearest(x,bbox_bottom,oDrop);
		instance_destroy(nearestDrop);
	}
	else if (place_meeting(x, y-3, oDrop))
	{
		game_restart();	
	}
}
//Animation
if (hsp != 0) || (vsp != 0)
{
	if (trailTimer-- <= 0)
	{
		instance_create_layer(x,y-8,"VFX",oTrail);	
		trailTimer = trailInterval;
	}
}

