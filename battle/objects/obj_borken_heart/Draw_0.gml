/// @description Insert description here
// You can write your code in this editor
_X+=_HS;
_Y+=_VS;

var _r = random_range(-shake,shake);

if(!exploded){
   draw_sprite(sprite_index,0,x,
   y);
}else{

   draw_sprite_ext(sprite_index,0,x-_X-2+_r,y-_Y-2+_r,0.5,0.5,-20,c_white,1);
   draw_sprite_ext(sprite_index,0,x-_X-2+_r,y+_Y+2+_r,0.5,0.5,-20,c_white,1);
   
   draw_sprite_ext(sprite_index,0,x+_X+2+_r,y+_Y+2+_r,0.5,0.5,20,c_white,1);
   draw_sprite_ext(sprite_index,0,x+_X+2+_r,y-_Y-2+_r,0.5,0.5,20,c_white,1);
  	
}


draw_set_halign(fa_center);
draw_set_valign(fa_top);

alpha=lerp(alpha,alpha_T,0.2);

draw_set_alpha(alpha);
draw_text_transformed(room_width/2,20,"GAME\nOVER",3,3,0);

draw_text_transformed(room_width/2,260,"Press Z to retry",1,1,0);
draw_set_alpha(1);

if(keyboard_check_pressed(ord("Z"))){
   game_restart();	
}