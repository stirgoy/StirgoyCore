/*
	fn_sysDate.sqf
	Stirgoy
	Client & server
*/

private ["_modo","_devolver","_rdate","_ano","_mes","_dia","_hora","_dia","_hora","_minuto","_segundo","_corrj","_arrText","_newArr","_sepf","_seph,","_sep","_size","_ttmp","_arrDays","_intD","_de","_del","_stMes","_arrMes","_tmp"];

_modo = param[0,"full",[""]];

//restricciones de servidor
if (_modo == "full" && isDedicated) then { _modo = "largo"; };
if (_modo == "fechalarga" && isDedicated) then { _modo = "fecha"; };

//ext date with sec, wday, yday, dst; example: "[2014,9,24,21,9,57,3,266,0]"
_rdate = "real_date" callExtension "GMT+";
_rdate = call compileFinal _rdate;

_ano = _rdate select 0;
_mes = _rdate select 1;
_dia = _rdate select 2;
_hora = _rdate select 3;
_minuto = _rdate select 4;
_segundo = _rdate select 5;
_intD = _rdate select 6;

_devolver = "";
_sep = " ";
_sepf = "/"; //separador de fecha
_seph = ":"; //separador de hora
_de = " de ";
_del = " del ";
_corrj = stir_timeCorrection;
_hora = _hora + _corrj;

if (language != "Spanish") then
{
	_de = " of ";
	_del = "";
};

if (!isDedicated) then 	//el servidor no usa stringTable
{
	_arrDays = 	[
		localize "str_stir_dia0",
		localize "str_stir_dia1",
		localize "str_stir_dia2",
		localize "str_stir_dia3",
		localize "str_stir_dia4",
		localize "str_stir_dia5",
		localize "str_stir_dia6"
	];

	_arrMes = 	[
		localize "str_stir_mes0",
		localize "str_stir_mes1",
		localize "str_stir_mes2",
		localize "str_stir_mes3",
		localize "str_stir_mes4",
		localize "str_stir_mes5",
		localize "str_stir_mes6",
		localize "str_stir_mes7",
		localize "str_stir_mes8",
		localize "str_stir_mes9",
		localize "str_stir_mes10",
		localize "str_stir_mes11"
	];
	{
		_tmp = (_x + _sep);
		_arrDays set [_forEachIndex,_tmp];
	} forEach _arrDays;
};

_arrText = [
	nil,
	_sepf,
	nil,
	_sepf,
	nil,
	_sep,
	nil,
	_seph,
	nil,
	_seph,
	nil
];

_arrText set [4,_ano];
_arrText set [2,_mes];
_arrText set [0,_dia];
_arrText set [6,_hora];
_arrText set [8,_minuto];
_arrText set [10,_segundo];

switch (_modo) do {

	case "full" : {
		_stMes = _arrMes select _mes;
		_arrText set [1,_de];
		_arrText set [2,_stMes];
		_arrText set [3,_del];
		_stDia = _arrDays select _intD;
		_anadir = [_stDia];
		_arrText = _anadir + _arrText;
		{ _devolver = format["%1%2",_devolver ,_x]; }forEach _arrText;
	};

	case "largo": {	{ _devolver = format["%1%2",_devolver ,_x]; }forEach _arrText;	};

	case "fecha": {
		_newArr = [];
		for "_i" from 0 to 4 do { _ttmp = _arrText select _i; _newArr pushBack _ttmp; };
		_arrText = _newArr;
		{ _devolver = format["%1%2",_devolver ,_x]; }forEach _arrText;
	};

	case "fechalarga":	{
		_newArr = [];
		_stMes = _arrMes select _mes;
		_arrText set [1,_de];
		_arrText set [2,_stMes];
		_arrText set [3,_del];
		_stDia = _arrDays select _intD;
		_anadir = [_stDia];
		_arrText = _anadir + _arrText;
		for "_i" from 0 to 5 do { _ttmp = _arrText select _i; _newArr pushBack _ttmp; };
		_arrText = _newArr;
		{ _devolver = format["%1%2",_devolver ,_x]; }forEach _arrText;	};

	case "hora":	{
		_newArr = [];
		_size = ((count _arrText) - 1);
		for "_i" from 6 to _size do { _ttmp = _arrText select _i; _newArr pushBack _ttmp; };
		_arrText = _newArr;
		{ _devolver = format["%1%2",_devolver ,_x]; }forEach _arrText;
	};

};

_devolver
