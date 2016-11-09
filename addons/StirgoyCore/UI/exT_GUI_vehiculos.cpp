/*
	exT_GUI_vehiculos.cpp
	Stirgoy
*/

class exT_GUI_vehiculos
{
	idd = 461530;
	name="exT_GUI_vehiculos";
	movingEnabled = 0;
	enableSimulation = 1;
	//onLoad = "";

	class controlsBackground
	{

		class GUI_back: RscText
		{
			idc = 1000;
			x = 0.0257989 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.948402 * safezoneW;
			h = 0.913 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class GUI_back_2: RscText
		{
			idc = 1006;
			x = 0.332998 * safezoneW + safezoneX;
			y = 0.60117 * safezoneH + safezoneY;
			w = 0.344343 * safezoneW;
			h = 0.32327 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};
		class tit_cmb_vclas: RscText
		{
			idc = 1003;
			text = "Filtro de  VehicleClass"; //--- ToDo: Localize;
			x = 0.337122 * safezoneW + safezoneX;
			y = 0.104116 * safezoneH + safezoneY;
			w = 0.110306 * safezoneW;
			h = 0.0285911 * safezoneH;
		};
		class tit_llst_vclass: RscText
		{
			idc = 1004;
			text = "VehicleClasses encontrados"; //--- ToDo: Localize;
			x = 0.33381 * safezoneW + safezoneX;
			y = 0.613673 * safezoneH + safezoneY;
			w = 0.152577 * safezoneW;
			h = 0.0285911 * safezoneH;
		};
		class tit_ch_a3: RscText
		{
			idc = 1007;
			text = "Agregar vehiculos Arma 3 "; //--- ToDo: Localize;
			x = 0.371141 * safezoneW + safezoneX;
			y = 0.280064 * safezoneH + safezoneY;
			w = 0.152577 * safezoneW;
			h = 0.0285911 * safezoneH;
		};
		class tit_vclas_selec: RscText
		{
			idc = 1005;
			text = "VehicleClasses eliminados"; //--- ToDo: Localize;
			x = 0.515463 * safezoneW + safezoneX;
			y = 0.614366 * safezoneH + safezoneY;
			w = 0.152577 * safezoneW;
			h = 0.0285911 * safezoneH;
		};
		class tit_lista_encontrados: RscText
		{
			idc = 1001;
			text = "Vehiclulos permitidos"; //--- ToDo: Localize;
			x = 0.0392 * safezoneW + safezoneX;
			y = 0.0666 * safezoneH + safezoneY;
			w = 0.289689 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class tit_llista_exportar: RscText
		{
			idc = 1002;
			text = "Vehiclulos a exportar"; //--- ToDo: Localize;
			x = 0.670136 * safezoneW + safezoneX;
			y = 0.0666 * safezoneH + safezoneY;
			w = 0.289689 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class tit_chk_fside: RscText
		{
			idc = 1008;
			text = "Filtrar bandos "; //--- ToDo: Localize;
			x = 0.371141 * safezoneW + safezoneX;
			y = 0.324053 * safezoneH + safezoneY;
			w = 0.152577 * safezoneW;
			h = 0.0285911 * safezoneH;
			tooltip = "Solo se mostraran los bandos civil, independiente, blufor y opfor"; //--- ToDo: Localize;
		};
	};

