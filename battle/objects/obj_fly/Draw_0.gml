/// @description


var _randoX = round(random_range(-shake[0],shake[0]))*2;
var _randoY = round(random_range(-shake[1],shake[1]))*2;

if(blocks>0){
	
var am = 0;

if(blocks<=og_blocks/2){ am = 0.5; }
	
draw_sprite_ext(
spr_fly,0,x+_randoX+sin(T*(am/4))*(20),y+_randoY+W,scale,scale,sin(T*(0.2+am))*(2),image_blend,1);
}


//Health bar
menublocks=lerp(menublocks,blocks,0.1);
if(health_show){

   var _rectangleW = og_blocks*4;
   var _rectangleH = 12;

   var _yoffset = sprite_get_yoffset(current_sprite)*scale;
   
   draw_set_color(c_red);
   
   
   draw_rectangle(x-_rectangleW/2,y-_yoffset-_rectangleH/2,
                  x+_rectangleW/2,y-_yoffset+_rectangleH/2,0);
				  
   draw_set_color(c_green);
   
   draw_rectangle(x-_rectangleW/2,y-_yoffset-_rectangleH/2,
                  x-_rectangleW/2 + max(blocks*4,0),
				  y-_yoffset+_rectangleH/2,0);
				 
   draw_set_color(c_white);

}
