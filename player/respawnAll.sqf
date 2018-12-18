{
	if (isPlayer _x) then {
		[_x, 1] call BIS_fnc_respawnTickets;
	};
} forEach allDeadMen;