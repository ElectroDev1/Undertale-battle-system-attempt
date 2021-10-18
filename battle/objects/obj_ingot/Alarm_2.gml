/// @description Insert description here
// You can write your code in this editor
audio_stop_sound(global.AudioStream);
audio_destroy_stream(global.AudioStream);
		 
		 
global.AudioStream = audio_create_stream("ENEMY.ogg");
audio_play_sound(global.AudioStream,1,1);