/*
	stir_gui_pb.hpp
	Stirgoy
*/

class stir_gui_pb
{
	idd = 77743;
	name="stir_gui_pb";
	duration = 9999999999999;
	fadeIn = 1;
	fadeout = 1;
	movingEnabled = 0;
	onLoad = "uiNamespace setVariable['stir_gui_pb',_this select 0]";
	objects[] = {};

	class controlsBackGround
	{

		class GUI_back: RscText
		{
			idc = -1;
			x = 0.293826 * safezoneW + safezoneX;
			y = 0.423023 * safezoneH + safezoneY;
			w = 0.412349 * safezoneW;
			h = 0.0659802 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
	};

	class controls
	{

		class progress: RscProgress
		{
			idc = 3466;
			colorFrame[] = { 0.2, 0.2, 0.2, 1 };
			colorBackground[] =	{ 0, 0, 0, 0.7 };
			colorBar[] ={0,0,0,1};
			x = 0.29795 * safezoneW + safezoneX;
			y = 0.458219 * safezoneH + safezoneY;
			w = 0.403065 * safezoneW;
			h = 0.0219931 * safezoneH;
		};

		class txt_carga: RscText
		{
			idc = 1001;
			text = "";
			x = 0.490735 * safezoneW + safezoneX;
			y = 0.429621 * safezoneH + safezoneY;
			w = 0.208234 * safezoneW;
			h = 0.0219935 * safezoneH;
		};
	};
};
