/// @description get to the enemy transition state


with(obj_enemy_parent){
	 EnemyMessage_cc=0; 
     EnemyMessage_index = irandom( array_length(EnemyMessage)-1 );	
	 event_user(4);
} 

state=BattleState.enemyTrans;

