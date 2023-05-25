//Get Input
var _keyRight = keyboard_check(ord("D"));
var _keyLeft = keyboard_check(ord("A"));
var _keyGlide = keyboard_check(vk_space);

//Hori Movement
hsp = (_keyRight - _keyLeft) * hspWalk;
move_wrap(true, false, sprite_width);
//Vert Movement
if (_keyGlide) && (umbStamina > 0)
{
	umbStamina-=0.5;
	grv = 0.15
	if (vsp > 0) vsp = 1;
	if !(instance_exists(oUmbrella)) instance_create_layer(x,y,"Player",oUmbrella);
}
else 
{
	grv = 0.3;
	if (instance_exists(oUmbrella)) instance_destroy(oUmbrella);
}
vsp = vsp + grv
if (vsp > 7) vsp = 7;
else if (vsp < -10) vsp = -10;


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

//Drop Bounce
if instance_exists(oDrop)
{
	var nearestDrop = instance_nearest(x,bbox_bottom,oDrop);
	if (place_meeting(x, bbox_bottom, oDrop))
	{
		image_index = 0;
		image_speed = 0;
		audio_play_sound(snJump,1,0);
		global.points += 20;
		vsp = -6;
		umbStamina = maxUmbStamina;
		instance_destroy(nearestDrop);
	}
	else if (place_meeting(x, y-3, oDrop))
	{
		instance_destroy(nearestDrop);
		hp--;
		audio_play_sound(snHurt,2,0);
		image_speed = 1;
	}
}

if (y > 360)
{
	hp--;
	vsp = -10;
	audio_play_sound(snHurt,1,0);
	image_speed = 1;
}

if (hp <= 0) game_restart();

//Animation
if (hsp != 0) || (vsp != 0)
{
	if (trailTimer-- <= 0)
	{
		instance_create_layer(x,y-8,"VFX",oTrail);	
		trailTimer = trailInterval;
	}
}
if (vsp > 3 || vsp < -3) sprite_index = sPlayerThin;
else if (hsp != 0)
{
	sprite_index = sPlayerWalk;	
	image_xscale = sign(hsp);
}
else sprite_index = sPlayer;