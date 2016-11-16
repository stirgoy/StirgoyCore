/*
    fn_cLog.sqf
    Stirgoy
    custom logs
*/

if (!isDedicated) exitWith {};

private ["_log","_save","_customDB","_saved","_saverLog","_ids","_logMe","_newR","_tik"];

_log = param [0,"",[""]];
_save = param [1,"",[""]];
_putDate = param [2,true,[false]];
if ( _log == "" || _save == "" ) exitWith {};

_newR = false;
_customDB = ["new",_log] call OO_INIDBI;
_esta = "exists" call _customDB;

//nuevo arhibo
if (!_esta) then
{
    _saved = ["write",["Ajustes","ID",0]] call _customDB;

    //addon reg
    _logMe = "StirgoyCore - new log created: " + _log;
    _newR = true;
};

//incluir fecha
if (_putDate) then
{
    _tik = ["largo"] call stir_fnc_sysDate;
    _save = _tik + "  -  " + _save;
};

//log
_ids = ["read",["Ajustes","ID"]] call _customDB;
_saverLog = ["write",["Log",_ids,_save]] call _customDB;

_ids = _ids + 1;
_saved = ["write",["Ajustes","ID",_ids]] call _customDB;


//addon reg

if (_newR) then {[_logMe] call stir_fnc_addLog;};

if (_saverLog && _saved) then
{
    _logMe = "StirgoyCore - new line in log: " + _log + " ID: " + (str(_ids - 1));
}
else
{
    _logMe = "StirgoyCore - Error writing log: " + _log + " ID: " + (str(_ids - 1));
};

[_logMe] call stir_fnc_addLog;
