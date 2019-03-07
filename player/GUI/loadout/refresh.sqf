waitUntil {!(isNull findDisplay 5000)};

disableSerialization;

_loadoutLB = ((findDisplay 5000) displayCtrl 4);
_vehLB = ((findDisplay 5000) displayCtrl 6);
lnbClear _loadoutLB;
lnbClear _vehLB;

loadOutGUIList = [];
loadOutGUIListNames = [];
loadOutGUIListCounts = [];
_vehName = getText (configFile >> "CfgVehicles" >> playerVehicle >> "displayName");

_loadoutFlat = playerLoadout call compile preprocessFileLineNumbers "player\GUI\loadout\flattenArray.sqf";

{
	_item = _x;
	_itemName = "";
	_count = 1;
	if (_item isEqualType "") then {
		if (_item != "" && _item != "/a") then {
				_itemName = getText(configFile >> "CfgWeapons" >> _item >> "displayName");
				if (_itemName == "") then {
					_itemName = getText(configFile >> "CfgVehicles" >> _item >> "displayName");
					if (_itemName == "") then {
						_itemName = getText(configFile >> "CfgMagazines" >> _item >> "displayName");
						if (_itemName == "") then { //Backup. Very slow. Shouldn't ever run
							_cfgX = "true" configClasses configFile;
							{
								{
									_itemName = getText(_x >> _item >> "displayName");
								} forEach ("(!(isNull (_x >> _item)))" configClasses _x);

							} forEach _cfgX;
						};
					};
				};
			if (_itemName == "") then {
				_itemName = _item;
			};
			
			if ((_loadoutFlat select (_forEachIndex - 1)) isEqualTo "/a") then {
				if ((_loadoutFlat select (_forEachIndex + 1)) isEqualType 0) then {
					if ((_loadoutFlat select (_forEachIndex + 2)) isEqualType 0) then {
						_count = _loadoutFlat select (_forEachIndex + 1);
						if (_count > 1) then {
							_itemName = (str(_count) + "X " + _itemName);
						};
					};
				};
			};
			
			_loadoutLB lbAdd _itemName;
			loadOutGUIList pushBack (_item);
			loadOutGUIListNames pushBack (_itemName);
			loadOutGUIListCounts pushBack _count;
		};
	};
} forEach _loadoutFlat;


if (_vehName == "") then {
	_vehName = playerVehicle;
};
_vehLB lbAdd _vehName;