// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function battle_init(battle_id = 0){
     
	 switch(battle_id){
	
	        case 0:
			   instance_create_layer(room_width/2,enemy_floor,"enemies",obj_enemy_parent);
			   
			   var _f = scr_create_dialogue(["A wild flower appears",-1]);
			   _f.Tyoffset=-68;
			   global.Attack_time=90;
			break;
			
			case -5:
			  
			   /*instance_create_layer(room_width/2+200,enemy_floor,"enemies",obj_flowey);
			  instance_create_layer(room_width/2,enemy_floor-96,"enemies",obj_fly);
			  instance_create_layer(room_width/2-200,enemy_floor,"enemies",obj_flowey);*/
			 
			   instance_create_layer(room_width/2,enemy_floor,"enemies",obj_ingot);
			   
			   //var _f = scr_create_dialogue(["Two wild flowers appear!",-1],["There is also a fly/nnearby.",-1]);
			   var _f = scr_create_dialogue(["A weird rabbit/nblocks the way...",-1]);
			   _f.Tyoffset=-68;
			   global.EnemyTrans_mode=1;
			   
			   background_vspeed=1;
			   background_hspeed=3;
			   global.Attack_time=510;
			   
			break;
	
	 }
	 
	 update_enemyarray();
	 
}