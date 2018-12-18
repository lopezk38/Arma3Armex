createDialog "loadoutGUI";
waitUntil {!(isNull findDisplay 5000)};

execVM "player\GUI\loadout\refresh.sqf";

((findDisplay 5000) displayCtrl 7) buttonSetAction "playerVehicle = ''; execVM 'player\GUI\loadout\refresh.sqf';"; //Clear vehicle button
((findDisplay 5000) displayCtrl 8) buttonSetAction "playerLoadout = []; execVM 'player\GUI\loadout\refresh.sqf';"; //Clear loadout button
((findDisplay 5000) displayCtrl 9) buttonSetAction "execVM 'player\GUI\loadout\findSelectedIndex.sqf';"; //Remove selected item button
((findDisplay 5000) displayCtrl 10) buttonSetAction "execVM 'player\saveLoadout.sqf'; execVM 'player\GUI\loadout\refresh.sqf';"; //Save loadout button
((findDisplay 5000) displayCtrl 11) buttonSetAction "(findDisplay 5000) closeDisplay 1;"; //Exit button