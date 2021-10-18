/// @description
if(onwait>0){ onwait--; }
else{TextPosition++; onwait+=TypeSpeed;}

var currentMessage = Message[DIALOGUE][MessagePosition];



if(keyboard_check_pressed(ord("Z"))){
   if(TextPosition<string_length(currentMessage)){TextPosition=string_length(currentMessage);}	
   else{
	   
	    script_done=0;
	    alarm[0]=1;
		 
	   
	   
	    var _scriptname = -1;
		 var _arguments = 0;
	   
	  //Execute script
	  if(MessagePosition<array_length(Message[SCRIPTS])){
		
		 var _script_arr = Message[SCRIPTS][MessagePosition];	
		 
		 
		 if(!is_array(_script_arr)){
			 _scriptname = _script_arr; 
			 _arguments = 0;
		 }else{
		     _scriptname = _script_arr[0];
			 
			 _arguments = array_length(_script_arr)-1;
		 }
		 
	  }
		 
		 var _script = asset_get_index(_scriptname);
		 
		 
		 //I hate this I hate this I hate this
		 if(script_exists(_script)){
			 
		 switch(_arguments) {
               case 0: return script_execute(_script);
               case 1: return script_execute(_script, _script_arr[1]);
               case 2: return script_execute(_script, _script_arr[1], _script_arr[2]);
               case 3: return script_execute(_script, _script_arr[1], _script_arr[2], _script_arr[3]);
               case 4: return script_execute(_script, _script_arr[1], _script_arr[2], _script_arr[3], _script_arr[4]);
               case 5: return script_execute(_script, _script_arr[1], _script_arr[2], _script_arr[3], _script_arr[4], _script_arr[5]);
               case 6: return script_execute(_script, _script_arr[1], _script_arr[2], _script_arr[3], _script_arr[4], _script_arr[5], _script_arr[6]);
			   
			   
         }
		 
		 script_done=1;
		 
		 }else{ script_done=1; }
		 
	  
	   
	     
	  
	  
   }
}

if(MessagePosition>array_length(Message[DIALOGUE])-1)&&(script_done){ if(canclose)instance_destroy();}