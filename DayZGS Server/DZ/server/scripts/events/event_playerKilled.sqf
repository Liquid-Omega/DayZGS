// Credits AndreTM

message_clients = {

	private ["_action","_agent","_killer","_act_text","_agent_UID","_agent_name","_killer_name","_text"];
	_action = _this select 0;
	_agent = _this select 1;
	_killer = _this select 2;

	diag_log format["=== TEST: START MESS playerKilled -> %1 %2 %3",_action,_agent,_killer];
	
	_act_text = "";

	_agent_UID = getPlayerUID _agent;
	_agent_name = if (_agent_UID == "") then [{typeOf _agent},{name _agent}];

	_killer_name = "";
	_kill_dist = "";
	
	switch (_action) do {
		case "DIE" : {
			_act_text = "wants to die";
			};
		case "LOSS" : {
			_act_text = "died from the explosion";
			_killer_name = "{Grenage, Missile, Rocket,..}";
			};
		case "DEATH" : {
			_act_text = "was killed by ZOG";
			_killer_name = "{" + (str _killer) + "}";
		};
		case "MURDER" : {
			_act_text = "was killed by";
			_killer_name = "{" + (name _killer) + "}";
			_kill_dist = format["(Range = %1 m)",round(_agent distance _killer)];
			};
		default {};
	};
	
	_text = "Player {" + _agent_name + "} " + _act_text + " " + _killer_name + " " + _kill_dist;
	
	{
		//(owner _x) statusChat [_text,"ColorAction"];
		[_x,_text,"colorAction"] call fnc_playerMessage;
	} forEach players;
	
	diag_log format["=== TEST: MESS playerKilled === %1  (%2 <- %3)",_text,getPos _agent,getPos _killer];

};

//

// four types: suicide, murder, death, loss

	private ["_agent","_killer","_agent_UID","_agent_name","_action_name"];
	_agent = _this select 0;
	_killer = _this select 1;
	
//	diag_log format["=== TEST: START ALT playerKilled -> %1 %2",_agent,_killer];
	
	_agent_UID = getClientUID (owner _agent); // empty <=> disconnected, string <=> UID
	_agent_name = if (_agent_UID == "") then [{typeOf _agent},{name _agent}];	
	_action_name = "";

if ( (vehicle _agent) != _agent ) then 
{ 
    _agent action ["Eject", vehicle _agent]; 
};

		_agent setVariable ["bleedingsources","[]"];
		_agent setVariable ["timeOfDeath",diag_tickTime];

		
	if (isNull _killer) then {
	
		["LOSS",_agent,objNull] spawn message_clients;
		
	} else {
		
		if (_agent == _killer) then {
		
			["DIE",_agent,objNull] spawn message_clients;
			
		} else {
		
			if (_killer isKindOf "ZombieBase") then {
			
				["DEATH",_agent,_killer] spawn message_clients;
			
			} else {
			
				["MURDER",_agent,_killer] spawn message_clients;
		
			};
	
		};
		
	};

//	_action_name = if (isNull _killer) then [{"LOSS"},{"DIE"}];
//	[_action_name,_agent,objNull] spawn message_clients;

		if (_agent_UID != "") then {
		
			if (DZ_MP_CONNECT) then {
				_agent call dbSavePlayerPrep;
				dbServerSaveCharacter _agent;
				dbKillCharacter _agent_UID;
			};
		};
	
	
//	diag_log format["=== TEST: END ALT playerKilled -> %1 %2",_agent,_killer];
