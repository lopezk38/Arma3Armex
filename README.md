Armex remake (originally from Arma 2) for Arma 3.
Created by lopezk38 (Nitroge on Steam)

Sandbox mission that spawns selection of vehicles and weapons. Players can play around in the sandbox or select weapons/vehicles for use in a series of short missions.

Supports any weapon/vehicle/clothing/etc mod

Supports blacklisting classnames so that they do not spawn in the sandbox.
	Do this by adding classnames to the array in loot\blacklist.sqf
	Mission comes out of the box with many duplicate classes blacklisted already, such as extra camos or variants of models with different magazine models
	

Supports adding custom missions:

	Step 1:
		Pick a mission name. In the following instructions, replace <Your Mission Name Here> with the name you picked
	
	Step 2:
		Create a copy of operation\missions\types\ExampleMission.sqf and name it <Your Mission Name Here>.sqf
	
	Step 3:
		Create a copy of operation\missions\descriptions\ExampleMission.sqf and name it <Your Mission Name Here>.sqf
	
	Step 4:
		Add <Your Mission Name Here>.sqf to the array in operation\missions\list.sqf. Follow the format in list.sqf
		
	Step 5: 
		Edit operation\missions\types\<Your Mission Name Here>.sqf to your choosing. Follow the comments to structure the mission properly
	
	Step 6:
		Edit the string in operation\missions\descriptions\<Your Mission Name Here>.sqf to your choosing. Don't make it too long.
		
		
Supports ports to other maps simply by placing cones in 3Den editor and putting the following in their respective init fields:

	For spawn point (Place this cone first in the editor since it's used to declare variables used by other cones):
	
		SPAWN_POINT = getPosATL this;

		createMarker ["spawn", getPosATL this];
		"spawn" setMarkerType "hd_dot";
		"spawn" setMarkerText "Spawn";
		"spawn" setMarkerColor "ColorBlue";

		tpPoints = [];

		lootSpawnPoints_Weapons = [];
		lootSpawnPoints_Launchers = []; 
		lootSpawnPoints_Explosives = []; 
		lootSpawnPoints_Helicopters = [];
		lootSpawnPoints_Planes = [];
		lootSpawnPoints_Armor = [];
		lootSpawnPoints_Automotives = [];
		lootSpawnPoints_StaticArms = [];

		lootSpawnDirections_Weapons = []; 
		lootSpawnDirections_Launchers = []; 
		lootSpawnDirections_Explosives = []; 
		lootSpawnDirections_Helicopters = []; 
		lootSpawnDirections_Planes = []; 
		lootSpawnDirections_Armor = []; 
		lootSpawnDirections_Automotives = []; 
		lootSpawnDirections_StaticArms = [];

		execFSM "FSM\missionFlow.fsm";
		deleteVehicle this;

	For weapon spawns:
		lootSpawnPoints_Weapons pushBack getPosATL this;
		lootSpawnDirections_Weapons pushBack getDir this;
		deleteVehicle this;
	
	For launcher spawns:
		lootSpawnPoints_Launchers pushBack getPosATL this;
		lootSpawnDirections_Launchers pushBack getDir this;
		deleteVehicle this;
		
	For explosive spawns:
		lootSpawnPoints_Explosives pushBack getPosATL this;
		lootSpawnDirections_Explosives pushBack getDir this;
		deleteVehicle this;
		
	For helicopter spawns:
		lootSpawnPoints_Helicopters pushBack getPosATL this;
		lootSpawnDirections_Helicopters pushBack getDir this;
		deleteVehicle this;
		
	For airplane spawns:
		lootSpawnPoints_Planes pushBack getPosATL this;
		lootSpawnDirections_Planes pushBack getDir this;
		deleteVehicle this;
		
	For armored vehicle spawns:
		lootSpawnPoints_Armor pushBack getPosATL this;
		lootSpawnDirections_Armor pushBack getDir this;
		deleteVehicle this;
		
	For car spawns:
		lootSpawnPoints_Automotives pushBack getPosATL this;
		lootSpawnDirections_Automotives pushBack getDir this;
		deleteVehicle this;
		
	For static weapon spawns:
		lootSpawnPoints_StaticArms pushBack getPosATL this;
		lootSpawnDirections_StaticArms pushBack getDir this;
		deleteVehicle this;
	
	For teleport locations:
		tpPoints pushBack [getPosATL this, getDir this, "<YOUR TELEPORT NAME HERE>"];
		createMarker ["<YOUR TELEPORT NAME HERE>", getPosATL this];
		"<YOUR TELEPORT NAME HERE>" setMarkerType "hd_dot";
		"<YOUR TELEPORT NAME HERE>" setMarkerText "<YOUR TELEPORT NAME HERE>";
		"<YOUR TELEPORT NAME HERE>" setMarkerColor "ColorBlue";
		deleteVehicle this;
		
	Then place an object to be used for the virtual arsenal. This will also be used to prevent loot spawns from falling through tables or other surfaces. Put the following in the init field

		0 = ["AmmoboxInit",[this,true]] spawn BIS_fnc_arsenal;
		LOOT_ANCHOR = this;
		
	Finish the port by placing the mission scripts into the mission folder. Do not overwrite mission.sqf but overwrite everything else
	
