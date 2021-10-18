/// @description 

timer++;

if(invi){
	
	if(timer%4==0){ visible=!visible; }
	
	invi_index++
	if(invi_index>=invi_time){invi_index=0; invi=false;}
	
}else{ if(!visible){visible=true;} }
