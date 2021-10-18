/// @description

global.Won = 0;

//Background
battle_background = spr_battle_background;
background_x = 0;
background_y = 0;
background_hspeed = 0;
background_vspeed = 0;
background_alpha = 0;

battle_id = global.Battle_id;

alarm[0]=2;
enemy_ids[0]=0;

enemy_floor = room_height/2-64;

image_blend=c_green;

Health = 20;

//Main box
box_Y = room_height/2+2;
box_X = 22;
box_sprite = spr_textbox;

//Battle state
enum BattleState {
   	 playerTurn = 0,
	 playerAttack = 1,
	 enemyTrans = 2,
	 enemyTurn = 3
}

enum MenuIndex {
     take = 0,
	 use = 1
}

state = 0;

actionPos=0;

menuState=-1;
menuPos = 0;

target_enemy = 0;

function draw_hurtmenu() {
	
	var _halfX = box_X+sprite_get_width(box_sprite)/2;
	
	draw_set_color(c_red);
	draw_line_width(
	    _halfX,
		box_Y+30,
		_halfX,
		box_Y+sprite_get_height(box_sprite)-30,
		4
	);
	draw_set_color(c_yellow);
	
	for(var a=1; a<=3; a++){
	
	draw_line_width(
	    _halfX-30*a,
		box_Y+40,
		_halfX-30*a,
		box_Y+sprite_get_height(box_sprite)-40,
		2
	);
	
	draw_line_width(
	    _halfX+30*a,
		box_Y+40,
		_halfX+30*a,
		box_Y+sprite_get_height(box_sprite)-40,
		2
	);
	
	}
	
	draw_set_color(c_green);
	
	for(var a=1; a<=4; a++){
	
	    var _GX = _halfX-30*3;
		
		draw_line_width(
	    _GX-30*a,
		box_Y+50,
		_GX-30*a,
		box_Y+sprite_get_height(box_sprite)-50,
		2
	    );
		
		
		var _GX = _halfX+30*3;
		
		draw_line_width(
	    _GX+30*a,
		box_Y+50,
		_GX+30*a,
		box_Y+sprite_get_height(box_sprite)-50,
		2
	    );
	
	
	}
	
	draw_set_color(c_white);
	
	draw_line_width(_halfX+220*AttackBar_X,box_Y+25,
	_halfX+220*AttackBar_X,
	box_Y+sprite_get_height(box_sprite)-25,
	5);
	
}
	
#region Create buttons

 for(var a=0; a<1; a++){
   var _surf = surface_create(110,42);
   
   surface_set_target(_surf);
   
   var _W=surface_get_width(_surf);
   var _H=surface_get_height(_surf);
   
   draw_line_width(0,1,_W,1,2);
   draw_line_width(_W-2,0,_W-2,_H,2);
   draw_line_width(0,_H-2,_W,_H-2,2);
   draw_line_width(1,0,1,_H,2);
   
   var _txt = "TAKE";
   
   switch(a){
	      case 1: _txt = "ACT"; break;
		  case 2: _txt = "USE"; break;
   }
   
   draw_set_font(fnt_dialogue);
   draw_set_halign(fa_right);
   draw_text(_W-6,6,_txt);
   
   
   
   battle_button[a]=
   sprite_create_from_surface(_surf,0,0,_W,_H,0,0,0,0);
   
   surface_reset_target();
   surface_free(_surf);
 }
   

#endregion


SinW = 0;
SinTime = 0;

instance_create_depth(x,y,0,obj_second_manager);

/*
The way this bar wors is that it goes from -1 to 1,
when the action button is pressed it checks for the variable
and subtracts from your base attack with the formula

Sent_attack = Base_attack - abs(AttackBar_X)*Base_attack;

*/
AttackBar_X = -1;
AttackBar_Speed = 0.02;
AttackBar_Move = 1;
Base_attack = 7;
Sent_attack = 0;

//Heart box
heartCase_height=sprite_get_height(box_sprite);
heartCase_width=sprite_get_height(box_sprite);
heart_movespeed=2;

TimeAttack = global.Attack_time;

X1 = room_width/2-heartCase_width/2;
Y1 = box_Y+14;
X2 = room_width/2+heartCase_width/2;
Y2 = box_Y+heartCase_height-16;

depth=-3;