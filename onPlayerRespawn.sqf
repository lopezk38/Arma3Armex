_player = _this select 0;
waitUntil {(_player) == player};
waitUntil {alive _player};
["Terminate"] call BIS_fnc_EGSpectator;

player addAction ["Vote to start the operation", {"operation\vote.sqf" remoteExec ["execVM", 2]; hasVoted = true;}, nil, 2, false, true, "", "((voteEnabled) && !hasVoted  && (mainFSM_State == 'Sandbox'))"]; //add vote option
player addAction ["Vote to stop the operation", {"operation\vote.sqf" remoteExec ["execVM", 2]; hasVoted = true;}, nil, 0, false, true, "", "((voteEnabled) && !hasVoted  && (mainFSM_State == 'SubMission'))"]; //add vote option
player addAction ["Manage loadout", {execVM "player\GUI\loadout\open.sqf";}, nil, 0, false, true, "", "(mainFSM_State == 'Sandbox')"]; //add manage loadout option in sandbox

if (!(playerLoadout isEqualTo [])) then {
	player setUnitLoadout [playerLoadout, true];
};
