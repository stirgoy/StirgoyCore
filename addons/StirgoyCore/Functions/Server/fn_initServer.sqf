/*
    fn_initServer.sqf
    Stirgoy
*/

if (!isDedicated) exitWith {};
    
waitUntil {getClientStateNumber >=9};

private ["_masterDB","_existe","_version","_handle","_logMe"];

stir_timer_on = nil;

_masterDB = ["new","Master"] call OO_INIDBI;
_existe = "exists" call _masterDB;

if (!_existe) then
{
    _handle = [] spawn stir_fnc_createMaster;
    waitUntil {scriptDone _handle};
    _handle = nil;
};

_version = ["read",["Ajustes","Version"]] call _masterDB;

if (_version < stir_dbVer) then
{
    _handle = [] spawn stir_fnc_updateDB;
    waitUntil {scriptDone _handle};
    _handle = nil;
};

_logMe = "StirgoyCore - MP Mission: " + (missionName) + " - Server name: " + (serverName);
[_logMe] call stir_fnc_addLog;
