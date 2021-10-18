/// @description


if(state==0){
x+=movespeed*dir;

if(vsp<4){vsp+=grav;}

y+=vsp;

image_angle-=2*dir;

}else if(state==1){

x=lerp(x,170,0.2);
y=lerp(y,room_height-70,0.2);

if(image_alpha>0){image_alpha-=0.2;}else{ with(obj_battle_controller){alarm[1]=50;} instance_destroy();}
if(image_alpha==0.2){global.OwnedBlocks++;}

image_angle=lerp(image_angle,0,0.1);

}