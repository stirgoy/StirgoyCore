/*
	cfgFunctions.cpp
	Stirgoy
*/


class cfgFunctions
{
	class stirgoyCore
	{
		tag = "stir";
		class f_core
		{
			file = "StirgoyCore\Functions\Core";
			class initCore { postInit = 1;};
			class mapear {};
			class KHC {};
			class sysDate {};
			class getCfgClass {};
			class intToStr {};
		};

		class f_str
		{
			file = "StirgoyCore\Functions\TTST";
			class initStirText {};
			class str_t {};
			class str_img {};
			class str_link {};
			class str_parse {};
		};

		class f_tools
		{
			file = "StirgoyCore\Functions\Tools";
			class timerD {};
			class timerA {};
		};

		class f_lists
		{
			file = "StirgoyCore\Functions\Lists";
			class classList {};
		};

		class f_server
		{
			file = "StirgoyCore\Functions\Server";
			class initServer {};
			class addLog {};
			class createMaster {};
			class updateDB {};
			class cLog {};
		};

	};
};
