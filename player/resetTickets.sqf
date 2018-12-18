_ticketsToAdd = _this;

[player, -1 * ([player] call BIS_fnc_respawnTickets)] call BIS_fnc_respawnTickets; //clear player tickets
[player, _ticketsToAdd] call BIS_fnc_respawnTickets; //add 1 ticket