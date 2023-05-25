if (instance_exists(oPlayer)){
//draw_text(10,300,"HSP: "+string(oPlayer.hsp));
//draw_text(10,320,"VSP: "+string(oPlayer.vsp));
//draw_text(10,340,"Stamina: "+string(oPlayer.umbStamina));
draw_text(320,15,global.points);
draw_set_color(c_red);
draw_set_color(c_white);

draw_sprite_stretched(sHearts,0,530,30,hrtWidth * (oPlayer.hp / 3),hrtHeight)
}

if (keyboard_check_pressed(vk_escape))
{
	draw_sprite_ext(sPAUSED,0,320,180,3,3,pauseTilt,c_white,1);
}

