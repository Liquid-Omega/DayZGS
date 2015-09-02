if (!isnil "hotkey") then 
{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", hotkey];
};
keyswitcher =
{
	switch (_this) do 
	{
		case 88: //F12 change by STAF (Freak Team)
		{
			execVM "Scripts\debugmonitor.sqf";
		};	
	};
};
waituntil {!isnull (finddisplay 46)};
hotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this select 1 call keyswitcher; false;"];