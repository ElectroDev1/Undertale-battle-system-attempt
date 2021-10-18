/// @description 

/// @description Attack pattern here
if(timer%80==0 && random(1)>0.5){

   with(instance_create_depth(x,y-32,depth-8,obj_projectile_parent)){
	    direction = point_direction(x,y,obj_heart.x,obj_heart.y);
		image_xscale=2;
		image_yscale=2;
		speed=6;
   }
	
}

