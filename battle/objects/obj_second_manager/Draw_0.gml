/// @description

#region Background
with(obj_battle_controller){
var BGK = battle_background;
var BKG_X = background_x;
var BKG_Y = background_y;
var CLR = image_blend;
	
var bg_width = sprite_get_width(BGK);
var bg_height = sprite_get_height(BGK);


draw_sprite_ext(BGK,0,-bg_width+BKG_X,-bg_height+BKG_Y,1,1,0,CLR,1);
draw_sprite_ext(BGK,0,BKG_X,-bg_height+BKG_Y,1,1,0,CLR,1);
draw_sprite_ext(BGK,0,-bg_width+BKG_X,BKG_Y,1,1,0,CLR,1);
draw_sprite_ext(BGK,0,BKG_X,BKG_Y,1,1,0,CLR,1);

draw_set_alpha(background_alpha);
draw_set_colour(c_black);
draw_rectangle(0,0,room_width,room_height,0);
draw_set_colour(c_white);
draw_set_alpha(1);
}
#endregion
