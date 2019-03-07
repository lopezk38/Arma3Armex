//Describe your mission here

_missionPos = _this; //Setup mission position variable for your use

//Setup your mission parameters
//--------------
allowRevive = true;
publicVariable "allowRevive";

RESPAWN_DELAY = 5;
publicVariable "RESPAWN_DELAY";

showNames = true;
publicVariable "showNames";

respawnAllowed = false;
publicVariable "respawnAllowed";
[0, "player\resetTickets.sqf"] remoteExec ["execVM"];

pos3DMarker =  [0, 0, 0]; //Update position later if you're using this. Don't forget to run publicVariable "pos3DMarker"; after updating!
publicVariable "pos3DMarker";

name3DMarker = "<Your 3D Marker Name Here!>"; //Change this name!
publicVariable "name3DMarker";

show3DMarker = true;
publicVariable "show3DMarker";
//--------------

_spawnedEnemies = []; //Use this array to keep track of spawned enemies. Modify to your needs



//BEGIN YOUR MISSION CODE HERE!
//Initialize your mission (spawn enemies, bases, tp players, etc here)

//End initialization




//Default mission loop. Keeps the mission going until all players die or all spawned enemies die
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
	if ((lifeState _x) == "INCAPACITATED") then { //Kill downed players after mission ends
		{player setDamage 1;} remoteExec ["BIS_fnc_spawn", player];
		sleep .5; //Wait for all players to die
	};
} forEach allPlayers;



//Win loss conditions. By default set to win if you kill all the enemies, lose if all players die. Feel free to modify/rewrite to your needs. Written for plain old units. Probably won't work for vehicles
if ((allPlayers - allDeadMen) isEqualTo []) then {
	2 cutRsc ["loseMessage", "PLAIN"];
} else {
	if ((_spawnedEnemies - allDeadMen) isEqualTo []) then {
		2 cutRsc ["winMessage", "PLAIN"];
	};
};
//End win/loss conditions



//END YOUR MISSION CODE HERE! DONT FORGET TO DELETE THE ENEMIES/STUFF YOU SPAWNED BELOW!

sleep 2;

missionEnded = true; //end mission
currentMission = null;

//Cleanup below! DONT FORGET!


sleep 3;