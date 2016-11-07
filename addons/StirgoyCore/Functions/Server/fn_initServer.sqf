/*
    fn_initServer.sqf
    Stirgoy
*/

waitUntil {getClientStateNumber >=9};

private ["_masterDB","_existe","_version","_handle","_logMe"];

stir_timer_on = nil;

_masterDB = ["new","Master"] call OO_INIDBI;
_existe = "exists" call _masterDB;

if (!_existe) then
{
    _handle = [] spawn stir_fnc_createMaster;
    waitUntil {scriptDone _handle};
};

_version = ["read",["Ajustes","Version"]] call _masterDB;

//  Actual: 0.1    |    1/11/2016
if (_version >= 0.1) then
{
    //Updater
};

_logMe = "StirgoyCore - MP Mission: " + (missionName) + " - Server name: " + (serverName);
[_logMe] call stir_fnc_addLog;
