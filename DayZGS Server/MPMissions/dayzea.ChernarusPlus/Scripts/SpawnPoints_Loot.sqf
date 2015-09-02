DZ_DIR_S = "";

SpawnPointsL_spawnEqual = {

diag_log "SERVER: Run SpawnPointsL_spawnEqual ======================================================================================";

private ["_arrayPoints","_arrayTypes","_totalTypes","_counter","_item","_type"];

_arrayPoints = _this select 0;
_arrayTypes = _this select 1;

_totalTypes = count _arrayTypes;
_arrayItems = [];
_totalItems = 0;

_counter = 0;
{
	for "_i" from 0 to (_x select 2) - 1 do {
		if (_totalItems == 0) then {_arrayItems = [] + _arrayTypes; _totalItems = _totalTypes};
		
		_itemIndex = floor (random _totalItems);
		_item = _arrayItems select _itemIndex;

		_posL = [_x select 0,[(_x select 1) - 1,(_x select 1) + 1]] call fnc_findRndPos;
		_posL set [2, 0.4];
		
		_loot = createVehicle [_item select 0,_posL,[],0,"CAN_COLLIDE"];
		_qty_max = maxQuantity _loot;
		_qty = 0;
		if (_qty_max > 0) then {
			_qty = (_qty_max*2/3) + random (_qty_max/3);
			if (_qty_max > 1) then {_qty = round _qty};
			_loot setVariable ["quantity", _qty];
		} else {
			_qty_max = getNumber (configFile >> "CfgVehicles" >> typeOf _loot >> "Resources" >> "quantity");
			_qty = _qty_max;
			_loot setVariable ["quantity", _qty];
		};
		_loot setDamage (random 0.35);

						_loot setTargetCategory "loot";
						_class = _item select 0;
						
						if(isClass(configFile >> "CfgVehicles" >> _class)) then {
							_attachments = getArray (configFile >> "CfgVehicles" >> _class >> "cargo");
							if(count _attachments > 0) then {
								{
									_attachment = _loot createInCargo _x;
									_attachment setTargetCategory "loot";
								} forEach _attachments;
							};
						};
						
						if(isClass(configFile >> "CfgWeapons" >> _class)) then {
							_attachments = getArray (configFile >> "CfgWeapons" >> _class >> "baseAttachments");
							if(count _attachments > 0) then {
								{
									_attachment = _loot createInInventory _x;
									_attachment enableSimulation false;
								} forEach _attachments;
							};
						};		
		
		_counter = _counter + 1;

		_item set [1,(_item select 1) - 1];
		if ((_item select 1) == 0) then {
			_arrayItems set [_itemIndex,"-del-"];
			_arrayItems = _arrayItems - ["-del-"];
			_totalItems = _totalItems - 1;
		};
	};
	
} forEach _arrayPoints;

diag_log format["SPAWNED free Equal Loot + %1 ************************************************",_counter];

};

diag_log "SERVER: End SpawnPointsL_spawnEqual ======================================================================================";