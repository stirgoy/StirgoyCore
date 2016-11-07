/*
	fn_classList.sqf
	Stirgoy
*/

private ["_retu","_tmp","_allCfg","_all"];

_retu = [];
_allCfg = "true" configClasses (configFile);
_all = (count _allCfg) -1;

for "_i" from 0 to _all do {
    _tmp = _allCfg select _i;
    _tmp = configName _tmp;
    _retu set [_i,_tmp];
};

_retu
