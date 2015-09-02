diag_log "SERVER: Run SpawnPoints_HeliCrash_list3 ======================================================================================";


//DZ_DIR_S = "";

SpawnPointsH_spawn = {



private ["_arrayPoints","_arrayTypes","_queryPoints","_arrayItems","_totalTypes","_counter","_helic"];
_queryPoints = _this select 0;
_arrayPoints = _this select 1;
_arrayTypes = _this select 2;
_arrayItems = _this select 3;

_arrayPoints = [_arrayPoints,_queryPoints] call fnc_pointsResize;
_totalTypes = count _arrayTypes;

_counter = 0;
{
	_helic = createVehicle [_arrayTypes select (floor(random _totalTypes)),_x select 0,[],0,"CAN_COLLIDE"];
	_helic setDir floor(random 360);
	if ((_x select 1) != -1) then {_helic setDir (_x select 1);};
	_sound = createSoundSource["Sound_Fire",_x select 0,[],0];
	_counter = _counter + 1;
} forEach _arrayPoints;

diag_log format["SPAWNED free HeliCrash = %1, additional Zombies and Loot - see below ************************************************",_counter];

// Zombies near Heli (50 m, 5 pcs)
_spawnParams = [
	10,	// default radius
	5	// default quantity
];
_arrayPoints = _arrayPoints call fnc_PointsClearP;
_arrayPoints = [_arrayPoints,_spawnParams] call fnc_PointsCheckP;
_arrayTypes = getArray(configFile >> "CfgSpawns" >> "typesZombieSoldiers");
//[count _arrayPoints,_arrayPoints,_arrayTypes] execVM (DZ_DIR_S + "SpawnPointsZ_spawn.sqf");
[count _arrayPoints,_arrayPoints,_arrayTypes] spawn SpawnPointsZ_spawn;

// Loot on Ground near Heli (7 m, 10 pcs; 1 qty]
_spawnParams = [
	10,	// default radius
	10	// default quantity at point
];
_arrayPoints = _arrayPoints call fnc_PointsClearP;
_arrayPoints = [_arrayPoints,_spawnParams] call fnc_PointsCheckP;
_arrayItems = [_arrayItems,[1]] call fnc_ItemsCheckP;

//_arrayItems = _arrayItems call fnc_ItemsDeploy;
[_arrayPoints,_arrayItems] spawn SpawnPointsL_spawnEqual;

};


diag_log "SERVER: LOAD SpawnPointsH_data";
 
 
_spawnParams = [
	-1		// default Dir : -1 = random
];


_arrayPoints = [

[11569.97,3152.35,0],
[8420.25,11927.92,0],
[12006.36,9639.94,0],
[4460.47,8422.68,0],
[9795.58,2771.76,0],
[1365,7655.55,0],
[9616.25,10621.62,0],
[5158.41,2968.67,0],
[10654.53,8218.48,0],
[2487.23,5669.3,0],
[3448.28,4115.54,0],
[8004.94,9127.73,0],
[13085.4,8437.44,0],
[12901.76,7176.08,0],
[7643.19,3740.71,0],
[10591.47,2824.84,0],
[12209.18,11182,0],
[12932.34,12712.86,0],
[11377.87,7428.96,0],
[10754.21,12192.17,0]

];


_arrayTypes = [
	"Land_MH_60Wreck"
];