	class controls
	{
		class lst_encontrados: RscListbox
		{
			idc = 1500;
			onLBSelChanged = "[] call exT_fnc_sText_veh;";
			x = 0.0392002 * safezoneW + safezoneX;
			y = 0.1018 * safezoneH + safezoneY;
			w = 0.2897 * safezoneW;
			h = 0.4906 * safezoneH;
		};
		class lst_exportar: RscListbox
		{
			idc = 1501;
			x = 0.670094 * safezoneW + safezoneX;
			y = 0.101917 * safezoneH + safezoneY;
			w = 0.2897 * safezoneW;
			h = 0.310138 * safezoneH;
		};
		class pic_pic: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.33506 * safezoneW + safezoneX;
			y = 0.412026 * safezoneH + safezoneY;
			w = 0.117523 * safezoneW;
			h = 0.178148 * safezoneH;
		};
		class stxt_info_V: RscStructuredText
		{
			idc = 1100;
			x = 0.0412517 * safezoneW + safezoneX;
			y = 0.6012 * safezoneH + safezoneY;
			w = 0.286607 * safezoneW;
			h = 0.3256 * safezoneH;
		};
		class btn_mover_sel: RscButtonMenu
		{
			idc = 2400;
			onMouseButtonClick = "['AVE'] call exT_fnc_btnHandler_veh;";
			text = "mover a exportar"; //--- ToDo: Localize;
			x = 0.33506 * safezoneW + safezoneX;
			y = 0.203087 * safezoneH + safezoneY;
			w = 0.116492 * safezoneW;
			h = 0.0307905 * safezoneH;
		};
		class cmb_vclass: RscCombo
		{
			idc = 2100;
			x = 0.33506 * safezoneW + safezoneX;
			y = 0.137106 * safezoneH + safezoneY;
			w = 0.11443 * safezoneW;
			h = 0.0285911 * safezoneH;
		};
		class btn_borrar: RscButtonMenu
		{
			idc = 2401;
			onMouseButtonClick = "['QVE'] call exT_fnc_btnHandler_veh;";
			text = "Borrar seleccionado"; //--- ToDo: Localize;
			x = 0.840188 * safezoneW + safezoneX;
			y = 0.423023 * safezoneH + safezoneY;
			w = 0.116492 * safezoneW;
			h = 0.0307905 * safezoneH;
		};
		class lst_vclass_encontrado: RscListbox
		{
			idc = 1502;
			x = 0.332975 * safezoneW + safezoneX;
			y = 0.642974 * safezoneH + safezoneY;
			w = 0.153601 * safezoneW;
			h = 0.184746 * safezoneH;
		};
		class lst_vclass_selec: RscListbox
		{
			idc = 1503;
			x = 0.515463 * safezoneW + safezoneX;
			y = 0.645155 * safezoneH + safezoneY;
			w = 0.153601 * safezoneW;
			h = 0.184746 * safezoneH;
		};
		class btn_anadirVClass: RscButtonMenu
		{
			idc = 2402;
			onMouseButtonClick = "['AVC'] call exT_fnc_btnHandler_veh;";
			text = "Quitar VClass"; //--- ToDo: Localize;
			x = 0.33403 * safezoneW + safezoneX;
			y = 0.8365 * safezoneH + safezoneY;
			w = 0.151546 * safezoneW;
			h = 0.0307905 * safezoneH;
		};
		class btn_quitar_VCass: RscButtonMenu
		{
			idc = 2403;
			onMouseButtonClick = "['QVC'] call exT_fnc_btnHandler_veh;";
			text = "Agregar VClass"; //--- ToDo: Localize;
			x = 0.515463 * safezoneW + safezoneX;
			y = 0.8365 * safezoneH + safezoneY;
			w = 0.152577 * safezoneW;
			h = 0.0307905 * safezoneH;
		};
		/*											no es necesario el GUI se auto-actualiza
		class btn_actualizar: RscButtonMenu
		{
			idc = 2404;
			text = "Agregar cambios"; //--- ToDo: Localize;
			x = 0.42887 * safezoneW + safezoneX;
			y = 0.878288 * safezoneH + safezoneY;
			w = 0.151546 * safezoneW;
			h = 0.0307905 * safezoneH;
		};
		*/
		class chk_a3: RscCheckbox
		{
			idc = 2800;
			onCheckedChanged = "exT_addA3 = !exT_addA3; [] call exT_fnc_filtrarLista_veh;";
			x = 0.343308 * safezoneW + safezoneX;
			y = 0.269066 * safezoneH + safezoneY;
			w = 0.0257714 * safezoneW;
			h = 0.0461863 * safezoneH;
		};

		class chk_sideF: RscCheckbox
		{
			idc = 2801;
			onCheckedChanged = "exT_filtroSide = !exT_filtroSide; [] call exT_fnc_filtrarLista_veh;";
			x = 0.343307 * safezoneW + safezoneX;
			y = 0.317455 * safezoneH + safezoneY;
			w = 0.0257714 * safezoneW;
			h = 0.0461863 * safezoneH;
		};
		class btn_move_all_encontrado: RscButtonMenu
		{
			idc = 2405;
			onMouseButtonClick = "['MTAE'] call exT_fnc_btnHandler_veh;";
			text = "Mover lista"; //--- ToDo: Localize;
			x = 0.336091 * safezoneW + safezoneX;
			y = 0.370238 * safezoneH + safezoneY;
			w = 0.116492 * safezoneW;
			h = 0.0307905 * safezoneH;
		};
		class btn_borrar_selected: RscButtonMenu
		{
			idc = 2406;
			//onMouseButtonClick = "lbClear 1500;";
			onMouseButtonclick = "['QTAE'] call exT_fnc_btnHandler_veh;";
			text = "Borrar todos"; //--- ToDo: Localize;
			x = 0.840188 * safezoneW + safezoneX;
			y = 0.46701 * safezoneH + safezoneY;
			w = 0.116492 * safezoneW;
			h = 0.0307905 * safezoneH;
		};
	};
};
