// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_playerhealth(amount = 1){
    global.Health+=amount;
	if(global.Health>global.HealthMax){ global.Health=global.HealthMax; }
	return global.Health;
}