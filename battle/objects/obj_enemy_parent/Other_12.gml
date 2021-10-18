/// @description  Transition message

EnemyMessage_cc+=0.5;
			  
var _mes = string_copy(EnemyMessage[ EnemyMessage_index ],1,EnemyMessage_cc+1);
			  
draw_set_halign(fa_left);
draw_text_transformed(bbox_right+32,bbox_top,_mes,0.5,0.5,0); 