//weaponfired.sqf
fn_weaponfired =
{
	private["_unit","_inHands"
	_unit = _this select 0;
	_weapon = _this select 1;
	_inHands = itemInHands _unit;
	_dam = damage _inHands;
	//CHECK IF IT'S A FIRING WEAPONFIRED
	if !(_inHands isKindOf "RifleCore") || !(_inHands isKindOf "PistolCore") exitWith {diag_log "";};
	//diag_log format["WEAPONFIRED IS WORKING_weapon is %1 - %2 - %3",_inHands, _dam, _unit];
	_newdam = (sqrt(_dam) + 0.03)^2);
	_inHands setDamage _newdam;
	if (_dam > 0.95) then
	{
		[_unit,format["Damn! my %1 is ruined! I need a kit to repair it.","colorImportant"] call fnc_playerMessage;
	};
};