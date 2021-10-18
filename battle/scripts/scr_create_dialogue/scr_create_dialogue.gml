/// @function scr_create_dialogue([text,portraits,scripts]);
/// @param text      the array of dialogue entries
/// @param portraits the array of dialogue portraits
function scr_create_dialogue(){
	
	  //Get the amount of messages
	  var _messages = argument_count;
	  
	  //Loop through the messages
	  with(instance_create_depth(0,0,-1,obj_textbox)){
		  
	   for(var a=0; a<_messages; a++){
		
		  //Get the message array
		  var _root = argument[a];
		  
		  if(!is_array(_root)){
			  Message[DIALOGUE][0]=_root;
		  }else{
		 
		  //Get the message
		  Message[DIALOGUE][a] = "No text was set dummy";
		  if(array_length(_root)>0){
			 Message[DIALOGUE][a] = _root[0]; 
			 
		  }
		  
		  //Get the portrait
		  Message[PORTRAIT][a] = -1;
		  if(array_length(_root)>1){
			 Message[PORTRAIT][a] = _root[1];  
		  }
		  
		  //Get the script and its arguments
		  Message[SCRIPTS][a] = -1;
		  if(array_length(_root)>2){
			 Message[SCRIPTS][a] = _root[2];  
		  }
		  
	      }
		  
		
	   }
	   
	   var _ID = id;
	   
	  }
	  
	  return _ID;
	
	  //GEt the arrays
	  /*var _message_arr = argument[0];
	
	  //Get the amount of entries
      var _messages = array_length(_message_arr);
	  var _portraits = 0;
	  
	  if(argument_count>1){ var _portraits_arr = argument[1];
		                    _portraits = array_length(_portraits_arr); 
	  }
	  
	
	  var _scripts=0;
	  
	  if(argument_count>2){
		 var _scripts_arr = argument[2]; 
		 _scripts = array_length(_scripts_arr);
	  }
		  
	  
	  //Create the textbox and assign the various elements
      with(instance_create_depth(0,0,0,obj_textbox)){
		
		   for(var a=0; a<_messages; a++){
			   Message[DIALOGUE][a]=   _message_arr[a];
		   }
		   
		   for(var a=0; a<_portraits; a++){
			   Message[PORTRAIT][a]=   _portraits_arr[a]; 
		   }
		   
		   for(var a=0; a<_scripts; a++){
			   Message[SCRIPTS][a]=   _scripts_arr[a]; 
			   show_debug_message("Brought in "+string(_scripts_arr[a]));
		   }
		
	  }*/
		  
}