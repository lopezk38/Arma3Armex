if (isDedicated) exitWith {};

player addAction ["View Scoreboard", {execVM "player\GUI\dm\open.sqf";}, nil, 0, false, true, "", "(mainFSM_State == 'SubMission')"];