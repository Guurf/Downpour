if (global.coinCount > 0)
{
	if !instance_exists(oGlow) instance_create_layer(0,32,"VFX",oGlow);
}

//if (global.paused)
//{
//	if (pauseDir == "RIGHT") pauseTilt++;	
//	else if (pauseDir == "LEFT") pauseTilt--;	
//	if (pauseTilt > 100 && pauseDir == "RIGHT") pauseDir = "LEFT"
//	if (pauseTilt < -100 && pauseDir == "LEFT") pauseDir = "RIGHT"
//}