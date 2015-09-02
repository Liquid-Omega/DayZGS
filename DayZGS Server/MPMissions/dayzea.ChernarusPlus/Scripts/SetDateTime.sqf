//scriptName "misc/mission_setDateTime.sqf";
/*
        File: mission_setDateTime.sqf
        Author: AndreTM

        Description:
			Set mission datetime-stamp at mission start.
			(For Days-Arena Servers specially)
	Version: 1.0
*/
// don't remove next two lines!
_a_rel = [[0,0,1,1],[24,0,1,1]];
_a_res = [0,24];

// this mission time relation
// first element must be settings for zero hour, last element - for 24th
_a_rel = [[0,19.5,5/6,3/2],[6,4.5,3/2,5/6],[24,19.5,5/6,3/2]];
_a_res = [0,4,8,12,16,20,24];

DZ_MP_AUTORESTART_MISSION = false;

// calc local server time (UTC+3)
_dt_utc = getSystemTime;
_dt_4h = dateToNumber [1,1,1,3,0];
_dt_local = numberToDate [_dt_utc select 0,(dateToNumber _dt_utc) + _dt_4h];
diag_log format["MISSION: Server real local time %1",_dt_local]; // This line may be off

// calc relative mission time (based on local server time)
_dt_rel = _dt_local;
_realtime = (_dt_local select 3) + (_dt_local select 4)/60;

_i1 = 0; while {_realtime >= ((_a_rel select _i1) select 0)} do { _i1 = _i1 + 1; };
_i2 = 0; while {_realtime >= (_a_res select _i2)} do { _i2 = _i2 + 1; };
_mtime = _realtime;
if (((_a_rel select _i1) select 0) <= (_a_res select _i2)) then
	{
		_mtime = ((_a_rel select _i1) select 1) - (((_a_rel select _i1) select 0) - _realtime);
	}
else
	{
		_sprev = (_a_rel select (_i1-1)) select 0;
		_snext = (_a_rel select _i1) select 0;
		if ((_realtime - _sprev) < (_snext - _realtime)) then
			{_mtime = ((_a_rel select (_i1 - 1)) select 1) + (_realtime - _sprev) * ((_a_rel select _i1) select 2);
			}
		else
			{_mtime = ((_a_rel select _i1) select 1) - (_snext - _realtime) * ((_a_rel select _i1) select 2);
			};
	};
	
_shift = _mtime - _realtime;
if (_shift > 0 ) then
	{ if (_shift > 12 ) then {_shift = _shift - 24}; }
else
	{ if (-_shift > 12 ) then {_shift = _shift + 24}; };
//diag_log format["MISSION: Mission time (on server) set to %1, shift %2",_mtime,_shift]; // This line may be off
setDate _dt_local;
skipTime _shift;
diag_log format["MISSION: Mission time set to %1",date]; // This line may be off

// Restart Engine
if (DZ_MP_AUTORESTART_MISSION && serverCommandAvailable "#restart") then
{
	_sleep = ((_a_res select _i2) - _realtime) * 3600;
	diag_log format["MISSION RE: Time to restart %1 sec.",_sleep]; // This line may be off
	if (_sleep > 180) then { sleep (_sleep - 180); _sleep = 180; };
	systemChat format["Server restart is planning after %1 seconds.",_sleep];
	if (_sleep > 30) then { sleep (_sleep - 30); _sleep = 30; };
	systemChat "Server restart is NOW !!! Go out from the mission, please.";
	sleep (_sleep max 15);
	diag_log "MISSION RE: Server restart is running..."; // This line may be off
	serverCommand "#restart";
}
else
{ diag_log "MISSION RE: AutoRestart is unavailable now"; };
