if (!isServer) exitWith {};

_veh = _this;

isNil { //run in unscheduled environment to prevent playerVehicles from being modified by something else while being edited here
	playerVehicles pushBack _veh;
};