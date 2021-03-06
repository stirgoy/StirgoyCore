/*
    fn_updateDB.sqf
    Stirgoy
    Actualiza master.ini
*/

if (!isDedicated) exitWith {};

private ["_masterDB","_existe","_version","_saved","_logMe"];

_masterDB = ["new","Master"] call OO_INIDBI;
_existe = "exists" call _masterDB;
_version = ["read",["Ajustes","Version"]] call _masterDB;

//  1/11/16
if ( _version == 0.1) then
{
    _saved = ["write",["Ajustes","Version",0.2]] call _masterDB;
    _saved = ["write",["Ajustes","playersLog",1]] call _masterDB;
    _version = 0.2;
};

/*
if ( _version == 0.2) then
{
    _saved = ["write",["Ajustes","Version",0.3]] call _masterDB;
    _version = 0.3;
};
*/

_logMe = "StirgoyCore - Updated DB version: " + (str _version);
[_logMe] call stir_fnc_addLog;
