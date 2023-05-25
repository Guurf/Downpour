draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
global.coinCount = 0;
global.points = 0;
global.paused = false;
pause_sprite = undefined;
hrtWidth = sprite_get_width(sHearts) * 3
hrtHeight = sprite_get_height(sHearts)
pauseTilt = 0;
pauseDir = "Right";