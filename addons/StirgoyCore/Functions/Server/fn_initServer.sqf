/*
    fn_initServer.sqf
    Stirgoy
*/

if (!isDedicated) exitWith {};

waitUntil {getClientStateNumber >=6};   //ROLES asignados

private ["_masterDB","_existe","_version","_handle","_logMe"];

//descarga de variables de GUI
stir_timer_on = nil;

//hilo con DB
_masterDB = ["new","Master"] call OO_INIDBI;
_existe = "exists" call _masterDB;

if (!_existe) then
{
    _handle = [] spawn stir_fnc_createMaster;
    waitUntil {scriptDone _handle};
    _handle = nil;
};

//versionado y actuallizacion de DB
_version = ["read",["Ajustes","Version"]] call _masterDB;

if (_version < stir_dbVer) then
{
    _handle = [] spawn stir_fnc_updateDB;
    waitUntil {scriptDone _handle};
    _handle = nil;
};

//carga de eventos de servidor
SEHVOPD = addMissionEventHandler ["HandleDisconnect", {_this call stir_fnc_scriptDesconectados;false;}];
SEHVOPC = addMissionEventHandler ["PlayerConnected", {_this call stir_fnc_scriptConectados;}];

//registro
_logMe = "StirgoyCore - MP Mission: " + (missionName) + " - Server name: " + (serverName);
[_logMe] call stir_fnc_addLog;

stir_server = true;
publicVariable "stir_server";
