//Free for all. What else must I say?

DM_MISSIONPOS = _this; //take in args

//setup rules...
//--------------
allowRevive = false;
publicVariable "allowRevive";

showNames = false;
publicVariable "showNames";

respawnAllowed = true;
publicVariable "respawnAllowed";
[0, "player\resetTickets.sqf"] remoteExec ["execVM"];

RESPAWN_DELAY = 5;
publicVariable "RESPAWN_DELAY";

show3DMarker = false;
publicVariable "show3DMarker";
//--------------


//Setup score system
playerStatsDM = []; //format: [player1UID, [player1Name ,player1 kills, player1 deaths], player2UID, [player2Name, player2 kills, player2 deaths], playerNUID, [playerNName, playerN kills, playerN deaths]];
{
	playerStatsDM pushBack (getPlayerUID _x); //player UID
	playerStatsDM pushBack [name _x, 0, 0]; //[name, kills, deaths]
} forEach allPlayers;
publicVariable "playerStatsDM";

scoreLimitDM = 10; //10 kills
hasScoreLimitBeenReached = false;
winnerDM = "null"; //The string containing the word null, not null itself. This is intentional.

["player\GUI\dm\respawnEventHandler.sqf", "player\subscribe.sqf"] remoteExec ["execVM"];
["player\GUI\dm\addAction.sqf", "player\subscribe.sqf"] remoteExec ["execVM"];

["player\GUI\dm\addAction.sqf"] remoteExec ["execVM"];

//Setup
_dmMarker = createMarker ["dmMarker", DM_MISSIONPOS];
_dmMarker setMarkerColor "ColorRed";
_dmMarker setMarkerText "DEATHMATCH";
_dmMarker setMarkerShape "ELLIPSE";
"dmMarker" setMarkerSize [150, 150];
"dmMarker" setMarkerBrush "SOLID";

["player\GUI\dm\addKillEH.sqf"] remoteExec ["execVM"];
["player\GUI\dm\respawnEventHandler.sqf"] remoteExec ["execVM"]; //tp players in

waitUntil {hasScoreLimitBeenReached || opEnded};
hint (winnerDM + " wins!");
sleep 5;

deleteMarker "dmMarker";
hasScoreLimitBeenReached = nil;
winnerDM = nil;
playerStatsDM = nil;
DM_MISSIONPOS = nil;
["player\GUI\dm\addAction.sqf", "player\unsubscribe.sqf"] remoteExec ["execVM"];
["player\GUI\dm\respawnEventHandler.sqf", "player\unsubscribe.sqf"] remoteExec ["execVM"];
["player\resetAndRearm.sqf"] remoteExec ["execVM"];
["player\GUI\dm\remKillEH.sqf"] remoteExec ["execVM"];
hint "";
missionEnded = true; //end mission
currentMission = nil;




