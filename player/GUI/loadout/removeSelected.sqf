/*********************************************************************************
WARNING: THIS FUNCTION IS FUCKING AWFUL. DON'T EVER CODE LIKE THIS. EVER.

Turns out ARMA does not properly handle loops. If you try to call a recursive
function from a loop, it will overwrite the loop variables in the loop from
which you called the recursive function. This leads to shit hitting the fan.
I spent days trying to figure this out. I brought in a friend to help and we
figured this out in about 3 hours. The solution was to copy and paste the
function 6 times and chain the function calls. This is not infinitely scaleable
like I had initially hoped but I can't think of a way to do this with only loops
(within the restrictions of ARMA) in a fashion which would be less awful than this.
*********************************************************************************/ 

_targetIndex = _this;
_decrementInsteadOfRemove = false;

if (_targetIndex isEqualType []) then {
	_targetIndex = _this select 0;
	
	_decrementInsteadOfRemove = _this select 1;
	if (isNil "_decrementInsteadOfRemove") then {
		_decrementInsteadOfRemove = false;
	};
};


private ["_crawler"]; //declare function

_crawler = { //define function. This is a recursive function
	_counter = _this select 0;
	_stopIndex = _this select 2;
	_arrayToReturn = [];
	
	{
		_pushBack = _x;
		if (_x isEqualType []) then {
			_pushBack = + _x;
		};
		
		if (_counter == _stopIndex) then {
			if (_x isEqualType []) then {
				_pushBack = [];
			} else {
				if (_x isEqualType "") then {
					_pushBack = "";
				} else {
					if (!(_decrementInsteadOfRemove)) then {
						_pushBack = 0;
					} else {
						_pushBack = _pushBack - 1;
					};
				};
			};
			_counter = _counter + 1;
		} else {
			_counter = _counter + 1;
			if (_pushBack isEqualType []) then {
				if ((count _pushBack) != 0) then {
					_temp = + ([_counter, _pushBack, _stopIndex] call _crawler1);
					_counter = _temp select 1;
					_pushBack = + (_temp select 0);
				};
			};
		};
		
		_arrayToReturn pushBack _pushBack;
		
	} forEach (_this select 1);
	
	_return = [_arrayToReturn, _counter];

	_return
};

private ["_crawler1"]; //declare function

_crawler1 = { //define function. This is a recursive function
	_counter1 = _this select 0;
	_stopIndex1 = _this select 2;
	_arrayToReturn1 = [];
	
	{
		_pushBack1 = _x;
		if (_x isEqualType []) then {
			_pushBack1 = + _x;
		};
		
		if (_counter1 == _stopIndex1) then {
			if (_x isEqualType []) then {
				_pushBack1 = [];
			} else {
				if (_x isEqualType "") then {
					_pushBack1 = "";
				} else {
					if (!(_decrementInsteadOfRemove)) then {
						_pushBack1 = 0;
					} else {
						_pushBack1 = _pushBack1 - 1;
					};
				};
			};
			_counter1 = _counter1 + 1;
		} else {
			_counter1 = _counter1 + 1;
			if (_pushBack1 isEqualType []) then {
				if ((count _pushBack1) != 0) then {
					_temp1 = + ([_counter1, _pushBack1, _stopIndex1] call _crawler2);
					_counter1 = _temp1 select 1;
					_pushBack1 = + (_temp1 select 0);
				};
			};
		};
		
		_arrayToReturn1 pushBack _pushBack1;
		
	} forEach (_this select 1);
	
	_return1 = [_arrayToReturn1, _counter1];

	_return1
};

private ["_crawler2"]; //declare function

_crawler2 = { //define function. This is a recursive function
	_counter2 = _this select 0;
	_stopIndex2 = _this select 2;
	_arrayToReturn2 = [];
	
	{
		_pushBack2 = _x;
		if (_x isEqualType []) then {
			_pushBack2 = + _x;
		};
		
		if (_counter2 == _stopIndex2) then {
			if (_x isEqualType []) then {
				_pushBack2 = [];
			} else {
				if (_x isEqualType "") then {
					_pushBack2 = "";
				} else {
					if (!(_decrementInsteadOfRemove)) then {
						_pushBack2 = 0;
					} else {
						_pushBack2 = _pushBack2 - 1;
					};
				};
			};
			_counter2 = _counter2 + 1;
		} else {
			_counter2 = _counter2 + 1;
			if (_pushBack2 isEqualType []) then {
				if ((count _pushBack2) != 0) then {
					_temp2 = + ([_counter2, _pushBack2, _stopIndex2] call _crawler3);
					_counter2 = _temp2 select 1;
					_pushBack2 = + (_temp2 select 0);
				};
			};
		};
		
		_arrayToReturn2 pushBack _pushBack2;
		
	} forEach (_this select 1);
	
	_return2 = [_arrayToReturn2, _counter2];

	_return2
};

private ["_crawler3"]; //declare function

