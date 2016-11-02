/*
	fn_str_link.sqf
	Stirgoy
*/
private ["_value0","_value1","_value2","_value3","_value4","_value5","_confArray","_col","_siz","_fon","_final","_setts","_ihrf","_und"];
_value0 = param [0,"",[""]];	//link
_value1 = param [1,"",[""]];	//texto
_value2 = param [2,-1,[0]];		//color
_value3 = param [3,-1,[0]];		//font
_value4 = param [4,-1,[0]];		//size
_value5 = param [5,-1,[0]];		//underline
_confArray = missionNamespace getVariable "stirgoy_str_ARR";
if ( _value2 < -1 || _value2 > (count (_confArray select 0) - 1) ) then { _value2 = -1; };
if ( _value2 < -1 || _value3 > (count (_confArray select 1) - 1) ) then { _value3 = -1; };
if ( _value2 == -1 || isNil "_value2" ) then { _col = ""; } else { _col = _confArray select 0 select _value2; };
if ( _value3 == -1 || isNil "_value3" ) then { _fon = ""; } else { _fon = _confArray select 1 select _value3; };
if ( _value4 == -1 || isNil "_value4" ) then { _siz = ""; } else { _siz = format ["size='%1' ", _value4]; };
if ( _value5 == -1 || isNil "_value5" ) then { _und = ""; } else { _und = format [_confArray select 11,_value5]; };
_ihrf = _confArray select 14;
_setts = format ["%1%2%3%4", _siz, _col, _fon, _und];
format [_ihrf,_value0, _value1, _setts ]