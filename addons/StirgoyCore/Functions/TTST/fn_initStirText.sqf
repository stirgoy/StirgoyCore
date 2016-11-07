/*
	fn_initStirText.sqf
	Stirgoy
	STIR_TTST (21/10/2015)
*/

if !(isNull (missionNamespace getVariable "stirgoy_str_ARR")) exitWith {};
//Preparamos variables para el generador de texto

																// ¬ == </br>
_colorArray = [	//Lista de colores
	"color='#FFFFFF' ",		//Blanco	0
	"color='#000000' ",		//Negro		1
	"color='#808080' ",		//Gris		2
	"color='#22c71f' ",		//Verde		3
	"color='#B22222' ",		//Rojo		4
	"color='#1E90FF' ",		//Azul		5
	"color='#FF8C00' ",		//Naranja	6
	"color='#542800' ",		//Marron	7
	"color='#FF00FF' ",		//Rosa		8
	"color='#FFD700' ",		//Amarillo	9
	"color='#9E1C00' ",		//Rojo 2 	10
	"color='#1D1D1D' "		//Gris Oscuro 11
	];

_fontArray = [	//Lista de fuentes
	"font ='PuristaLight' ",				//0
	"font ='PuristaMedium' ",				//1
	"font ='PuristaSemiBold' ",				//2
	"font ='PuristaBold' ",					//3
	"font ='LucidaConsoleB' ",				//4
	"font ='EtelkaMonospacePro' ",			//5
	"font ='EtelkaMonospaceProBold' ",		//6
	"font ='EtelkaNarrowMediumPro' ",		//7
	"font ='TahomaB' "						//8
];


_dSize = "size='1' ";						//Tamaño de la fuente: Puedes usar decimales: "size='1.3' "
_dColor = _colorArray select 0;				//Color por defecto de la lista
_dFont = _fontArray select 0;				//fuente por defecto de la lista

//													 /////////////////
//													//*"ESTATICAS"*//
//												   /////////////////

_dShadow = "shadow='%1' ";					//Sombra del texto: 0 = sin sombra, 1 = sombra, 2 = relieve
_dAlign = "align='%1' ";					//Alineacion del texto center, left, right
_openT = "<t ";
_openTC = "<t >";
_closeT = "<t/>";
_closeOT = ">";
_closeTic = "/>";
_imag = "<img image='%1' ";
_hlink = "<a %3 href='%1'>%2<a/> ";
_dUnderL = "underline='%1' ";			//Underline bool

//Añadimos la config a la mision
_cArray = [
			_colorArray,	//0 arr
			_fontArray, 	//1 arr
			_openT, 		//2 <t "
			_openTC, 		//3 <t>"
			_closeT, 		//4 <t/>"
			_closeOT, 		//5  >"
			_closeTic,		//6 />"
			_dSize, 		//7 size='1'
			_dColor, 		//8 color='#FFFFF'
			_dFont,			//9 font='tahomab'
			_dAlign,		//10 align='%1'
			_dUnderL,		//11 underline=''
			_dShadow,		//12 shadow='%1'
			_imag,			//13 img
			_hlink			//14 a href


			];

missionNamespace setVariable ["stirgoy_str_ARR",_cArray,true];
