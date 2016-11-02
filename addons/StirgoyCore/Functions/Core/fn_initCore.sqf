/*
	fn_initCore.sqf
	Stirgoy
*/
[] spawn {
    waitUntil {getClientStateNumber >= 9};

    //Variables
    call compile PreprocessFileLineNumbers "StirgoyCore\Functions\variables.sqf";

    //init stxt
    [] call stir_fnc_initStirText;

};

//server side
if (isDedicated) then {
    [] spawn stir_fnc_initServer;    
};
