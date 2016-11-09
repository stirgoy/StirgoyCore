/*
	fn_timerA.sqf
	Stirgoy
*/

if (isDedicated || !hasInterface) exitWith {};
private["_uiDisp","_time","_timer"];
if (stir_timer_on) exitWith {};

_time = param [0,0,[0]];
if(_time <= 0) exitWith {};
_time = _time * 60;
_stime = time;

disableSerialization;
6 cutRsc ["stir_gui_tmr","PLAIN"];
_uiDisp = uiNamespace getVariable "stir_gui_tmr";
_timer = _uiDisp displayCtrl 1111;


stir_timer_on = true;

while {stir_timer_on} do {

	if(isNull _uiDisp) then {
	6 cutRsc ["stir_gui_tmr","PLAIN"];
	_uiDisp = uiNamespace getVariable "stir_gui_tmr";
	_timer = _uiDisp displayCtrl 1111;
	};

	 if(!(alive player)) exitWith {};
	 if((time - _stime) > (_time * 60)) exitWith { stir_timer_on = false; };

	 if (time - _stime >= _time/4*3) then { _timer ctrlSetTextColor [0.97,0.27,0,1]; };
	 if (time - _stime >= _time) then { _timer ctrlSetTextColor [0.69,0.03,0,1]; };
	 _timer ctrlSetText format["%1",[(time - _stime),"MM:SS.MS"] call BIS_fnc_secondsToString];

	sleep 0.08;
};

6 cutText["","PLAIN"];
