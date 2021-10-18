/// @description Check if every enemy is gone
if(!instance_exists(obj_enemy_parent)){

   var _f=scr_create_dialogue(["YOU WON!",-1],["Hope you're satisfied",-1]);
   _f.Tyoffset=-68;
   _f.canclose=false;
   

}
