/*
	stir_gui_tmr.hpp
	Stirgoy
*/

class stir_gui_tmr
{
	idd = 77744;
	name="stir_gui_tmr";
	duration = 9999999999999;
	fadeIn = 1;
	fadeout = 1;
	movingEnabled = 0;
	onLoad = "uiNamespace setVariable['stir_gui_tmr',_this select 0]";
	objects[] = {};

	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 1111;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};