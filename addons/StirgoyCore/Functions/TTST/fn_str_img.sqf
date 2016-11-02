/*
	fn_str_img.sqf
	Stirgoy
*/

private["_value0","_value1","_value2","_confArray","_col","_siz","_bimg","_fimg"];
_value0 = param [0,"",[""]];
_value1 = param [1,1,[0]];
_value2 = param [2,-1,[0]];
_confArray = missionNamespace getVariable "stirgoy_str_ARR";
if ( _value2 < -1 || _value2 > (count (_confArray select 0) - 1) ) then { _value2 = -1; };
if ( _value1 == -1 || isNil "_value1" ) then { _siz = ""; } else { _siz = format ["size='%1' ", _value1]; };
if ( _value2 == -1 || isNil "_value2" ) then { _col = "color='#FFFFFFFF' "; } else { _col = _confArray select 0 select _value2; };
_closI = _confArray select 6;
_bimg = _confArray select 13;
_fimg = format [_bimg, _value0];
format ["%1%2%3%4", _fimg, _siz, _col, _closI]