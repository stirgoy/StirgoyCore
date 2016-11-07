/*
	 fn_str_t.sqf
	 Stirgoy
 */

private ["_value0","_value1","_value2","_value3","_value4","_value5","_confArray","_ot","_clt","_cot","_col","_siz","_fon","_cInd","_retVal0A","_val0ArrSt","_strf","_und","_fal","_som","_smbr"];
_value0 = param [0,"",[""]];	//texto
_value1 = param [1,-1,[0]];		//color
_value2 = param [2,-1,[0]];		//fuente
_value3 = param [3,-1,[0]];		//tamaño
_value4 = param [4,-1,[0]];		//subrrallado
_value5 = param [5,-1,[0]];		//alineacion
_value6 = param [6,-1,[0]];		//sombra

_confArray = missionNamespace getVariable "stirgoy_str_ARR";
if ( _value1 < -1 || _value1 > (count (_confArray select 0) - 1) ) then { _value1 = -1; };	//Error check
if ( _value2 < -1 || _value2 > (count (_confArray select 1) - 1) ) then { _value2 = -1; };
if ( _value4 < -1 || _value4 > 1 ) then { _value4 = -1; };
if ( _value5 < -1 || _value5 > 2 ) then { _value5 = -1 };
if ( _value6 < -1 || _value6 > 2 ) then { _value6 = -1 };

_ot = _confArray select 2;
_clt = _confArray select 4;
_cot =  _confArray select 5;
_al = _confArray select 10;
_smbr = _confArray select 12;

_col = "";
_siz = "";
_fon = "";
_fal = "";
_som = "";
_retVal0A = [];

if ( _value3 == -1 || isNil "_value3" ) then { _siz = _confArray select 7; } else { _siz = format ["size='%1' ", _value3]; };
if ( _value1 == -1 || isNil "_value1" ) then { _col = _confArray select 8; } else { _col = _confArray select 0 select _value1; };
if ( _value2 == -1 || isNil "_value2" ) then { _fon = _confArray select 9; } else { _fon = _confArray select 1 select _value2; };
if ( _value4 == -1 || isNil "_value4" ) then { _und = ""; } else { _und = format [_confArray select 11, _value4]; };
if ( _value6 == -1 || isNil "_value6" ) then { _som = format [_smbr, 0] } else { _som = format [_smbr, _value6] };

switch ( _value5 ) do {
	case 0: { _fal = "left"; _fal = format [_al, _fal]; };
	case 1: { _fal = "center"; _fal = format [_al, _fal]; };
	case 2: { _fal = "right"; _fal = format [_al, _fal]; };
	default { _fal = "left"; _fal = format [_al, _fal]; };
};

//172 ¬ == </br>
_val0ArrSt = toArray _value0;
{ if ( _x == 172 ) then { _retVal0A = _retVal0A + [60,98,114,47,62]  } else { _retVal0A pushBack _x; };	}forEach _val0ArrSt;
_strf = toString _retVal0A;

format ["%1%2%8%9%10%3%4%5%6%7", _ot, _col, _siz, _fon, _cot, _strf, _clt, _und,_fal,_som]
