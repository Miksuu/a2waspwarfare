/*
	Get a variable from the profile namespace.
	 Parameters:
		- Variable name.
		- Default Value if not found.
*/

Private ['_var','_default'];

_var = _this select 0;
_default = _this select 1;

profileNamespace getVariable [_var, _default];