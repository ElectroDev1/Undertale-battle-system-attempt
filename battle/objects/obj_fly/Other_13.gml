/// @description Attack pattern here

if(instance_number(obj_enemy_parent)==1){
   var T=0.5;	
}else{ var T=1; }

if(timer%40*T==0){

   with(instance_create_depth(
        x+random_range(-obj_battle_controller.heartCase_width/2,obj_battle_controller.heartCase_width/2)
       ,-32,depth-8,obj_projectile_parent)){
		outside_destroy=false;
	    direction = -90;
		image_xscale=2;
		image_yscale=2;
		speed=irandom_range(4,8);
   }
	
}
