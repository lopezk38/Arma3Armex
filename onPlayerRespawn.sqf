_player = _this select 0;
waitUntil {(_player) == player};
waitUntil {alive _player};
["Terminate"] call BIS_fnc_EGSpectator;

execVM "player\resetAndRearm.sqf";

//Dynamic Respawn Handlers
if (mainFSM_State == "SubMission") then {
	{
		diag_log _x;
		execVM _x;
	} forEach SubscribeToRespawnEvent;
};