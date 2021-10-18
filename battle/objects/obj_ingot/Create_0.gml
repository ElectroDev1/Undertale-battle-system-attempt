/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
blocks=30;
Name="Abomination";
EnemyMessage=[""];
Invi_position =0;
SPD=0;
amplitude = 1;

function draw_body() {
	
	    var W = sin((timer*amplitude)*0.1);
		var _randoX = round(random_range(-shake[0],shake[0]))*2;
        var _randoY = round(random_range(-shake[1],shake[1]))*2;
	
	    var _angle = 5*W;
		
		draw_sprite_ext(spr_ingot_ear,0,x+_randoX-3*_angle-30
		,y+64-180+lengthdir_y(108,_angle/4)
		,1,1,8*W+10,c_white,image_alpha);
		
		draw_sprite_ext(spr_ingot_ear,0,x+_randoX-3*_angle+18
		,y+64-180+lengthdir_y(108,_angle/1.5)
		,1,1,8*W-10,c_white,image_alpha);
		
		
		draw_sprite_ext(spr_ingot_lollypop,0,x+_randoX-2.3*_angle+63
		,y+64-85+lengthdir_y(108,_angle/1.5)-20*W
		,1,1,20*W-20,c_white,image_alpha);
		
		
		draw_sprite_ext(spr_ingot_armL,0,x+_randoX-3*_angle+20
		,y+64-85+lengthdir_y(108,_angle/1.5)
		,1,1,18*W,c_white,image_alpha);
		
		
		draw_sprite_ext(spr_ingot_leg,0,x+_randoX+18
		,y+44
		,-1,1,5*W,c_white,image_alpha);
		
		draw_sprite_ext(spr_ingot_leg,0,x+_randoX-18
		,y+44
		,1,1,0,c_white,image_alpha);
		
	
        draw_sprite_ext(spr_ingot_body,0,x+_randoX,y+64,1,1,5*W,c_white,image_alpha);	
		
		
		
		
		
		
		draw_sprite_ext(spr_ingot_armR,0,x+_randoX-1.5*_angle-25
		,y+64-75+lengthdir_y(108,_angle/4)
		,1,1,-10*W,c_white,image_alpha);
		
		
		
		draw_sprite_ext(spr_ingot_eyeL,0,x-15*W+_randoX-16
		,y+64-138-4-4*W
		,1,1,0,c_white,image_alpha);
		
		draw_sprite_ext(spr_ingot_eyeL,0,x-16*W+_randoX+32
		,y+64-138-6-6*W
		,1,1,0,c_white,image_alpha);
		
		
		draw_sprite_ext(spr_ingot_mouth,0,x+_randoX-2*_angle+8
		,y+64-118+lengthdir_y(108,_angle/2)
		,1,1,5*W,c_white,image_alpha);	
}