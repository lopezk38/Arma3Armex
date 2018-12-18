//Force open map and show player moving to new spot for 5 seconds

_startPos = _this select 0;
_endPos = _this select 1;
_zoom = _this select 2;
_showDesc = _this select 3;
_curPos = _startPos;

openMap [true, true]; //open map forced

mapAnimAdd [ONE_FRAME, _zoom, _startPos]; //move to start

if (_showDesc) then {
	1 cutRsc ["missionDesc", "PLAIN"];
	systemChat str(uiNamespace getVariable "missionDescDisp");
	((uiNamespace getVariable "missionDescDisp") displayCtrl 1) ctrlSetText missionDesc;
};

0 cutRsc ["mapPointer", "PLAIN"];
mapAnimAdd [1, _zoom, _startPos]; //1 second at start
mapAnimAdd [3, _zoom, _endPos]; //3 seconds to end
mapAnimCommit;
sleep 5;
1 cutRsc ["Default", "PLAIN"]; //delete description
0 cutRsc ["Default", "PLAIN"]; //delete mapPointer
openMap [false, false]; //close map, disable forced map
