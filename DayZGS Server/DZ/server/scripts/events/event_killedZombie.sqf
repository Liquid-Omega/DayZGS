private["_agent","_uid", "_originalPos"];
_agent = _this select 0;
_killer = _this select 1;

_cfgSpawns = configFile >> "CfgSpawns";
DZ_ZombieTypes = getArray(_cfgSpawns >> "types");

_uid = getClientUID(owner _killer);
diag_log format["Player %1 (%2) killed a Zombie",name _killer,_uid];

_loot = [

];

_originalPos = getPosATL _agent;

_rndLoot = floor(random(count _loot));
_spawnLoot = (_loot select _rndLoot); 
//if ((random 1) < 0.05) then //standart
if ((random 1) < 0.8) then

{
	_InLoot = _spawnLoot createVehicle (getPosATL _agent);
//	_InLoot setVariable ["quantity", 1]; //standart 
//FunRandDamQualLoot start
		_qty_max = maxQuantity _InLoot;
		_qty = 0;
		if (_qty_max > 0) then {
			_qty = (_qty_max*2/3) + random (_qty_max/3);
			if (_qty_max > 1) then {_qty = round _qty};
			_InLoot setVariable ["quantity", _qty];
		} else {
			_qty_max = getNumber (configFile >> "CfgVehicles" >> typeOf _InLoot >> "Resources" >> "quantity");
			_qty = _qty_max;
			_InLoot setVariable ["quantity", _qty];
		};
		_InLoot setDamage (random 0.35);
//FunRandDamQualLoot end		
	[_killer,format["",""],"colorAction"] call fnc_playerMessage;
};

//cleanup
sleep 5;

deleteVehicle _agent;

/* zombie respavn
_rnd = floor(random(count DZ_ZombieTypes));
_zombie = createAgent [(DZ_ZombieTypes select _rnd),_originalPos,[],200,"CAN_COLLIDE"];
_zombie addeventhandler ["HandleDamage",{_this call event_hitZombie} ];
_zombie addeventhandler ["killed",{null = _this spawn event_killedZombie} ];
_zombie setDir floor(random 360);
//if ((itemInHands _killer) isKindOf "DefaultWeapon") then
//{
//_zombie reveal [_killer, 4];
//};
//[_killer,format["Zom===== %1",_zombie],"colorAction"] call fnc_playerMessage;
diag_log format["Spawned a zombie: %1 ",_originalPos];
*/