if (!isServer) exitWith {};

_playerLoadout = _this;

isNil { //run in unscheduled environment to prevent playerLoadouts from being modified by something else while being edited here
		playerLoadouts pushBack + _playerLoadout;
};