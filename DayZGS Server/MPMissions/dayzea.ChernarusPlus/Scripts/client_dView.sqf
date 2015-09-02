// Credits AndreTM
// Client dView features

if (isNil "custom_dview") then {
	custom_dview = true;
} else {
	custom_dview = !custom_dview;
};

while {custom_dview} do {	
	
	if (!isNull cursorTarget) then {
		_unit = cursorTarget;
		_urange = round (player distance _unit);
		
		if (((_unit isKindOf "SurvivorBase") || (_unit isKindOf "ZombieBase")) && (_urange < 1200)) then {
		
			_uname = if (_unit isKindOf "SurvivorBase") Then [{"{" + (name _unit) + "}";},{"ZOG"}];
			_t_alive = if (!alive _unit) then [{" (not alive)"},{""}];
			_tag = format["Nick: %1%2",_uname,_t_alive];
			
			cutText [_tag,"PLAIN DOWN",0.1];

		};

	};

	sleep 0.2;
};