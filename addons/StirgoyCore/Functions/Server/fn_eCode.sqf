/*
    fn_eCode.sqf
    Stirgoy
*/

if (!isDedicated) exitWith {};

private ["_modo","_inPar","_conex","_retu","_tmp"];

//entrada
_modo = param [0,"",[""]];
_inPar = param [1,"",[""]];
_hardM = param [2,true,[false]];    //hard-moded ON xD

//cond. salida
if !(_modo in ["C","D"]) exitWith {};
if (_inPar == "") exitWith {};

//meh...
_conex = ["new","Master"] call OO_INIDBI;
_retu = "";

switch (_modo) do {
    case "C":
    {
        if (_hardM) then { _tmp = (toArray _inPar); _inPar = (str _tmp); }; //yep
        _retu = ["encodeBase64",_inPar] call _conex;
    };
    case "D":
    {
        _retu = ["decodeBase64",_inPar] call _conex;
        if (_hardM) then { _tmp = call compile _retu; _retu = (toString _tmp);};    //pey
    };
};

_retu
