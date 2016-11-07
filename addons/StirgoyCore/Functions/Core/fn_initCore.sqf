/*
	fn_initCore.sqf
	Stirgoy
*/
[] spawn {
    //waitUntil {getClientStateNumber >= 8};

    //Variables
    call compile PreprocessFileLineNumbers "StirgoyCore\Functions\variables.sqf";

    //init stxt
    [] call stir_fnc_initStirText;

};

//server side
if (isDedicated) then {
    [] spawn stir_fnc_initServer;
};
