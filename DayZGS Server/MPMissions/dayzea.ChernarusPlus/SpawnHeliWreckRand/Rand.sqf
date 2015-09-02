diag_log "SERVER: Run Script SpawnHeliWreckRandom  ======================================================================================";

activateAddons ["DZ_Vehicles_wheeled"];
activateAddons ["DZ_Vehicles_tracted"];
_min = 1;
_diff = 3; 
_VehSpawn = round (_min + (random _diff));
sleep 1.0;
switch (_VehSpawn) do
{
	case 1: { execVM "SpawnHeliWreckRand\SpawnPoints_HeliCrash1.sqf"; };

	case 2: { execVM "SpawnHeliWreckRand\SpawnPoints_HeliCrash2.sqf"; };

	case 3: { execVM "SpawnHeliWreckRand\SpawnPoints_HeliCrash3.sqf"; };
	
	case 4: { execVM "SpawnHeliWreckRand\SpawnPoints_HeliCrash4.sqf"; };

};

diag_log "SERVER: End Script SpawnHeliWreckRandom ======================================================================================";