_arrayItems= [

["Consumable_Chemlight_White",5],
["Consumable_Chemlight_Red",5],
["Consumable_Chemlight_Green",5],
["Consumable_Chemlight_Blue",5],
["Consumable_Chemlight_Yellow",5],
["CombatKnife",25],
["Crossbow",5],
["Arrows_Bolts",5],
["Attachment_Light_TLR",5],
["Attachment_Bipod_Atlas",5],
["M4A1",5],
["M4A1_Black",5],
["M4A1_Green",5],
["cz527_Green",5],
["cz527_Black",5],
["Optics_Binoculars",5],
["M_STANAG_30Rnd_Coupled",5],
["M_CMAG_40Rnd",5],
["M_STANAG_30Rnd",5],
["M_CMAG_20Rnd_Green",5],
["M_CMAG_20Rnd",5],
["M_CMAG_10Rnd_Green",5],
["M_CMAG_10Rnd",5],
["CLIP_762x39_10Rnd",5],
["CLIP_762_5Rnd",5],
["M_cz527_5rnd",5],
["M_akm_palm30_green",5],
["M_akm_palm30_black",5],
["M_akm_drum",5],
["M_ak101_30Rnd",5],
["HighCapacityVest_Black",5],
["HighCapacityVest_Olive",5],
["Attachment_Optic_Longrange",5],
["Attachment_Optic_Redpoint",5],
["Attachment_Light_Universal",5],
["Attachment_Bipod_Atlas",5],
["Attachment_Compensator_Mosin",5],
["Attachment_Optic_M4T3NRDS",5],
["Attachment_Optic_ACOG",5],
["Attachment_Optic_BUIS",5],
["Attachment_Optic_M68",5],
["Attachment_Optic_PSO1",100],
["Attachment_Optic_M4CarryHandle",5],
["Attachment_Handguard_M4MP_Green",5],
["Attachment_Handguard_M4MP_Black",5],
["Attachment_Handguard_M4RIS_Black",5],
["Attachment_Handguard_M4RIS_Green",5],
["Attachment_Buttstock_M4CQB_Black",5],
["Attachment_Buttstock_M4CQB_Green",5],
["Attachment_Buttstock_M4MP_Black",5],
["Attachment_Buttstock_M4MP_Green",5],
["Attachment_Buttstock_M4OE_Black",5],
["Attachment_Buttstock_M4OE_Green",5],
["Attachment_Handguard_M4Plastic_Green",5],
["Attachment_Handguard_M4Plastic_Black",5],
["Attachment_Suppressor_556",5],
["Attachment_Buttstock_AK_Folding_Black",5],
["Attachment_Buttstock_AK_Folding_Green",5],
["Attachment_Handguard_AK_Rail_Green",5],
["Attachment_Handguard_AK_Rail_Black",5],
["Attachment_Buttstock_MP5_Stock",5],
["Attachment_Compensator_MP5",5],
["Attachment_Handguard_MP5_Plastic",5],
["Attachment_Handguard_MP5_Rail",5],
["Ammo_9mm_25rnd",5],
["M_MP5_15Rnd",5],
["M_MP5_30Rnd",5],
["B_762x39_Ball_Single",5],
["B_762x39_Ball_Ten",5],
["M_CZ75_15Rnd",5],
["MP5K",5],
["AK101",5],
["Repeater",5],
["ShotgunMp133",5],
["AK74",5],
["AK74_Black",5],
["AK74_Green",5],
["AKS74U_Black",5],
["AKS74U_Green",5],
["Mosin",5],
["FirefighterJacket_Beige",5],
["FirefighterJacket_Black",5],
["FirefightersPants_Beige",5],
["FirefightersPants_Black",5],
["FirefightersHelmet_Red",5],
["FirefightersHelmet_White",5],
["FirefightersHelmet_Yellow",5],
["HuntingKnife",5],
["CattleProd",5],
["WeldingMask",5],
["SkateHelmet_Black",5],
["SkateHelmet_Blue",5],
["SkateHelmet_Gray",5],
["SkateHelmet_Green",5],
["SkateHelmet_Red",5],
["OfficerHat",5],
["BrassKnucklesDull",5],
["BrassKnucklesShiny",5],
["Consumable_GardenLime",5],
["Seeds_Tomato",5],
["Bagdrybag_Black",5],
["Bagdrybag_Orange",5],
["Bagdrybag_Yellow",5],
["Bagdrybag_Blue",5],
["Bagdrybag_Green",5],
["Bagdrybag_Red",5],
["BagTortilla",5],
["Container_AmmoBox300Rnd",50],
["Attachment_Buttstock_AK74_Black",5],
["Attachment_Buttstock_AK74_Black_Green",5],
["Attachment_Handguard_AK74_Black",5],
["Attachment_Handguard_AK74_Black_Green",5],
["Attachment_Handguard_AK74",5],
["M_ak74_30Rnd",5],
["M_ak74_30Rnd_Green",5],
["M_ak74_30Rnd_Black",5],
["Attachment_Buttstock_AKS74U",5],
["Attachment_Buttstock_AKS74U_Black",5],
["Attachment_Buttstock_AKS74U_Green",5],
["M_akm_30Rnd",5],
["M_akm_drum",5],
["SmershVest",5],
["SmershBackpack",5],
["Police_pants_orel",5],
["PoliceJacket_orel",5],
["Attachment_Weaponwrap_Grass",5]

];


_arrayPoints = [_arrayPoints,_spawnParams] call fnc_PointsCheckP;
[DZ_Q_Points_HeliCrash,_arrayPoints,_arrayTypes,_arrayItems] spawn SpawnPointsH_spawn;


diag_log "SERVER: End SpawnPoints_HeliCrash_list3 ======================================================================================";