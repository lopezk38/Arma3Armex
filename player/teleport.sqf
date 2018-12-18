//Teleports player between teleporters

_unitTP = _this select 1; //player
_dest = (_this select 3) select 0; //Destination
_angle = (_this select 3) select 1; //Angle
_startPos = getPos _unitTP;

_tpOffsetFromDestination = 4; //Distance (meters) to offset player from TP location so that they aren't teleported into the map eisel

_offsetX = _tpOffsetFromDestination * sin _angle;
_offsetY = _tpOffsetFromDestination * cos _angle; 

_dest = [(_dest select 0) - _offsetX, (_dest select 1) - _offsetY, _dest select 2];

[[_startPos, _dest, .05, false], "player\uiMapTransition.sqf"] remoteExec ["execVM", _unitTP];

sleep .1;
_unitTP allowDamage false;
_unitTP setPosATL [0, 0, 0];

sleep 4;

_unitTP setPosATL _dest;
_unitTP setDir _angle;
_unitTP allowDamage true;