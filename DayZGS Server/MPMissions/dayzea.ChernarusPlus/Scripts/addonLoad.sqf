waitUntil {vehicle player == player};
sleep 15;

execVM "Scripts\on_off_debug.sqf";

cutText [format["Monitor - F12 ON\OFF", name player], "PLAIN"];