
_arrayToFlatten = _this;
_flattenedArray = [];

private ["_crawlerFlattener"]; //declare function

_crawlerFlattener = { //define function. This is a recursive function
	_flattenedArray pushBack "/a";
	{
		_pushBack = _x;
		if (_x isEqualType []) then {
			_pushBack = + _x;
			if ((count _pushBack) != 0) then {
				isNil {_pushBack call _crawlerFlattener;}; //Force new stack frame
			};
		} else {
			_flattenedArray pushBack _pushBack;
		};
	} forEach (_this);
};

_arrayToFlatten call _crawlerFlattener;
_flattenedArray deleteAt 0;

_flattenedArray
