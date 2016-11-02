/*
	fn_timerD.sqf
	Stirgoy
*/

if (isDedicated || !hasInterface) exitWith {};
private["_tDisplay","_time","_timer"];
if (stir_timer_on) exitWith {};

_time = param [0,0,[0]];
if(_time <= 0) exitWith {};
_time = _time * 60;

disableSerialization;
6 cutRsc ["stir_gui_tmr","PLAIN"];
_tDisplay = uiNamespace getVariable "stir_gui_tmr";
_timer = _tDisplay displayCtrl 1111;

while {true} do
{
	stir_timer_on = true;
	if(isNull _tDisplay) then
	{
		6 cutRsc ["stir_gui_tmr","PLAIN"];
		_tDisplay = uiNamespace getVariable "stir_gui_tmr";
		_timer = _tDisplay displayCtrl 1111;
	};

	if (time - _time >= _time/4*3) then { _timer ctrlSetTextColor [0.97,0.27,0,1]; };
	if (time - _time >= _time/8*7) then { _timer ctrlSetTextColor [0.69,0.03,0,1]; };

	if(round(_time - time) < 1 || !(alive player)) exitWith {};

	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};

stir_timer_on = false;
6 cutText["","PLAIN"];
