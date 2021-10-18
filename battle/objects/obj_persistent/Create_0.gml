/// @description 
global.Health = 20;
global.HealthMax = 20;

global.OwnedBlocks = 0;

global.Won = 0;
global.Battle_id = -5;

global.Attack_time = 150;

global.EnemyTrans_mode = 0;

global.HeartX = 0;
global.HeartY = 0;

global.AudioStream = audio_create_stream("DOG.ogg");

audio_play_sound(global.AudioStream,1,1);
audio_sound_gain(global.AudioStream,0.5,0);