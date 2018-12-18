/*  Builds a structure from a given array
	Array format: [[classname, position, direction], [[classname], [pos], [dir]], ...]
	Position is relative to [0, 0, 0]. CENTER STRUCTURE THERE!!!
	
	Code to generate structure array from editor (Recommend building in VR at [0, 0, 0]:
	_struct = []; 
	{
		_type = typeOf _x;
		if (_x != player && _type != typeOf player && _type != "Logic" && _type != "Sign_Arrow_Yellow_F" && _type != "Sign_Arrow_F" && _type != "Sign_Arrow_Green_F" && _type != "Sign_Arrow_Green_F" && _type != "Logic" && _type != "babe_helper") then {
			_tempArr = []; 
			_tempArr pushBack typeOf _x; 
			_tempArr pushBack getPos _x; 
			_tempArr pushBack getDir _x; 
			_struct pushBack _tempArr;
		};
	} forEach nearestObjects [player, [], 100, false];
	copyToClipboard str(_struct);
*/

_center = _this select 0; //take in args
_structure = _this select 1;

_objectList = [];

{
	_calcPosition = [(_center select 0) + ((_x select 1) select 0), (_center select 1) + ((_x select 1) select 1), (_center select 2) + ((_x select 1) select 2)]; //Calculate object position as offset from center position
	_tempVeh = ((_x select 0) createVehicle [0, 0, 100]);
	_tempVeh enableSimulationGlobal false;
	_tempVeh setDir (_x select 2);
	_tempVeh setPosATL _calcPosition;
	_tempVeh enableSimulationGlobal true;
	_objectList pushBack _tempVeh;
} forEach _structure;

_objectList