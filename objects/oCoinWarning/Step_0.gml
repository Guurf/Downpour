lifetime++;
if (lifetime < 50) image_alpha += 0.05;
else image_alpha -= 0.05;
if (image_alpha < 0) instance_destroy();