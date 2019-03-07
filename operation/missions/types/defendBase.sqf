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

_struct = call compile preprocessFileLineNumbers "structures\types\simpleBunker.sqf";
_baseObjects = [_missionPos, _struct] call compile preprocessFileLineNumbers "structures\buildStructure.sqf"; //Build base at mission position, store list of objects built for later destruction

BASE_MARKER = createMarker ["BASE", _missionPos];
BASE_MARKER setMarkerType "hd_flag";
BASE_MARKER setMarkerColor "ColorBlue";
BASE_MARKER setMarkerText "DEFEND";

{
	{
		deleteVehicle _x; //kill crew that might be in base objects
	} forEach crew _x;
} forEach _baseObjects;

_tpPos = [_missionPos, 0, 10, .1, 1, 0, 0, [], _missionPos] call BIS_fnc_findSafePos; //find safe position to teleport players to
_tpPos = [_tpPos select 0, _tpPos select 1, 0]; //convert 2D position to 3D

{
	if (side _x == west) then {
		_x setPosATL _tpPos; //TP players
	};
} forEach allPlayers;

_tpCandidates = [];
_spawnedEnemies = [];
//spawn 3 enemy squads of 8
for "_i" from 0 to 2 do {
	for "_j" from 0 to 4 do { //find 5 positions
		_tempPos = [_missionPos, 300, 310, 10, 0, 0, 0, [], [0, 0]] call BIS_fnc_findSafePos; //find safe position to spawn squads at
		_tempPos = [_tempPos select 0, _tempPos select 1, 0]; //convert 2D position to 3D
		_tpCandidates pushBack _tempPos;
	};
	_tpPos = selectRandom _tpCandidates; //pick one of the 5
	
	_group = createGroup east;
	for "_k" from 0 to 7 do {
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
		_aiUnit = _group createUnit [_unitType, _tpPos, [], 0, "FORM"];
		_aiUnit commandMove (_missionPos);
		_spawnedEnemies pushBack _aiUnit;
	};
	_group setBehaviour "AWARE";
	
};

_tpCandidates = nil; //No longer needed

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

deleteMarker BASE_MARKER;

//Cleanup...

{
	deleteVehicle _x; //kill any remaining enemies
} forEach _spawnedEnemies;

{
	deleteVehicle _x; //delete base
} forEach _baseObjects;

currentMission = nil;

sleep 3;