/// @description Battle logic

SinW=sin(SinTime*0.1);
SinTime++;

background_x+=background_hspeed;
background_y+=background_vspeed;

var bg_width = sprite_get_width(battle_background);
var bg_height = sprite_get_height(battle_background);


if(background_x>=bg_width){background_x=0;}
if(background_y>=bg_height){background_y=0;}



var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _mov = _right-_left;

var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _movY = _down-_up;


var _select = keyboard_check_pressed(ord("Z"));
var _back = keyboard_check_pressed(ord("X"));

switch(state){
	
	   #region Player Turn
       case BattleState.playerTurn:
	   
	    switch(menuState){//Player turn menu logic
			
			#region Choose action
			case -1:
			
	        //Move through the buttons
			if(!instance_exists(obj_textbox)){
				
			if(_mov>0){ 
			   actionPos++;
			   if(actionPos>=array_length(battle_button)){actionPos=0;}
			}
			
			if(_mov<0){ 
			   actionPos--;
			   if(actionPos<0){actionPos=array_length(battle_button)-1;}
			}
			
			//Select
			if(_select){
				
			   menuPos = 0;
			   update_enemyarray();
               menuState = 0//actionPos;
			
			}
			
			
			}
			
			break;
			#endregion
			
			#region Attack menu
			case MenuIndex.take://Attack menu
			
			if(_mov>0){ 
			   menuPos++;
			   if(menuPos>=array_length(enemy_ids)){menuPos=0;}
			}
			
			if(_mov<0){ 
			   menuPos--;
			   if(menuPos<0){menuPos=array_length(enemy_ids)-1;}
			}
			
			if(_back){
			   actionPos=menuState;
			   menuState=-1;
			}
			
			if(_select){//Start the attack phase
			   AttackBar_X = -1;
			   AttackBar_Move = 1;
			   target_enemy = menuPos;
			   
			    
			   if(is_array(enemy_ids)){	
				state=BattleState.playerAttack;	
			   }else{
				scr_create_dialogue(["There is no one left.",-1]);   
			   }
			}
			
			break;
			#endregion
			
		}
			

	   break;
	   #endregion
	   
	   #region Player Attach
	   case BattleState.playerAttack:
	   
	        AttackBar_X+=AttackBar_Speed*AttackBar_Move;
			
			if(AttackBar_X<=1){
			
			   if(keyboard_check_pressed(ord("Z"))&&(AttackBar_Move)){
				 
				  AttackBar_Move=0;
				  
			      //Calculate the attack to give and attack!
			      Sent_attack = round(Base_attack - abs(AttackBar_X)*Base_attack - max(enemy_ids[target_enemy].DEF,0));
			   
			      if(Sent_attack>enemy_ids[target_enemy].blocks){Sent_attack=enemy_ids[target_enemy].blocks;
					  
					  
				  }
			   
			      enemy_ids[target_enemy].taken_damage = Sent_attack;
				  with(enemy_ids[target_enemy]){ event_user(0);  }
				  
				  menuState=-1;
				  alarm[2]=90;
			   
			   }
			
			}else if(AttackBar_X==1.2){
				 menuState=-1;
				 
				 var _f = scr_create_dialogue(["You missed.",-1]);
			      _f.Tyoffset=-68;
				 state=BattleState.playerTurn;
			}
	   
	   break;
	   #endregion
	   
	   #region Enemy transition
	   
	   case BattleState.enemyTrans:
	   
	        //Go to the enemy attack state
	        if (global.EnemyTrans_mode==0 && keyboard_check_pressed(ord("Z")) )
			
			   || (global.EnemyTrans_mode==1 && !instance_exists(obj_textbox))
			   	   
			   {
				   
				   
			   state = BattleState.enemyTurn;	
			   X1 = room_width/2-heartCase_width*2;
               Y1 = box_Y+14;
               X2 = room_width/2+heartCase_width*2;
               Y2 = box_Y+heartCase_height-16;
			   TimeAttack = global.Attack_time;
			   with(obj_enemy_parent){battle_timer=0; Attack=1;}
			   instance_create_depth(room_width/2,
			   box_Y+heartCase_height/2-16,depth-3,obj_heart);
			}
	   
	   break;
	   
	   #endregion
	   
	   #region Enemy turn
	   
	   case BattleState.enemyTurn:
	   
	   if(TimeAttack>0){ if(!instance_exists(obj_textbox)){TimeAttack--;} }else
	   if(X1<=room_width/2-heartCase_width+1){
		
		  //Get out of the attack
		  with(obj_heart){instance_destroy();}
		  with(obj_projectile_parent){instance_destroy();}
		  with(obj_enemy_parent){Attack=0;}
		  state=BattleState.playerTurn;
		
	   }
	   
	   //Get coordinates
	   var _X1 = room_width/2-heartCase_width/2+4;
       var _Y1 = box_Y+14+4;
       var _X2 = room_width/2+heartCase_width/2-3;
       var _Y2 = box_Y+heartCase_height-16-3;
	   
	   var H_right = keyboard_check(vk_right);
	   var H_left = keyboard_check(vk_left);
	   var H_up = keyboard_check(vk_up);
	   var H_down = keyboard_check(vk_down);
	   
	   var H_movX = H_right-H_left;
	   var H_movY = H_down-H_up;
	   
	   //Move the heart
	   var H_hsp = H_movX*heart_movespeed;
	   var H_vsp = H_movY*heart_movespeed;
	   
	   
	   with(obj_heart){
		
		    if(H_vsp<0 && bbox_top <= _Y1){
			   H_vsp=0;	
			}
			
			if(H_vsp>0 && bbox_bottom >= _Y2){
			   H_vsp=0;	
			}
			
			if(H_hsp<0 && bbox_left <= _X1){
			   H_hsp=0;	
			}
			
			if(H_hsp>0 && bbox_right >= _X2){
			   H_hsp=0;	
			}
		
		    x+=H_hsp;
			y+=H_vsp;
			
			//Collide with projectile
			var _col = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,
			obj_projectile_parent,1,0);
			
			if(_col){
			  if(_col.hurt){	
			   if(!invi){
				  global.Health-=2; 
				  invi=true;   
			   }
			  }
			}
	   }
	   
	   
	   
	   break;
	   
	   #endregion

}

if(global.Won){
   state=BattleState.playerTurn;
   menuState=-1;	
}


if(global.Health<=0){

   if(instance_exists(obj_heart)){
	  global.HeartX=obj_heart.x;
	  global.HeartY=obj_heart.y;
	  room_goto(rm_death);
	  audio_stop_all();
   }
	
}