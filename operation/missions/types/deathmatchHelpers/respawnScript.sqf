
_playerPositions = ["water"];
{
	_temp = [nil, 50];
	_temp set [0, getPosATL _x];
	_playerPositions pushBack _temp;
} forEach allPlayers;

_spawnPos = [[[DM_MISSIONPOS, 150]], _playerPositions] call BIS_fnc_randomPos;

if (_spawnPos isEqualTo [0, 0]) then {
	_spawnPos = [[[DM_MISSIONPOS, 150]], ["water"]] call BIS_fnc_randomPos;
	if (_spawnPos isEqualTo [0, 0]) then {
		_spawnPos = DM_MISSIONPOS;
	};
};

_xLen = (DM_MISSIONPOS select 0) - (_spawnPos select 0);
_yLen = (DM_MISSIONPOS select 1) - (_spawnPos select 1);
_tpDir = _xLen aTan2 _yLen;
if (_tpDir < 0) then {_tpDir = _tpDir + 360;};

[player, false] remoteExec ["allowDamage"];
[player, _tpDir] remoteExec ["setDir", 2];
[player, _spawnPos] remoteExec ["setPosATL", 2];
sleep 5;
[player, true] remoteExec ["allowDamage"];