/*
	Resize an array by removing the given index.
	 Parameters:
		- Array.
*/

Private ["_array","_index"];

_array = +(_this select 0);
_index = _this select 1;

if (count _array > 0) then {
	_array set [_index, "cti_nil"];
	_array = _array - ["cti_nil"];
};

_array