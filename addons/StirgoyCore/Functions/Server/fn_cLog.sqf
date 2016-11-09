/*
    fn_cLog.sqf
    Stirgoy
*/

private ["_log","_save","_customDB","_saved","_saverLog","_ids","_logMe"];

_log = param [0,"",[""]];
_save = param [1,"",[""]];
if ( _log == "" || _save == "" ) exitWith {};

_customDB = ["new",_log] call OO_INIDBI;
_esta = "exists" call _customDB;

if (!_esta) then
{
    _saved = ["write",["Ajustes","ID",0]] call _customDB;

    //addon reg
    _logMe = "StirgoyCore - new log created: " + _log;
    [_logMe] call stir_fnc_addLog;
};

_ids = ["read",["Ajustes","ID"]] call _customDB;
_saverLog = ["write",["Log",_ids,_save]] call _customDB;

_ids = _ids + 1;
_saved = ["write",["Ajustes","ID",_ids]] call _customDB;


//addon reg
if (_saverLog && _saved) then
{
    _logMe = "StirgoyCore - new line in log: " + _log + " ID: " + (str(_ids - 1));
}
else
{
    _logMe = "StirgoyCore - Error writing log: " + _log + " ID: " + (str(_ids - 1));
};

[_logMe] call stir_fnc_addLog;
