
player enableStamina false;

show3DMarker = false;
pos3DMarker = [0, 0, 0];
name3DMarker = "";

hasVoted = false;
voteEnabled = true;

playerLoadout = [];
playerVehicle = "";

[player, -1 * ([player] call BIS_fnc_respawnTickets)] call BIS_fnc_respawnTickets; //clear player tickets

//Show player names below them, enable/disable revives
onEachFrame {
	{
		lastSelPlayer = _x;
		if (isPlayer lastSelPlayer && showNames) then {
			drawIcon3D ["", [1, 1, 1, 0.5], getPosATLVisual lastSelPlayer, 0, 0, 0, name lastSelPlayer, 1, 0.04, "RobotoCondensed", "center", false];
		};
	} forEach allUnits;
	
	if (show3DMarker) then {
		drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [1, 1, 1, 0.6], pos3DMarker, 1, 1, 45, name3DMarker, 1, 0.04, "RobotoCondensed", "center", true];
	};
	
	//Disable downs dynamically
	if ((lifeState player) == "INCAPACITATED" && !allowRevive) then {
		{sleep .8; player setDamage 1;} remoteExec ["BIS_fnc_spawn", player];	
	};
};

execVM "player\mapMarkers.sqf";

sleep 5;
[player, -1 * ([player] call BIS_fnc_respawnTickets)] call BIS_fnc_respawnTickets; //clear player tickets

