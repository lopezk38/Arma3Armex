//Spawns a base for players to defend. 

_missionPos = _this; //take in args

//setup rules...
//--------------
allowRevive = true;
publicVariable "allowRevive";

showNames = true;
publicVariable "showNames";

respawnAllowed = false;
publicVariable "respawnAllowed";
[0, "player\resetTickets.sqf"] remoteExec ["execVM"];
//--------------

_spawnedEnemies = [];

_struct = call compile preprocessFileLineNumbers "structures\types\simpleBunker.sqf";
_baseObjects = [_missionPos, _struct] call compile preprocessFileLineNumbers "structures\buildStructure.sqf"; //Build base at mission position, store list of objects built for later destruction

{
	{
		moveOut _x; //kick crew out of gun
		deleteVehicle _x; //kill crew that might be in base objects
	} forEach crew _x;
} forEach _baseObjects;

_spawnPos = [_missionPos, 0, 10, .1, 1, 0, 0, [], _missionPos] call BIS_fnc_findSafePos; //find safe position to spawn enemies at
_spawnPos = [_spawnPos select 0, _spawnPos select 1, 0]; //convert 2D position to 3D

BASE_MARKER = createMarker ["BASE", _spawnPos];
BASE_MARKER setMarkerType "hd_ambush";
BASE_MARKER setMarkerColor "ColorRed";
BASE_MARKER setMarkerText "ATTACK";

pos3DMarker =  [_spawnPos select 0, _spawnPos select 1, _missionPos select 2];
publicVariable "pos3DMarker";

name3DMarker = "ATTACK";
publicVariable "name3DMarker";

show3DMarker = true;
publicVariable "show3DMarker";


_group = createGroup east;
for "_k" from 0 to 7 do { //spawn enemy squad
_unitType = "";
	switch (_k) do {
		case 0: {_unitType = "O_Soldier_SL_F"};
		case 1: {_unitType = "O_Soldier_AR_F"};
		case 2: {_unitType = "O_Soldier_AAR_F"};
		case 3: {_unitType = "O_medic_F"};
		case 4: {_unitType = "O_soldier_M_F"};
		case 5: {_unitType = "O_Soldier_LAT_F"};
		default {_unitType = "O_Soldier_F"};
	};
	_aiUnit = _group createUnit [_unitType, _spawnPos, [], 0, "NONE"];
	_aiUnit commandMove (_missionPos);
	_spawnedEnemies pushBack _aiUnit;
};


/*
{
	if (typeOf _x == "B_HMG_01_high_F") then {
		_aiUnit = _group createUnit ["O_Soldier_F", getPosATL _x, [], 0, "NONE"];	
		_aiUnit assignAsGunner _x;
		[_aiUnit] orderGetIn true;
		_aiUnit moveInTurret [_x, [0]];
		_spawnedEnemies pushBack _aiUnit;
	};
} forEach _baseObjects;
*/

_group setBehaviour "AWARE";


_tpPos = [_missionPos, 300, 310, 10, 0, 0, 0, [], [0, 0]] call BIS_fnc_findSafePos; //find safe position to spawn squads at
_tpPos = [_tpPos select 0, _tpPos select 1, 0]; //convert 2D position to 3D

{
	if (side _x == west) then {
		_x setPosATL _tpPos; //TP players
		_x setDir (((_spawnPos select 0) - (_tpPos select 0)) aTan2 ((_spawnPos select 1) - (_tpPos select 1)));
	};
} forEach allPlayers;


_loopMission = true;
while {_loopMission} do {
	if (mainFSM_State != "SubMission") then { //Operation ends
		_loopMission = false;
	};
	sleep ONE_FRAME;
	waitUntil {((allPlayers - allDeadMen) isEqualTo []) || ((_spawnedEnemies - allDeadMen) isEqualTo []) || (mainFSM_State == "Sandbox")}; //Wait until all players are dead or all enemies are dead or operation ends
	_loopMission = false;
};

{
	if ((lifeState _x) == "INCAPACITATED") then {
		{player setDamage 1;} remoteExec ["BIS_fnc_spawn", player];	
	};
} forEach allPlayers;

if ((allPlayers - allDeadMen) isEqualTo []) then {
	2 cutRsc ["loseMessage", "PLAIN"];
} else {
	if ((_spawnedEnemies - allDeadMen) isEqualTo []) then {
		2 cutRsc ["winMessage", "PLAIN"];
	};
};

sleep 2;

missionEnded = true; //end mission

//Cleanup...

deleteMarker BASE_MARKER;

{
	deleteVehicle _x; //kill any remaining enemies
} forEach _spawnedEnemies;

{
	deleteVehicle _x; //delete base
} forEach _baseObjects;