if (isDedicated) exitWith {};

player addEventHandler ["Killed", {
	[[_this select 0, _this select 1], "player\GUI\dm\updateStats.sqf"] remoteExec ["execVM", 2];
}];