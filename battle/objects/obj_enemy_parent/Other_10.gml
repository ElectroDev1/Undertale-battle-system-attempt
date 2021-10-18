/// @description get hurt
shake[0]=6;
health_show=1;

var pre_blocks=blocks;

blocks-=taken_damage;

alarm[0]=100;
if(blocks>=0){
   for(var a=0; a<pre_blocks-blocks; a++){
       instance_create_depth(x,y,obj_battle_controller.depth-2,obj_blood);
   }
}