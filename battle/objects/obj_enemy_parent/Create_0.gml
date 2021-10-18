/// @description
depth=-2;
blocks = 6;
og_blocks = blocks;
menublocks=0;

DEF = 0;


taken_damage=2;

shake[1]=0;

enum State {
   idle = 0,
   hurt = 1,
   half = 2,
   dead = 3,
}

dead=false;

enemy_sprite[State.idle]=spr_flowey;
enemy_sprite[State.half]=spr_flowey_hurt;
enemy_sprite[State.hurt]=spr_flowey_hurt;
enemy_sprite[State.dead]=spr_flowey_bare;

current_sprite=enemy_sprite[State.idle];

health_show = 0;

alarm[1]=2;

scale = 8;

Name = "Flowey";

EnemyMessage = ["Prepare to\n...\ndie!!","Please be\ncareful."];
EnemyMessage_index = 0;
EnemyMessage_cc = 0;

Attack = 0;

timer=0;
battle_timer=0;

targets[0]=0;