_crawler3 = { //define function. This is a recursive function
	_counter3 = _this select 0;
	_stopIndex3 = _this select 2;
	_arrayToReturn3 = [];
	
	{
		_pushBack3 = _x;
		if (_x isEqualType []) then {
			_pushBack3 = + _x;
		};
		
		if (_counter3 == _stopIndex3) then {
			if (_x isEqualType []) then {
				_pushBack3 = [];
			} else {
				if (_x isEqualType "") then {
					_pushBack3 = "";
				} else {
					if (!(_decrementInsteadOfRemove)) then {
						_pushBack3 = 0;
					} else {
						_pushBack3 = _pushBack3 - 1;
					};
				};
			};
			_counter3 = _counter3 + 1;
		} else {
			_counter3 = _counter3 + 1;
			if (_pushBack3 isEqualType []) then {
				if ((count _pushBack3) != 0) then {
					_temp3 = + ([_counter3, _pushBack3, _stopIndex3] call _crawler4);
					_counter3 = _temp3 select 1;
					_pushBack3 = + (_temp3 select 0);
				};
			};
		};
		
		_arrayToReturn3 pushBack _pushBack3;
		
	} forEach (_this select 1);
	
	_return3 = [_arrayToReturn3, _counter3];
	
	_return3
};

private ["_crawler4"]; //declare function

_crawler4 = { //define function. This is a recursive function
	_counter4 = _this select 0;
	_stopIndex4 = _this select 2;
	_arrayToReturn4 = [];
	
	{
		_pushBack4 = _x;
		if (_x isEqualType []) then {
			_pushBack4 = + _x;
		};
		
		if (_counter4 == _stopIndex4) then {
			if (_x isEqualType []) then {
				_pushBack4 = [];
			} else {
				if (_x isEqualType "") then {
					_pushBack4 = "";
				} else {
					if (!(_decrementInsteadOfRemove)) then {
						_pushBack4 = 0;
					} else {
						_pushBack4 = _pushBack4 - 1;
					};
				};
			};
			_counter4 = _counter4 + 1;
		} else {
			_counter4 = _counter4 + 1;
			if (_pushBack4 isEqualType []) then {
				if ((count _pushBack4) != 0) then {
					_temp4 = + ([_counter4, _pushBack4, _stopIndex4] call _crawler5);
					_counter4 = _temp4 select 1;
					_pushBack4 = + (_temp4 select 0);
				};
			};
		};
		
		_arrayToReturn4 pushBack _pushBack4;

	} forEach (_this select 1);
	
	_return4 = [_arrayToReturn4, _counter4];

	_return4
};

private ["_crawler5"]; //declare function

_crawler5 = { //define function. This is a recursive function
	_counter5 = _this select 0;
	_stopIndex5 = _this select 2;
	_arrayToReturn5 = [];

	{
		_pushBack5 = _x;
		if (_x isEqualType []) then {
			_pushBack5 = + _x;
		};
		
		if (_counter5 == _stopIndex5) then {
			if (_x isEqualType []) then {
				_pushBack5 = [];
			} else {
				if (_x isEqualType "") then {
					_pushBack5 = "";
				} else {
					if (!(_decrementInsteadOfRemove)) then {
						_pushBack5 = 0;
					} else {
						_pushBack5 = _pushBack5 - 1;
					};
				};
			};
			_counter5 = _counter5 + 1;
		} else {
			_counter5 = _counter5 + 1;
			if (_pushBack5 isEqualType []) then {
				if ((count _pushBack5) != 0) then {
					assert(false); //Out of crawlers
				};
			};
		};
		
		_arrayToReturn5 pushBack _pushBack5;
		
	} forEach (_this select 1);
	
	_return5 = [_arrayToReturn5, _counter5];

	_return5
};

_selectArr = [0, playerLoadout, _targetIndex] call _crawler; //Pass in inital counter, array to scan, and index to stop at
_selectArr = _selectArr select 0; //strip out counter from result

playerLoadout = + _selectArr;

execVM "player\GUI\loadout\refresh.sqf";























/* This is the old recursive function. It returns an array of subsequent
array indecies for an object at a given index. I think it works but I 
found out that the data it returns is useless because ARMA doesn't have
explicit pointers and I couldn't get around that. So I used this function
as a basis for the awful ass function that actually made the cut. It used to
be tidy like this one until I realized that ARMA doesn't work as it should...
I used it as a basis for the function that finds the index that gets fed 
into the awful ass function as well.


private ["_crawler"]; //declare function

_crawler = { //define function. This is a recursive function
	_counter = _this select 0;
	_array = _this select 1;
	_stopIndex = _this select 2;
	_indexToReturn = [];
	
	{
		if (_counter >= _stopIndex) exitWith {_indexToReturn = [_forEachIndex];};
		
		_counter = _counter + 1;
		
		if (_x isEqualType []) then {
			_index = [_counter, _x, _stopIndex] call _crawler;
			_counter = _index select 1;
			_index = _index select 0;
			
			if (!(_index isEqualTo [])) then {
				_indexToReturn = [_forEachIndex] + _index;
			};
		};
		
		if (!(_indexToReturn isEqualTo [])) exitWith {};	
	} forEach _array;
	
	_return = [_indexToReturn, _counter];
	
	
	_return
};
*/