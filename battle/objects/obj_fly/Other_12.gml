/// @description  Transition message

EnemyMessage_cc+=0.5;
			  
var _mes = string_copy(EnemyMessage[ EnemyMessage_index ],1,EnemyMessage_cc+1);
			  
draw_set_halign(fa_center);
draw_text_transformed(x,bbox_bottom+48,_mes,0.5,0.5,0); 