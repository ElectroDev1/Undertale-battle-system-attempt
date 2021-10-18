/// @description

if(shake[0]>0){shake[0]-=0.2;}
timer++;
if(!instance_exists(obj_textbox)){battle_timer++;}

#region Sprite logic

 if(!dead){
	 
	 if(blocks>=og_blocks){
		current_sprite=enemy_sprite[State.idle]; 
	 }
	 else if(blocks>=og_blocks/10*7.5){ current_sprite=enemy_sprite[State.half];  }
	 else if(blocks<=og_blocks/10*2.5){ current_sprite=enemy_sprite[State.dead];  }
	 else { current_sprite=enemy_sprite[State.half];  }
	 
 }else{
	 current_sprite=enemy_sprite[State.dead];
 }

#endregion

#region Attack

   if(Attack){ event_user(3); }

#endregion