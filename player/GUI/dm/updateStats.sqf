if (!isServer || !(currentMission == "deathmatch.sqf")) exitWith {};
if (isNil "playerStatsDM") exitWith {diag_log "ERROR @ player\GUI\dm\updateStats.sqf: playerStatsDM does not exist"};

_player = _this select 0;
_killer = _this select 1;

_playerIndex = playerStatsDM find (getPlayerUID _player);
_killerIndex = playerStatsDM find (getPlayerUID _killer);

//format: [player1UID, [player1Name ,player1 kills, player1 deaths], player2UID, [player2Name, player2 kills, player2 deaths], playerNUID, [playerNName, playerN kills, playerN deaths]];

_sortStats = {
	isNil { //Run in unscheduled environment to prevent array modification while being sorted
		_workingCopy = +playerStatsDM;
		_elementCount = count _workingCopy;
		if (_elementCount < 2) exitWith {};
		_sortedArrayDeaths = [];
		_sortedArrayKills = [];
		_minThisCycle = -9999;
		_minAtIndex = -9999;
		_maxThisCycle = -9999;
		_maxAtIndex = -9999;
		
		//sort by deaths and then by kills so that players with equal kills are ordered by lowest deaths
		//sort by deaths
		while {count _workingCopy > 0} do {
			for "_x" from 1 to (_elementCount - 1) step 2 do { //Scan for minimum
				if (_x == 1) then { //first cycle initialization
					_minThisCycle = (_workingCopy select 1) select 2;
					_minAtIndex = 1;
				} else {
					if (((_workingCopy select _x) select 2) < _minThisCycle) then {
						_minThisCycle = (_workingCopy select _x) select 2;
						_minAtIndex = _x;
					};
				};
			};
			_sortedArrayDeaths pushBack (_workingCopy select (_minAtIndex - 1));
			_sortedArrayDeaths pushBack (_workingCopy select _minAtIndex);
			_workingCopy deleteRange [_minAtIndex - 1, 2];
		};
		
		//sort by kills
		while {count _sortedArrayDeaths > 0} do {
			for "_x" from 1 to (_elementCount - 1) step 2 do { //Scan for minimum
				if (_x == 1) then { //first cycle initialization
					_maxThisCycle = (_sortedArrayDeaths select 1) select 2;
					_maxAtIndex = 1;
				} else {
					if (((_sortedArrayDeaths select _x) select 1) > _maxThisCycle) then {
						_maxThisCycle = (_sortedArrayDeaths select _x) select 1;
						_maxAtIndex = _x;
					};
				};
			};
			_sortedArrayKills pushBack (_sortedArrayDeaths select (_maxAtIndex - 1));
			_sortedArrayKills pushBack (_sortedArrayDeaths select _maxAtIndex);
			_sortedArrayDeaths deleteRange [_maxAtIndex - 1, 2];
		};
		playerStatsDM = _sortedArrayKills;
	};
};

if (_playerIndex == -1) then { //case: player not in list, maybe joined in progress?
	diag_log "Player not in list, adding them...";
	_playerStatsDM pushBack (getPlayerUID _player);
	_playerStatsDM pushBack [name _player, 0, 0];
	_playerIndex = (count _playerStatsDM) - 2 // minus 1 to get last index since arrays start at index 0 not 1, minus another 1 to get second to last index (where player UID is stored)
};

if (_player == _killer) then { //suicide
	(playerStatsDM select (_playerIndex + 1)) set [1, ((playerStatsDM select (_playerIndex + 1)) select 1) - 1]; //decrement kills
	(playerStatsDM select (_playerIndex + 1)) set [2, ((playerStatsDM select (_playerIndex + 1)) select 2) + 1]; //increment deaths
} else {
	if (_killerIndex == -1) then { //case: killer is not the player (avoid double adding player to list) and killer is not in the list, maybe joined in progress?
		diag_log "Killer not in list, adding them...";
		_playerStatsDM pushBack (getPlayerUID _killer);
		_playerStatsDM pushBack [name _killer, 0, 0];
		_killerIndex = (count _playerStatsDM) - 2 // minus 1 to get last index since arrays start at index 0 not 1, minus another 1 to get second to last index (where killer UID is stored)
	};
};

if (_playerIndex == _killerIndex) exitWith {call _sortStats; publicVariable "playerStatsDM"; ["player\GUI\dm\refresh.sqf"] remoteExec ["execVM"];}; //done. Had to exit outside of the scope of the last if, hence the double checking for suicide. 
																																					//Checked with index this time since it's faster than checking strings and they're guaranteed to be valid by this point in the code
											   
//Increment kills for killer
{
	_killerKills = ((playerStatsDM select (_killerIndex + 1)) select 1);
	_killerKills = _killerKills + 1; //Could combine this line and the previous but did not for clarity
	
	//Check for a winner as soon as possible
	isNil { //Run the following block in the unscheduled environment to prevent race conditions
		if (_killerKills >= scoreLimitDM) then {
			if (winnerDM == "null") then { //Has there been a winner set yet? Prevents race conditions where another instance of this script has started but not reached this code block yet. Prevents second place from winning if they get a kill at the score limit the instant after the real winner did
				winnerDM = (name _killer);
				currentMission != null; //Block any new instances of this script from running
				["player\GUI\dm\respawnEventHandler.sqf", "player\unsubscribe.sqf"] remoteExec ["execVM"]; //Remove this script from the event handler list so it is no longer spawned
				respawnAllowed = false;
				publicVariable "respawnAllowed";
				hasScoreLimitBeenReached = true;
			};
		};
	};
	
	(playerStatsDM select (_playerIndex + 1)) set [1, _killerKills]; //Update kills
};

//Increment deaths for player
(playerStatsDM select (_playerIndex + 1)) set [2, ((playerStatsDM select (_playerIndex + 1)) select 2) + 1]; //increment deaths

call _sortStats;
publicVariable "playerStatsDM";
["player\GUI\dm\refresh.sqf"] remoteExec ["execVM"];