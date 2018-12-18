if (!hasInterface) exitWith {};

[playerLoadout, "player\tellServerLoadoutServer.sqf"] remoteExec ["execVM", 2];
