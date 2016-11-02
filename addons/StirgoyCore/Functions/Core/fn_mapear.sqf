/*
	fn_mapear.sqf
	Stirgoy
*/

_num = param [0,0,[0]];
_inmin = param [1,0,[0]];
_inmax = param [2,0,[0]];
_outmin = param [3,0,[0]];
_outmax = param [4,0,[0]];

_ret_ = ( _num - _inmin ) * ( _outmax - _outmin ) / ( _inmax - _inmin ) + _outmin;

_ret_