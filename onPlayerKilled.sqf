_player = _this select 0;
_body = _this select 1;

sleep .1; //attempt to fix problems caused by lag

removeAllActions _body;

if (respawnAllowed) then {
	sleep RESPAWN_DELAY;
	[_this select 0, 1] call BIS_fnc_respawnTickets;
} else {
	sleep .5;
	if(!isNull _player) then {
		["Initialize", [_player, [west], false, true, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;
	};
};