diag_log "SERVER: LOAD spawn proc";

fnc_spawnZombie = 
{
	DZ_TotalZombies = DZ_TotalZombies + 1;
	_zombie = createAgent [_this select 0, _this select 1,[],0,"CAN_COLLIDE"];
	_zombie addeventhandler ["HandleDamage",{_this call event_hitZombie} ];
	_zombie addeventhandler ["killed",{null = _this spawn event_killedZombie} ];
	_zombie setDir floor(random 360);
	_zombie
};

fnc_findRndPos = {
	_pos0 = _this select 0;
	_radius0 = _this select 1;
	_angle = floor random 360;
	_radius = (_radius0 select 0) + random ((_radius0 select 1) - (_radius0 select 0));
	_newX = (_pos0 select 0) + _radius * (cos _angle);
	_newY = (_pos0 select 1) + _radius * (sin _angle);
	//_newZ = ASLtoATL getTerrainHeightASL [_newX,_newY];
	_newZ = 0.05;
	_result = [_newX,_newY,_newZ];
	_result
};

diag_log "SERVER: LOAD fnc_Points";

fnc_PointsClearP = {
	private ["_array"];
	_array = [] + _this;
	{
		if (typeName (_x select 0) == "ARRAY") then {
			_array set [_forEachIndex, _x select 0];
		};
	} forEach _array;
	_array
};

fnc_PointsCheckP = {
	private ["_array","_params","_newx"];
	_array = _this select 0;
	_params = _this select 1;
	{
		if (typeName (_x select 0) != "ARRAY") then {
			_newx = [_x] + _params;
		} else {
			_newx = [] + _x;
			for "_i" from 1 to count _params do {
				_xi = _newx select _i;
				if (isNil "_xi") then {
					_newx set [_i,_params select (_i-1)];
				};
			};
		};
		_array set [_forEachIndex, _newx];
	} forEach _array;
	_array
};

fnc_PointsResize = {
	private ["_array","_size","_arrayNew","_sizeNew"];
	_array = _this select 0;
	_sizeNew = _this select 1;
	_size = count _array;
	_arrayNew = [] + _array;
	switch true do {
		case (_sizeNew < _size) : {
				_arrayNew resize _sizeNew;
//				diag_log format ["POINTS: <- resized %1=>%2",count _array,count _arrayNew];
			};
		case (_sizeNew > _size) : {
				for "_i" from 0 to (_sizeNew - _size - 1) do {
					_arrayNew set [_size + _i, _array select (floor(random _size)) ];
				};
//				diag_log format ["POINTS: -> resized %1=>%2",count _array,count _arrayNew];
			};
		default { /*do nothing*/ };
	};
	_arrayNew
};


diag_log "SERVER: LOAD fnc_Items";

fnc_ItemsClearP = {
	private ["_array"];
	_array = [] + _this;
	{
		if ((typeName _x) == "ARRAY") then {
			_array set [_forEachIndex, _x select 0];
		};
	} forEach _array;
	_array
};

fnc_ItemsCheckP = {
	private ["_array","_params","_newx"];
	_array = _this select 0;
	_params = _this select 1;
	{
		if ((typeName _x) != "ARRAY") then {
			_newx = [_x] + _params;
		} else {
			_newx = [] + _x;
			for "_i" from 1 to count _params do {
				_xi = _newx select _i;
				if (isNil "_xi") then {
					_newx set [_i,_params select (_i-1)];
				};
			};
		};
		_array set [_forEachIndex, _newx];
	} forEach _array;
	_array
};

fnc_ItemsResize = {
	private ["_array","_size","_arrayNew","_sizeNew"];
	_array = _this select 0;
	_sizeNew = _this select 1;
	_size = count _array;
	_arrayNew = [] + _array;
	switch true do {
		case (_sizeNew < _size) : {
				_arrayNew resize _sizeNew;
			};
		case (_sizeNew > _size) : {
				for "_i" from 0 to (_sizeNew - _size - 1) do {
					_arrayNew set [_size + _i, _array select (floor(random _size)) ];
				};
			};
		default { /*do nothing*/ };
	};
	_arrayNew
};

fnc_ItemsDeploy = {
	private ["_array","_arrayNew","_counter"];
	_array = [] + _this;
	_arrayNew = [];
	_counter = 0;
	{
		for "_i" from 0 to ((_x select 1) - 1) do {
			_arrayNew set [_counter, _x select 0];
			_counter = _counter + 1;
		};
	} forEach _array;
	_arrayNew
};