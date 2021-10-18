// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_enemyarray(){
     enemy_ids="";
	 enemy_ids=array_create(instance_number(obj_enemy_parent),-1);
	 
	 var _n = 0;
	 with obj_enemy_parent {
		 other.enemy_ids[_n]=id;
		 _n++;
	 }
}