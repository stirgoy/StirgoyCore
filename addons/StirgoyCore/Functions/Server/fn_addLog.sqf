/*
    fn_addLog.sqf
    Stirgoy
*/

if (!isDedicated) exitWith {};

private ["_log","_modo","_save","_timer","_log","_regID","_ss","_save","_PUID","_temp0"];

_save = param [0,"",[""]];
_PUID = param [1,objNull,[objNull]];
_modo = param [2,0,[0]];    //para updates
if (_save == "") exitWith {};
if ((_modo != 0) && (isNull _PUID)) exitWith {};

switch (_modo) do {
    case 0: {
        //preparamos log
        _timer = ["largo"] call stir_fnc_sysDate;
        _save = _timer + "  -  " + _save;
        //preparamos DB
        _log = ["new","AddonLog"] call OO_INIDBI;
        _regID = ["read",["Ajustes","ID"]] call _log;
        _regID = _regID + 1;
        //Write
        _ss = ["write",["Log",_regID,_save]] call _log;
        _ss = ["write",["Ajustes","ID",_regID]] call _log;
     };

     case 1: {
        //preparamos log
        _temp0 = ((name _PUID) + " " + (getPlayerUID _PUID));
        _timer = ["largo"] call stir_fnc_sysDate;
        _save = (_timer + "  -  " + _temp0 + "  -  " + _save);
        //preparamos DB
        _log = ["new","AddonLog"] call OO_INIDBI;
        _regID = ["read",["Ajustes","ID"]] call _log;
        _regID = _regID + 1;
        //Write
        _ss = ["write",["Log",_regID,_save]] call _log;
        _ss = ["write",["Ajustes","ID",_regID]] call _log;
     };

};
