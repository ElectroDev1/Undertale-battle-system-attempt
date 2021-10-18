/// @description

var am = 0;

if(image_blend==c_red){ am = 0.5; }

draw_sprite_ext(
spr_fly,0,x+sin(T*(am/4))*(20),y+W,scale,scale,sin(T*(0.2+am))*(2),
c_red,max(0,other.SinW/1.5));