// Credits Shadow and Seigetzu.
private ["_display", "_btnAbort", "_timeMax", "_timeOut"];

_timeOut = 0;
_timeMax = 30;

while {true} do
{
	waitUntil {!isNull (findDisplay 49)};
	disableSerialization;
	_display = findDisplay 49;
	_btnAbort = _display displayCtrl 104;
	_btnAbort ctrlEnable false;
	
	
	
	if (!alive player) exitWith {
		_btnAbort ctrlEnable true;
	};
			
	switch true do {
		case (captive player) : {
			_btnAbort ctrlEnable false;
			cutText ["Cannot Abort while in combat!", "PLAIN DOWN"];				
		};
		case ((_timeOut < _timeMax) && !(captive player)) : {
			_btnAbort ctrlEnable false;
			cutText [format ["Can abort in %1", (_timeMax - _timeOut)], "PLAIN DOWN"];
		};
		default {
			_btnAbort ctrlEnable true;
			cutText ["", "PLAIN DOWN"];				
		};
	};
	sleep 1;
	_timeOut = _timeOut + 1;
	
	cutText ["", "PLAIN DOWN"];

	if (isNull (findDisplay 49)) then
	{
		_timeOut = 0;
		_timeMax = 30;
	};
};