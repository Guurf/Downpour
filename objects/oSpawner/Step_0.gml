if (dropTimer-- <= 0)
{
	repeat (dropAmount)
	{
		var dropX = irandom_range(175, 465);
		var dropY = irandom_range(-20, 20);
		instance_create_layer(dropX,dropY,"Drops",oDrop);
	}
	dropTimer = dropInterval;
}

if (coinTimer-- <= 0)
{
	repeat (coinAmount)
	{
		var coinX = irandom_range(175, 465);
		var coinY = irandom_range(-20, 20);
		instance_create_layer(coinX,coinY,"Drops",oCoin);
	}
	coinTimer = coinInterval;
}