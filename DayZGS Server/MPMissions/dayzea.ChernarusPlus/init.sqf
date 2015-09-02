/*MISSION DayZ Standalone NW 0.47-46 /2.0

Author for Kludge

*/

diag_log "SERVER: START _mission/init.";

// MISSION DIR SCRIPT
DZ_DIR_S = "Scripts\";

//WAIT SERVER TIME
setTimeForScripts 10;

// All Zombies respawn events
DZ_killedZombieRespawn = 1;

//MAX NPC
DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 1000;
DZ_MAX_ANIMALS = 100;
DZ_MAX_CAR = 30;

//MAX SPAWN +
DZ_Q_Points_Zombie = 10;
DZ_Q_Points_HeliCrash = 3;

//HIVE
call compile preprocessFileLineNumbers "dbSelectHost.sqf";


//PLAYERS SPAWN POINTS GENERATE
//[] execVM (DZ_DIR_S + "SpawnPlayersPoints_gen.sqf"); //For script


//INIT SERVER PLAYER LOAD
call dbLoadPlayer;

//SET DATE
[] execVM (DZ_DIR_S + "SetDateTime.sqf"); //For script

//Standart
//setDate getSystemTime; 

//Fixed daytime
//while {alive player} do {
//setDate [2013, 6, 15, 12, 00];
//}

//event_zombieKilled = {}; // fake proc


//MISC
_humidity = 0.5 + random 0.2;
simulSetHumidity _humidity;
0 setOvercast _humidity;
//0 setFog _humidity;
0 setFog 1;

//STANDARD SPAWN
_position = [7500,7500,0];
//exportProxies [_position,200000];
importProxies;
diag_log "SPAWN: START spawnLoot";
spawnLoot [_position,35000,12000];
diag_log "SPAWN: END spawnLoot";
sleep 1;

call init_spawnWildAnimals;
sleep 1;

call init_spawnZombies;
sleep 1;

// SCRIPT +
[] execVM (DZ_DIR_S + "SpawnPoints_ZoombieNew.sqf");

//WRECK SPAWN
call compile preprocessFileLineNumbers (DZ_DIR_S + "fnc_mission.sqf");
[] execVM "SpawnHeliWreckRand\Rand.sqf";
[] execVM (DZ_DIR_S + "SpawnPoints_Loot.sqf");

//CAR SPAWN
[] execVM (DZ_DIR_S + "Air.sqf");
//[] execVM (DZ_DIR_S + "Car.sqf");
//[] execVM (DZ_DIR_S + "Car2.sqf");
[] execVM (DZ_DIR_S + "Car3.sqf");
[] execVM (DZ_DIR_S + "Ships.sqf");
[] execVM (DZ_DIR_S + "SpawnHeli.sqf");


call init_spawnServerEvent;
dbInitServer;

activateAddons ["DZ_navigation"];
activateAddons ["DZ_data"];
activateAddons ["DZ_navigation"];
activateAddons ["DZ_items"];

setTimeForScripts 0.03;

[] spawn {
	sleep 20;
	diag_log "=== LOOT try remove";
	_arrayRemoveItems = [
	"Consumable_GardenLime",
	"Seeds_Tomato",
	"Tool_Lockpick",
	"M_PM73_15Rnd",
	"M_PM73_25Rnd",
	"ShotgunMp133_Pistol_Grip",
	"PM73Rak",
	"ij70_Base",
	"ij70",
	"M_IJ70_8Rnd"
	];
	{
		_listRemoveLoot = allMissionObjects _x;
		{ deletevehicle _x; } forEach _listRemoveLoot;
		diag_log format["=== LOOT class %1, removed %2 items", _x, count _listRemoveLoot];
	} forEach _arrayRemoveItems;
};