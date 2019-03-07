createDialog "dmScoreBoard";
waitUntil {!(isNull findDisplay 5001)};

execVM "player\GUI\dm\refresh.sqf";

((findDisplay 5001) displayCtrl 3) buttonSetAction "(findDisplay 5001) closeDisplay 1;"; //Exit button