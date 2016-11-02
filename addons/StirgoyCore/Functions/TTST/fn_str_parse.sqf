/*
	fn_str_parse.sqf
	Stirgoy
*/

private ["_value0"];
_value0 = _this select 0;

switch (typeName (_value0)) do
{
	case "STRING": { parseText _value0 };
	case "ARRAY": {	parseText (_value0 joinString "") };
	default {};
};