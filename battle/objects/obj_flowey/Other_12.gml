/// @description  Transition message

EnemyMessage_cc+=0.5;
			  
var _mes = string_copy(EnemyMessage[ EnemyMessage_index ],1,EnemyMessage_cc+1);
			  
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_transformed(x,bbox_top-40,_mes,0.5,0.5,0); 

draw_set_valign(fa_top);