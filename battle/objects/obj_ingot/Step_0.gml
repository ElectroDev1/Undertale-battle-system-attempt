/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(global.Won){
	
   blocks=1;	
	
   if(!instance_exists(obj_textbox)){
	  shake[0]+=0.02;
	  image_alpha-=0.02;
	   if(image_alpha<-2){
		   
		    repeat(og_blocks-global.OwnedBlocks){instance_create_depth(x,y,obj_battle_controller.depth-2,obj_blood);}
		   instance_destroy();}
   }
   
  
	
}