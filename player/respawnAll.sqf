_lastResDel = RESPAWN_DELAY;

RESPAWN_DELAY = 0;
publicVariable "RESPAWN_DELAY";

sleep .1;
{
	if (isPlayer _x) then {
		[_x, 1] call BIS_fnc_respawnTickets;
	};
} forEach allDeadMen;

RESPAWN_DELAY = _lastResDel;
publicVariable "RESPAWN_DELAY";