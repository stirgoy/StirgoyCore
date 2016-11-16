/*
    fn_scriptDesconectados.sqf
    Stirgoy
*/

if !(isDedicated) exitWith {};

private ["_masterDB1","_fuera","_pjl","_existe","_oks","_reg","_nReg","_linea","_nombre","_uidd","_srvID","_escri","_unidad"];

_masterDB1 = ["new","Master"] call OO_INIDBI;
_fuera = ["read",["Ajustes","playersLog"]] call _masterDB1;
if (_fuera == 0) exitWith {};

//parametros de entrada
_unidad = _this select 0;
_srvID = _this select 1;
_uidd = _this select 2;
_nombre = _this select 3;

if (isNull _unidad) exitWith {};
if (isNil "_uidd") exitWith {};
if (isNil "_nombre") exitWith {};
if (isNil "_srvID") exitWith {};
if (_nombre == "__SERVER__") exitWith {};

_ownerID = owner _unidad;

//fecha y hora
_reg = ["largo"] call stir_fnc_sysDate;

//"conexion"
_pjl = ["new","players"] call OO_INIDBI;
_existe = "exists" call _pjl;

//missing file???
if !(_existe) then
{
    _nReg = format [" %1  -  Log need one line here, never leave empty",_reg];

    _oks = ["write",["Ajustes","ID",0]] call _pjl;
    _oks = ["write",["Log","ID0",_nReg]] call _pjl;
};

//preparamos
_escri = format ["%1  ID %4 - Disconnected - %2 - %3 ",_reg,_nombre,_uidd,_ownerID];
_linea = ["read",["Ajustes","ID"]] call _pjl;

//registro
_oks = ["write",["Log",_linea,_escri]] call _pjl;
_linea = _linea + 1;
_oks = ["write",["Ajustes","ID",_linea]] call _pjl;
