/// @description Attack pattern here
if(battle_timer%60==0){

   with(instance_create_depth(x,y-32,depth-8,obj_projectile_parent)){
	    direction = point_direction(x,y,obj_heart.x,obj_heart.y);
		image_xscale=2;
		image_yscale=2;
		speed=6;
   }
	
}
