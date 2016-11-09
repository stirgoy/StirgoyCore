/*
    fn_createMaster.sqf
    Stirgoy
*/

if (!isDedicated) exitWith {};

private ["_creaDB","_versionn","_testReg","_creaLog","_time","_ok"];

_versionn = (getNumber (configFile / "StirgoyCore" / "version"));
_testReg = " %1  -  Log need one line here, never leave empty";
_time = ["largo"] call stir_fnc_sysDate;
_testReg = format[_testReg,_time];

_creaDB = ["new","Master"] call OO_INIDBI;
_creaLog = ["new","AddonLog"] call OO_INIDBI;

_ok = ["write",["Ajustes","version",_versionn]] call _creaDB;

_ok =["write",["Ajustes","ID",0]] call _creaLog;
_ok =["write",["Ajustes","Creado",_time]] call _creaLog;
_ok =["write",["Log","ID0",_testReg]] call _creaLog;
_ok = ["write",["Ajustes","Version",0.2]] call _masterDB;
