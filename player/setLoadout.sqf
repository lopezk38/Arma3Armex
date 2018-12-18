//Sets player inventory to saved inventory

if (hasInterface && !(playerLoadout isEqualTo [])) then {
	player setUnitLoadout [playerLoadout, true];
};