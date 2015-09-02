// Debug Monitor

/*
/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
+-->Created By STAF(Freak Team)<---+
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
*/

if (isNil "debugmonitor") then
{
	debugmonitor = true;
} else {
  debugmonitor = !debugmonitor;
  hintSilent format ["ON/OFF F12"];
};

while {debugmonitor} do 
{	
	//--Sever Uptime--//
	_stime = servertime;
  _HoursTillRestart = 3;
  _serverRestart = _HoursTillRestart - 1;
  _hours = (_stime/60/60);
  _hours = toArray (str _hours);
  _hours resize 1;
  _hours = toString _hours;
  _hours = compile _hours;
  _hours = call  _hours;
  _minutes = round(_stime/60);
  _minutes = _minutes - (_hours*60);
  _hours = _serverRestart - _hours;
  _minutes = 60 - _minutes;
	//--End Sever Uptime--//	
	
	hintSilent parseText format [
	"<t size='1' align='center' color='#FFFFFF'><br/>http://dayz.arena-gg.ru</t><br/>" +
	"<t size='1' font='AmorSerifPro' align='center' color='#00CC00'><br/>Nickname: </t><t size='1.1' font='AmorSerifPro' align='Center' color='#00CC00'>%1</t><br/>"+
	"<t size='1' font='AmorSerifPro' align='center' color='#fc0701'>Blood: </t><t size='1' font='AmorSerifPro' align='center'>%2&#37;</t><br/>"+
	"<t size='1' font='AmorSerifPro' align='center' color='#b82828'>Health: </t><t size='1' font='AmorSerifPro' align='center'>%6&#37;</t><br/>"+
	"<t size='1' font='AmorSerifPro' align='center' color='#336699'>Shok: </t>" + "<t size='1' font='AmorSerifPro' align='center'>%7</t><br/>"+
	"<t size='1' font='AmorSerifPro' align='center' color='#FFBF00'>FPS: </t><t size='1' font='AmorSerifPro' align='center'>%5</t><br/>"+
	"<t size='1' font='AmorSerifPro' align='center' color='#31ff01'><br/>Restart: </t><t size='1' font='AmorSerifPro' align='center'>%3 h %4 min</t><br/>"+
	"<t underline='true' shadow='1' align='center' size='1'><br/>hide debug(F12)</t>",

  (name player),
	(round(((player getVariable['blood',0])/DZ_BLOOD)*100)),
        _hours,
	_minutes,
	(round diag_fps),
        (round(((player getVariable['Health',0])/DZ_Health)*100)),
		(player getvariable "shock")
        ];

	sleep 1;
};