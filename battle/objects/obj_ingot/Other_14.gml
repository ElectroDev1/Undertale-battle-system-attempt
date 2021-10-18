EnemyMessage=[""];
var _G

if(!instance_exists(obj_textbox)){
	  
	  switch(Invi_position){
		     default: _G = scr_create_dialogue(
			 
			   [
			     choose(
				    "The creature looks at/nyou in a weird way.",
					"Smells like carrots and/nold tires.",
					"You wish you could be/nsomewhere else."
				 )
				 ,-1
			   ]
			   
			 
			 ); _G.Tyoffset=-68; break;
			 
	         case 1:
			      
			      _G = scr_create_dialogue(
				  ["The Abomination's DEF/nincreased to infinity",-1],
				  ["Did you really think/nit would have been/nthat easy?",-1]); 
				 
				 alarm[2]=40;
				 
			     with(_G){ Tyoffset=-68; } 
				 audio_sound_gain(global.AudioStream,0.3,0);
				 obj_battle_controller.background_hspeed+=0.5;
				 obj_battle_controller.background_vspeed+=0.5;
				 
		     break;
			 
			 case 2:
			     
			      _G = scr_create_dialogue(["If the guardian of/nthe Glade of Dreams can't/nbeat me...",-1]
				  ,["What makes you think/nYOU can?",-1]); 
				 
			     with(_G){ Tyoffset=-68; } 
				 
				 obj_battle_controller.background_hspeed+=0.5;
				 obj_battle_controller.background_vspeed+=0.5;
				 
		     break;
			 
			 case 3:
			     
			      _G = scr_create_dialogue(["I could stay here forever",-1],
				  ["But I can't say the same/nabout YOU",-1]); 
				
			     with(_G){ Tyoffset=-68; } 
				 
				 obj_battle_controller.background_hspeed+=0.5;
				 obj_battle_controller.background_vspeed+=0.5;
				 
		     break;

			 case 4:
			     
			      _G = scr_create_dialogue(["...",-1]); 
				 
			     with(_G){ Tyoffset=-68; } 
				 
				 obj_battle_controller.background_hspeed+=0.5;
				 obj_battle_controller.background_vspeed+=0.5;
				 
		     break;
			 
			 
			 case 5:
			 case 6:
			     
			      _G = scr_create_dialogue(["...",-1],
				  ["You really think you/ncan go forever uh",-1],
				  ["Well get ready then...",-1],
				  ["The Abomination throws a/npiece of its lollipop/nat you.",-1]
				  ); 
				 
			     with(_G){ Tyoffset=-68; }
				 
				 obj_battle_controller.background_hspeed=1;
				 obj_battle_controller.background_vspeed=1;
				 Invi_position=6;
				 
		     break;
			 
			 
			 case 7:
			     
				alarm[3]=1;
         //audio_sound_gain(global.AudioStream,0,0);
         //audio_sound_gain(global.AudioStream,1,2000);
		 
			      _G = scr_create_dialogue(
				  ["The Abomination's DEF/ndropped to 0",-1],
				  ["The Abomination's SPD/nincreased",-1],
				  ["The Abomination's Attack Time/nincreased a lot",-1],
				  ["...",-1],
				  ["Let's see...",-1],
				  ["how...",-1],
				  ["good...",-1],
				  ["YOU are",-1]
				  ); 
				  amplitude=2;
				 
			     with(_G){ Tyoffset=-68; } 
				 
				 global.Attack_time=2500;
				 SPD = 1;
				 DEF = -1;
				 
				 obj_battle_controller.background_hspeed=8;
				 obj_battle_controller.background_vspeed=8;
				 
		     break;
			 
			 case 8:
			     
				 audio_stop_all();
				 audio_destroy_stream(global.AudioStream);
			      _G = scr_create_dialogue(["Oh....",-1],
				  ["I see...",-1],
				  ["YOU really are a strong/n...hero.",-1],
				  ["Well...    /nI guess.. it's time/nfor me to go...",-1]
				  ); 
				 amplitude=0.5;
			     with(_G){ Tyoffset=-68; } 
				 
				 obj_battle_controller.background_hspeed=1;
				 obj_battle_controller.background_vspeed=1;
				 
		     break;
	  }
	  
	  battle_timer=1;
   }