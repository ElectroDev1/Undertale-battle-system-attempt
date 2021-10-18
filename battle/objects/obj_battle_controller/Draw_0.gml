/// @description


draw_text_transformed(10,10,"FPS:"+string(fps),0.5,0.5,0);

/*for(var a=0; a<array_length(enemy_ids); a++){
  if(instance_exists(enemy_ids[a])){	
    draw_text_transformed(10,25+10*a,"Enemy id "+string(a)+": "+string(enemy_ids[a])+" / "+string(enemy_ids[a].Name)
	,0.5,0.5,0);
  }
}*/



//Main box
if(state!=BattleState.enemyTurn){
draw_sprite(box_sprite,0,box_X,box_Y);
}

//draw_sprite_ext(box_sprite,0,box_X,box_Y,1,1,0,c_black,background_alpha*1.5);



switch(state){
	
	   #region Player turn
       case BattleState.playerTurn: //Player turn menu


		 if(background_alpha > 0){background_alpha-=0.1;}  


	     switch(menuState){
			 
			case -1: 
	        //Draw buttons
	        for(var a=0; a<array_length(battle_button); a++){
				
				var _X = box_X+6+140*a;
				var _Y = box_Y+sprite_get_height(box_sprite)+21;
				
				if(a==actionPos && !instance_exists(obj_textbox)){
					draw_sprite_ext(spr_blood,0,_X+6,_Y+13,16,16,0,c_red,1);
				}
				
                draw_sprite(battle_button[a],0,_X,_Y);
            }
			break;
			
			case MenuIndex.take:
			
			//Draw the enemy names
			if(instance_exists(obj_enemy_parent)){
				
			   for(var a=0; a<array_length(enemy_ids); a++){
				   
				   
				   
				   if((a+1)%2==0){var _Xid = box_X+52+300}
				   else{ var _Xid = box_X+52; }
				   
				   if(a<2){var _Yid = box_Y+28;}
				   else{ var _Yid = box_Y+28+40+string_height("M"); }
				   
				   draw_text(_Xid,_Yid,string(enemy_ids[a].Name));
				   
				   if(a==menuPos){//Selecting an enemy
					   draw_sprite_ext(spr_blood,0,_Xid-20,_Yid+7,16,16,0,c_red,1);
					   
					   with(enemy_ids[a]){
						    event_user(1);  
					   }
				   }
				   
			   }
			   
			}
			
			break;
			
			
		 }
	   
	   break;
	   #endregion
	   
	   case BattleState.playerAttack:
	   
	       draw_hurtmenu();
	   
	   break;
	   
	   case BattleState.enemyTrans:
	   
	      with(obj_enemy_parent){
			  if(blocks>0){
			    event_user(2);
			  }
		  }
	   
	   break;
	   
	   
	   //Enemy turn
	   case BattleState.enemyTurn:
	 

			if(background_alpha < 0.4){ background_alpha+=0.05;}  
			

            if(TimeAttack<10){X1=lerp(X1,room_width/2-heartCase_width*1.75,0.1);
				             X2=lerp(X2,room_width/2+heartCase_width*1.75,0.1);}
			else{
			   X1=lerp(X1,room_width/2-heartCase_width/2,0.2);
			   X2=lerp(X2,room_width/2+heartCase_width/2,0.2);
			}

            draw_line_width(X1,Y1,X1,Y2,4);
            draw_line_width(X1,Y1,X2,Y1,4);
            draw_line_width(X2,Y1,X2,Y2,4);
            draw_line_width(X1,Y2,X2,Y2,4);
			
			
		  
	   break;

}


#region HUD

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(32,402,"YOU");

//Blocks

draw_text(152,402,"OB "+
 string_replace_all(string_format(global.OwnedBlocks,2,0)," ","0"));

//Health
var _health_x = 300;


draw_text(_health_x,402,"BL");

var _r_W = global.HealthMax*6;

draw_set_colour(c_red);
draw_rectangle(
_health_x+string_width("BL")+3 ,
402+3,
_health_x+string_width("BL")+3 + _r_W,
402+string_height("BL")-3,0);

draw_set_colour(c_yellow);
draw_rectangle(
_health_x+string_width("BL")+3 ,
402+3,
_health_x+string_width("BL")+3 + (global.Health)*6,
402+string_height("BL")-3,0);

draw_set_colour(c_white);

draw_text(
_health_x+string_width("BL")+3 + _r_W + 5,
402,
string(global.Health)+" / "+string(global.HealthMax));

#endregion