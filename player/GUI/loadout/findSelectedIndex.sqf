waitUntil {!(isNull findDisplay 5000)};
_loadoutLB = ((findDisplay 5000) displayCtrl 4);

_index = lbCurSel _loadoutLB;
if (_index == -1) exitWith {};
_itemToFind = loadOutGUIList select _index;
_amountToFind = loadOutGUIListCounts select _index;

private ["_reverseCrawler"]; //declare function

_reverseCrawler = { //define function. This is a recursive function
	_counter = _this select 0;
	_array = _this select 1;
	_stopItem = _this select 2;
	_reqAmt = _this select 3;
	_minIndex = _this select 4;
	_indexToReturn = -1;
	
	{
		_exit = false;
		if (_x isEqualTo _stopItem) then {
			if (_reqAmt > 1) then {
				if ((count _array) > 2) then {
					if ((_array select (_forEachIndex + 1)) isEqualTo _reqAmt) then {
						_indexToReturn = _counter + 1;
						_exit = true;
					};
				};
			} else {
				if (_counter >= _minIndex) then {
					if (_forEachIndex == 0) then {
						_indexToReturn = _counter - 1;
					} else {
					 _indexToReturn = _counter;
					};
					_exit = true;
				}
			};
		};
		
		if (_exit) exitWith {_indexToReturn};
		
		_counter = _counter + 1;
		
		if (_x isEqualType []) then {
			_temp = [_counter, _x, _stopItem, _reqAmt, _minIndex] call _reverseCrawler;
			_counter = _temp select 1;
			_temp = _temp select 0;
			
			if (_temp != -1) then {
				_indexToReturn = _temp;
			};
		};
		
		if (_indexToReturn != -1) exitWith {};	
	} forEach _array;
	
	_return = [_indexToReturn, _counter];

	_return
};

_index = [0, playerLoadout, _itemToFind, _amountToFind, _index] call _reverseCrawler;
_index = _index select 0;

if (_amountToFind > 1) then {
	[_index, true] execVM 'player\GUI\loadout\removeSelected.sqf';
} else {
	_index execVM 'player\GUI\loadout\removeSelected.sqf';
};




































