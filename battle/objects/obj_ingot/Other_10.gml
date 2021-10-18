/// @description get hurt
shake[0]=6;
health_show=1;

var pre_blocks=blocks;

if(DEF>=0){
	
if(blocks-taken_damage>0){
   	blocks-=taken_damage;
}else{Invi_position++;}

}else{ blocks=0; shake[0]=12; }

alarm[0]=100;



if(blocks>=0){
   for(var a=0; a<pre_blocks-blocks; a++){
       instance_create_depth(x,y,obj_battle_controller.depth-2,obj_blood);
   }
}