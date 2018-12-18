_player = _this;

if (isPlayer _player) then {
	100 cutRsc ["redOverlay", "PLAIN", 5, true];
	playSound3D ["A3\Sounds_F\sfx\alarm_blufor.wss", _player, false, getPosASL _player, 1, 1, 100];
	sleep 5.5;
	_explosive = "DemoCharge_Remote_Ammo_Scripted" createVehicle (getPosATL _player);
	_explosive setDamage 1;
	
	sleep 10;
	
	100 cutRsc ["Default", "PLAIN", 5, true];
};