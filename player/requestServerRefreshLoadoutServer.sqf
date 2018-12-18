if (!isServer) exitWith {};
if (playerLoadoutsUpdating) then {
	waitUntil {!playerLoadoutsUpdating};
};

_playerCount = count(allPlayers);

isNil { //run unscheduled to prevent timing issues
	if (!playerLoadoutsUpdating) then {
		playerLoadoutsUpdating = true;
		playerLoadouts = [];
		["player\tellServerLoadout.sqf"] remoteExec ["execVM"];
	};
};

waitUntil {count(playerLoadouts) >= _playerCount};
playerLoadoutsUpdating = false;