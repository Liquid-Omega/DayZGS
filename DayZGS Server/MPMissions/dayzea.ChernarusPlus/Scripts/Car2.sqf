//Sript by MiraJ
activateAddons ["DZ_Vehicles_wheeled"];

_this = createVehicle ["240gd", [10493.7, 2348.17, 0], [], 0, "CAN_COLLIDE"]; //electro shcola
_this = createVehicle ["240gd", [10150.7, 1810.41, 0], [], 0, "CAN_COLLIDE"]; //electro prom zona
_this = createVehicle ["240gd", [11986.2, 3839.67, 0], [], 0, "CAN_COLLIDE"]; //kamishovo verh
_this = createVehicle ["240gd", [12883.2, 6259.25, 0], [], 0, "CAN_COLLIDE"]; //solnecnii verh
_this = createVehicle ["240gd", [12275.8, 9123.41, 0], [], 0, "CAN_COLLIDE"]; //berezeno kolhoz
_this = createVehicle ["240gd", [12937.6, 10185.7, 0], [], 0, "CAN_COLLIDE"]; //berezeno police
_this = createVehicle ["240gd", [13845.8, 13216.7, 0], [], 0, "CAN_COLLIDE"]; //svetloearsk police
_this = createVehicle ["240gd", [13891.7, 13425.6, 0], [], 0, "CAN_COLLIDE"]; // svetloearsk JD stanciea
_this = createVehicle ["240gd", [11885.6,12469.2,0], [], 0, "CAN_COLLIDE"];//krasnostav airfield
_this = createVehicle ["240gd", [11262.4, 12212.2, 0], [], 0, "CAN_COLLIDE"]; //krasnostav magazin
_this = createVehicle ["240gd", [4794.11, 2539.87, 0], [], 0, "CAN_COLLIDE"]; //balota airfield
_this = createVehicle ["240gd", [10740.4, 10788.2, 0], [], 0, "CAN_COLLIDE"]; //dubrovka zaprafka
_this = createVehicle ["240gd", [10661.3, 7994.43, 0], [], 0, "CAN_COLLIDE"]; //poleana magazin
_this = createVehicle ["240gd", [7185, 7675.18, 0], [], 0, "CAN_COLLIDE"]; //novii sobor police
_this = createVehicle ["240gd", [6063.77, 7871.36, 0], [], 0, "CAN_COLLIDE"]; //staryi sobor magazin
_this = createVehicle ["240gd", [4519.95, 8291.32, 0], [], 0, "CAN_COLLIDE"]; //military base kabanino
_this = createVehicle ["240gd", [4795.56, 10250.1, 0], [], 0, "CAN_COLLIDE"]; //lopatino stekleashka
_this = createVehicle ["240gd", [4170.73, 11103.4, 0], [], 0, "CAN_COLLIDE"]; //lopatino palatki
_this = createVehicle ["240gd", [5954.25, 10366.5, 0], [], 0, "CAN_COLLIDE"]; //grishino gostinitca
_this = createVehicle ["240gd", [3751.32, 8858.37, 0], [], 0, "CAN_COLLIDE"]; //vibor shkola
_this = createVehicle ["240gd", [2716.53, 10031.4, 0], [], 0, "CAN_COLLIDE"]; //lopatino cerkov
_this = createVehicle ["240gd", [3048.92, 7787.31, 0], [], 0, "CAN_COLLIDE"]; //pustoshka garaji
_this = createVehicle ["240gd", [2589.18, 6355.03, 0], [], 0, "CAN_COLLIDE"]; //sosnovka orkaina
_this = createVehicle ["240gd", [2583.23, 5073.8, 0], [], 0, "CAN_COLLIDE"]; //zelenogorsk milytary base naves
_this = createVehicle ["240gd", [2654.09, 5289.31, 0], [], 0, "CAN_COLLIDE"]; //zelenogosk magazin
_this = createVehicle ["240gd", [3711.64, 5969.98, 0], [], 0, "CAN_COLLIDE"]; //zelenaea gora
_this = createVehicle ["240gd", [1672.24, 3843.93, 0], [], 0, "CAN_COLLIDE"]; //pavlovo gostinica
_this = createVehicle ["240gd", [2182.85, 3307.73, 0], [], 0, "CAN_COLLIDE"]; //military base zelenogorsk
_this = createVehicle ["240gd", [1878.72, 2254.03, 0], [], 0, "CAN_COLLIDE"]; //kamenka krasnii dom
_this = createVehicle ["240gd", [3658.2, 2194.58, 0], [], 0, "CAN_COLLIDE"]; //komorovo factory
_this = createVehicle ["240gd", [4334.19, 2462.08, 0], [], 0, "CAN_COLLIDE"]; //balota city
_this = createVehicle ["240gd", [6855.9, 2471.24, 0], [], 0, "CAN_COLLIDE"]; //cherno hotel
_this = createVehicle ["240gd", [6565.06, 2547.52, 0], [], 0, "CAN_COLLIDE"]; //cherno prom zona
_this = createVehicle ["240gd", [5691.65, 2579.14, 0], [], 0, "CAN_COLLIDE"]; //cepaevsk
_this = createVehicle ["240gd", [6255.8, 3256.48, 0], [], 0, "CAN_COLLIDE"]; //novoselki parkovka
_this = createVehicle ["240gd", [6682.32, 3580.23, 0], [], 0, "CAN_COLLIDE"]; //dubki
_this = createVehicle ["240gd", [7805.4, 3534.9, 0], [], 0, "CAN_COLLIDE"]; //ptigorodki naves(gora)
_vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle ["240gd", [13785.5,2930.17,0], [], 0, "CAN_COLLIDE"];
  _vehicle_18 = _this;
  _this setDir 90;
  _this setVehicleInit "this setPosASL [getposASL this select 0, getposASL this select 1, -2.5]";
  _this setPos [13785.5,2930.17,0];
};