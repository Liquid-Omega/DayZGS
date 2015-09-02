waitUntil {vehicle player == player};
//sleep 15;
execVM "Scripts\clog.sqf";

execVM "Scripts\client_dView.sqf";

execVM "Scripts\on_off_debug.sqf";

cutText [format["Monitor - F12 ON\OFF", name player], "PLAIN"];