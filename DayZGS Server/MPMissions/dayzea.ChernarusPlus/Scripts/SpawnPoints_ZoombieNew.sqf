DZ_DIR_S = "";

SpawnPointsZ_spawn = {

diag_log "SERVER: Run SpawnPointsZ_spawn ======================================================================================";

private ["_arrayPoints","_arrayTypes","_queryPoints","_totalTypes","_counter","_zombie"];
_queryPoints = _this select 0;
_arrayPoints = _this select 1;
_arrayTypes = _this select 2;

//diag_log format["SPAWN PZ: size %1 query %2",count _arrayPoints,_queryPoints];
if (_queryPoints != count _arrayPoints) then {
	_arrayPoints = [_arrayPoints,_queryPoints] call fnc_pointsResize;
};
//diag_log format["SPAWN PZ: size %1 query %2",count _arrayPoints,_queryPoints];
_totalTypes = count _arrayTypes;

_counter = 0;
{
	for "_i" from 0 to ((_x select 2) - 1) do {
		_posZ = [_x select 0,[0,_x select 1]] call fnc_findRndPos;
		[_arrayTypes select (floor(random _totalTypes)),_posZ] spawn fnc_spawnZombie;
		_counter = _counter + 1;
	};
} forEach _arrayPoints;

diag_log format["SPAWNED free Zombies + %1 ************************************************",_counter];

};

diag_log "SERVER: LOAD SpawnPointsZ_data";

_spawnParams = [
	10,     // default radius
	15       // default quantity
];

_arrayPoints = [


];

_arrayTypes = getArray( configFile >> "CfgSpawns" >> "types" );

_arrayPoints = [_arrayPoints,_spawnParams] call fnc_PointsCheckP;
[DZ_Q_Points_Zombie,_arrayPoints,_arrayTypes] spawn SpawnPointsZ_spawn;

diag_log "SERVER: End SpawnPointsZ_spawn ======================================================================================";