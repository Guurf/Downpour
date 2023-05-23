lifetime--;
image_alpha = (lifetime/40);
if (lifetime <= 0) instance_destroy();
