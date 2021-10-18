/// @description


//Draw the textbox
if(!surface_exists(textboxSurf)){
	
   textboxSurf=surface_create(sprite_get_width(textboxSprite),
               sprite_get_height(textboxSprite)
			   );
}else{

   var tx,ty,rot_x,rot_y;
   //calculate offset of top-left corner point from origin
   tx = -(surface_get_width(textboxSurf) div 2);
   ty = -(surface_get_height(textboxSurf) div 2);
   
   center_x=display_get_gui_width()/2;
   center_y=display_get_gui_height()-surface_get_height(textboxSurf)/2;
   
   //calculate rotated coordinates at angle 'rotation'
   rot_x = tx * cos(degtorad(rotation)) - ty * sin(degtorad(rotation));
   rot_y = tx * sin(degtorad(rotation)) + ty * cos(degtorad(rotation));
   
   //add rotated coordinates to center point
   var _textboxX = center_x + rot_x + Txoffset;
   var _textboxY = center_y + rot_y + Tyoffset;
   

   surface_set_target(textboxSurf);   
   
   //Base
   draw_sprite(textboxSprite,0,0,0);
   
   var _textXoffset=0;
   
   //Portrait
   var _porSprite=-1;
   var _porScale=2;
   
   if(MessagePosition<array_length(Message[PORTRAIT])){  
	   
      var _arr=Message[PORTRAIT][MessagePosition];
	   
      if(  is_array(_arr)  ){
		  
		  
         _porSprite=_arr[0];
		 _porScale=_arr[1];
		 
      }else{
		  
		 _porSprite=_arr;
		 
      }
   
   }
	  
   
   if(sprite_exists(_porSprite)){
	   
      draw_sprite_ext(_porSprite,0,
        portraitMarginX,surface_get_height(textboxSurf)/2
        ,_porScale,_porScale,0,c_white,1);
		
	  _textXoffset=128;
   
   }
   
   //Text
   draw_set_halign(fa_left);
   draw_set_valign(fa_top);
   
   draw_set_font(textFont);
   
   var cc,cx=0,cy=0,cw=0;
   
  
   
   //Draw the letters
   var color = textColour;
   var currentMessage = Message[DIALOGUE][MessagePosition];
   
   for(var a=0; a<string_length(currentMessage); a++){
	   
	   if(TextPosition>=a){
		      
		  cc = string_char_at(currentMessage,a+1); 
		   
		  //Manual edits
		  
		  if(cc=="/" && a<string_length(currentMessage)-1){
			  
			  
			 switch(string_char_at(currentMessage,a+2)){
				    case "n":
					   cy+=string_height("M");
					   cc="";
					   cw=0;
					   
					   a+=1;
					   string_delete(currentMessage,a+2,1);
					   
					   //if(onwait>=0){onwait=-TypeSpeed;}
					   
					break;
					
					case "c":
					   switch(string_char_at(currentMessage,a+3)){
						      case "W":
							     color=c_white;
							  break;
							  case "R":
							     color=c_red;
							  break;
							  case "Y":
							     color=c_yellow;
							  break;
					   }
					   cc="";
					   string_delete(currentMessage,a+2,1);
					   string_delete(currentMessage,a+3,1);
					   if(TextPosition==a){onwait=-TypeSpeed;}
					   a+=2;
					   
					break;
			 }
			
			  
		  }

		  //Line break
		  
		  //Automatic
		  cw+=string_width(cc);
		  cx = textMargin_X+portraitMarginX+cw+_textXoffset;
		  
		  if(cx>=surface_get_width(textboxSurf)-(textMargin_X+16)){
			 cw=0;  
			 cy+=string_height("M");
		  }else{
		  cw-=string_width(cc);
		  }
		 
		  
		  
		  cx = textMargin_X+portraitMarginX+cw+_textXoffset;
	   
	   
	      if(a==0){draw_text(cx-14,textMargin_Y+cy,"*");}
	      
	      draw_text_transformed_color(cx + string_width("*"),textMargin_Y+cy,cc,1,1,0,color,color,color,color,1);
		  
		  cw+=string_width(cc);
		  
	   
	   }
   }
   
   
   
   surface_reset_target();


   draw_surface_ext(textboxSurf,_textboxX,_textboxY,1,1,-rotation,c_white,1);
   
	
}
