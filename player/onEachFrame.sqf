disableSerialization;

[] spawn {

waitUntil {!isNull findDisplay 12};
//Prints friendly names next to their marker on map if showNames is true
	(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", {
		_map = _this select 0;
		{
			lastSelUnit = _x;
			if (side lastSelUnit == West && isPlayer lastSelUnit && showNames) then {
				_map drawIcon ["a3\ui_f\data\map\vehicleicons\iconman_ca.paa", [0,0,1,1], visiblePosition lastSelUnit, 24, 24, getDirVisual lastSelUnit, name lastSelUnit];
			};
			if (side lastSelUnit == East) then {
				_map drawIcon ["a3\ui_f\data\map\vehicleicons\iconman_ca.paa", [1,0,0,1], visiblePosition lastSelUnit, 24, 24, getDirVisual lastSelUnit, "Enemy"];
			};
		} forEach allUnits;
	}];
} ;