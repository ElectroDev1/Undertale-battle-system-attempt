// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_real_shit(){
	     audio_stop_sound(global.AudioStream);
		 audio_destroy_stream(global.AudioStream);
		 
		 
		 global.AudioStream = audio_create_stream("FINALE.ogg");
		 audio_play_sound(global.AudioStream,1,1);
         audio_sound_gain(global.AudioStream,0,0);
         audio_sound_gain(global.AudioStream,1,2000);
}