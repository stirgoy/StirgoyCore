/*
	fn_getCfgClass.sqf
	Stigoy
*/

private ["_par","_arr","_devu"];

_par = param [0,"",[""]];
if (_par == "") exitWith {};

_devu = "";
_arr = [] call stir_fnc_classList;

{ if ( (getNumber (configFile / _x / _par / "scope") > 0) ) exitWith { _devu = _x; }; } forEach _arr;

_devu
