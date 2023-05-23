if (instance_exists(oPlayer)){
draw_text(10,300,"HSP: "+string(oPlayer.hsp));
draw_text(10,320,"VSP: "+string(oPlayer.vsp));
draw_text(10,340,"Stamina: "+string(oPlayer.umbStamina));
draw_set_color(c_yellow);
draw_text(320,10,global.coinCount);
draw_set_color(c_white);
}