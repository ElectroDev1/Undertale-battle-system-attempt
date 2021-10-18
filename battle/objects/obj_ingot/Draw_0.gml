/// @description

var _randoX = round(random_range(-shake[0],shake[0]))*2;
var _randoY = round(random_range(-shake[1],shake[1]))*2;

if(blocks>0){
draw_body();
}


//Health bar
menublocks=lerp(menublocks,blocks,0.5);
if(health_show){

   var _rectangleW = og_blocks*16;
   var _rectangleH = 12;

   var _yoffset = sprite_get_yoffset(current_sprite)*scale;
   
   draw_set_color(c_red);
   
   
   draw_rectangle(x-_rectangleW/2,y-_yoffset-_rectangleH/2,
                  x+_rectangleW/2,y-_yoffset+_rectangleH/2,0);
				  
   draw_set_color(c_green);
   
   if(Invi_position<7){
   draw_rectangle(x-_rectangleW/2,y-_yoffset-_rectangleH/2,
                  x-_rectangleW/2 + max(blocks*16,0),
				  y-_yoffset+_rectangleH/2,0);
   }
				 
   draw_set_color(c_white);

}