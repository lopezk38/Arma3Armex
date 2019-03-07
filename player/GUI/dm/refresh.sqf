if (isDedicated || isNull findDisplay 5001) exitWith {};

disableSerialization;

_lbCtrl = ((findDisplay 5001) displayCtrl 2);

lnbClear _lbCtrl;

//format: [player1UID, [player1Name ,player1 kills, player1 deaths], player2UID, [player2Name, player2 kills, player2 deaths], playerNUID, [playerNName, playerN kills, playerN deaths]];
_scLen = count playerStatsDM;
for "_i" from 0 to (_scLen - 1) step 2 do {
	_lbCtrl lnbAddRow [(playerStatsDM select (_i + 1)) select 0, str((playerStatsDM select (_i + 1)) select 1), str((playerStatsDM select (_i + 1)) select 2)];
};