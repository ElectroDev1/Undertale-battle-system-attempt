/// @description Bullet patterns
// You can write your code in this editor

if(Invi_position!=6){

var _YU = 0;

if(blocks>og_blocks/2){
	
	DEF=1;
	
	if(blocks<=og_blocks*0.8){
	   
	   var _YU = 1;
	   
	}
	

if(battle_timer%100==0){
	
	var _freepos = irandom(360/20);
	
	for(var a=0; a<360/20; a++){
	    
		if(a<_freepos-2)||(a>_freepos+2){
		   with(instance_create_depth(	
		   room_width/2+lengthdir_x(170,a*20),
		   (obj_battle_controller.box_Y+obj_battle_controller.heartCase_height/2)
		   +lengthdir_y(170,a*20),
		   
		   depth-8,obj_projectile_parent)){
			   
			   target1 = room_width/2;
			   target2 = obj_battle_controller.box_Y+obj_battle_controller.heartCase_height/2;
			   
			   direction = point_direction(x,y,target1,target2);
			   
		       image_xscale=2;
		       image_yscale=2;
		       speed=1.5+0.5*_YU;
			   
			   
			   
				personal_script = function()
				{
				   if(point_in_circle(target1,target2,
				      x,y,4)){ instance_destroy(); } 	
				}
			   
			   
		   }
		   
		}
		
		
	}
	
}


}
else{
   
   DEF=2;
   
   var _WAI = 60;
   
   if(blocks<og_blocks*0.25){ _WAI = 30; }

   
   if(battle_timer>=80){
	   
	    if(battle_timer==80){
	       targets[0] = instance_create_depth(room_width/2,
	              obj_battle_controller.box_Y+obj_battle_controller.heartCase_height/2,depth-10,obj_projectile_parent  );
				  
            with(targets[0] ){ image_yscale=obj_battle_controller.heartCase_height/8; image_alpha=0; mask_index=-1; hurt=0;}
         }
         else{
	   
	       if(instance_exists(targets[0] )){
	   
	          if(targets[0] .image_alpha<1){ targets[0].image_alpha+=0.02; } 
			  else { hurt=1; }
		 
		      if(battle_timer>110){ targets[0] .image_angle-=60/_WAI + SPD/2; targets[0].hurt=1; }
		 
		   }
		 
		 }
   }
   
   
   
   
   if(battle_timer%_WAI/(SPD+1)==0){
	
	  with(instance_create_depth(room_width/2+(170+30*SPD)*choose(-1,1),
	  obj_battle_controller.box_Y+irandom(obj_battle_controller.heartCase_height),
	  depth-10,obj_projectile_parent)){
		  
		    image_alpha=0;
			target1=4+irandom(2)+other.SPD;
			image_xscale=1;
			image_yscale=1.2;
			if(x>room_width/2){direction=180;}
			
			personal_script = function()
			{
			   if(image_alpha<1){image_alpha+=0.1;}else{speed=target1;}
			   image_angle+=speed*2;
			}
		
	  }
	
   }
   
   
   
}

}else{
	
 if(battle_timer==2){
	 
	 audio_sound_gain(global.AudioStream,0.2,0);
	 
	 targets[0]=instance_create_depth(room_width/2,obj_battle_controller.box_Y-120,depth-2,obj_projectile_parent);
      with(targets[0]){
	    hurt = 0;
		image_alpha=0;
		image_xscale=5;
		image_yscale=5;
		image_blend=c_green;
		vspeed = 2;
		    personal_script = function()
			{
			   if(image_alpha<1){image_alpha+=0.02;}
			   image_angle+=0.25;
			   
			   if(y>=
			   obj_battle_controller.box_Y+obj_battle_controller.heartCase_height/2){
				 vspeed=0;   
			   }
			   
			   obj_battle_controller.TimeAttack=14;
			   
			   if(place_meeting(x,y,obj_heart)){ scr_update_playerhealth(20);  instance_destroy(); }
			   
			}
	  }
  
 }
 
	
}