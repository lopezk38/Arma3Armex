//Populates arrays of items for spawning loot

if (!isServer) then {
	terminate _thisScript;
};

_bl = execVM "loot\blacklist.sqf";
waitUntil {scriptDone _bl};

loot_Weapons = [];		//0
loot_Launchers = [];	//1
loot_Explosives = [];	//2
loot_Helicopters = [];	//3
loot_Planes = [];		//4
loot_Armor = [];		//5
loot_Automotives = [];	//6
loot_StaticArms = [];	//7

for "_x" from 0 to ((count(configFile >> "CfgWeapons")) - 1) do {
	_curWeap = (configFile >> "CfgWeapons") select _x;
	if (isClass _curWeap) then {
		if (getnumber(_curWeap >> "scope") == 2) then {
			if (!isClass (_curWeap >> "LinkedItems")) then {
				if (count(getarray(_curWeap >> "magazines")) != 0) then {
					_weapType = getnumber (_curWeap >> "type");
					switch (_weapType) do {
						case 1: {loot_Weapons = loot_Weapons + [configName _curWeap];}; 	//Primary weapons
						case 2: {loot_Weapons = loot_Weapons + [configName _curWeap];}; 	//Pistols
						case 4: {loot_Launchers = loot_Launchers + [configName _curWeap];};	//Launchers
						
					};
                };
            };
		};
	};
};

for "_x" from 0 to ((count(configFile >> "CfgMagazines")) - 1) do {
    _curWeap = ((configFile >> "CfgMagazines") select _x);
	if (isClass _curWeap) then {
		if (getNumber(_curWeap >> "scope") == 2) then {
			_valResult = [_curWeap, "value", "notFound"] call BIS_fnc_returnConfigEntry;
			if(_valResult == 5) then {
				if(["mine", getText (_curWeap >> "displayName")] call BIS_fnc_inString || ["satchel", getText (_curWeap >> "displayName")] call BIS_fnc_inString || ["charge", getText (_curWeap >> "displayName")] call BIS_fnc_inString) then {
					loot_Explosives = loot_Explosives + [configName _curWeap];					//Mines
				};
			};
		};
	};
};

for "_x" from 0 to ((count(configFile >> "CfgVehicles")) - 1) do {
	_curVeh = ((configFile >> "CfgVehicles") select _x);
	if (isClass _curVeh) then {
		if ((getNumber(_curVeh >> "scope")) == 2) then {
			if ((getNumber(_curVeh >> "isUAV")) != 1) then {
				_simResult = [_curVeh, "simulation", "notFound"] call BIS_fnc_returnConfigEntry;
				if (_simResult == "helicopterrtd" || _simResult == "HelicopterX" || _simResult == "helicopterX") then {
					loot_Helicopters = loot_Helicopters + [configName _curVeh];				//Helicopters
				};
				if (_simResult == "Airplane" || _simResult == "airplane" || _simResult == "airplaneX" || _simResult == "airplanex") then {
					loot_Planes = loot_Planes + [configName _curVeh];						//Planes
				};
				if (getText(_curVeh >> "vehicleClass") == "Armored") then {
					loot_Armor = loot_Armor + [configName _curVeh];							//Armored Vehicles
				} else {
					if (_simResult == "CarX" || _simResult == "carX" || _simResult == "carx") then {
						loot_Automotives = loot_Automotives + [configName _curVeh];			//Non Armored Vehicles
					};
				};
				if (getText(_curVeh >> "vehicleClass") == "Static") then {
					loot_StaticArms = loot_StaticArms + [configName _curVeh];				//Static weapons
				}
			};
		};
	};
};

//Remove blacklist stuff
loot_Weapons = loot_Weapons - loot_Blacklist;
loot_Launchers = loot_Launchers - loot_Blacklist;
loot_Explosives = loot_Explosives - loot_Blacklist;
loot_Helicopters = loot_Helicopters - loot_Blacklist;
loot_Planes = loot_Planes - loot_Blacklist;
loot_Armor = loot_Armor - loot_Blacklist;
loot_Automotives = loot_Automotives - loot_Blacklist;
loot_StaticArms = loot_StaticArms - loot_Blacklist;































