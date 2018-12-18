#define uiWid (.05 * 3/4)
#define uiHei .05

/*			To center icon:
			x = (.5 - (uiWid / 2));
			y = (.5 - (uiHei / 2));
*/

class missionDesc {
	idd = -1;
	duration = 5;
	fadeIn = 0;
	fadeOut = 0;
	movingEnable = 0;
	onLoad = "((_this select 0) displayCtrl 1) ctrlSetText (missionNamespace getVariable 'missionDesc')"; 
		
	class controls {
		class descBox {
			idc = 1;
			type = 0;
			style = 2;
			x = 0;
			y = .8;
			w = 1;
			h = .09;
			font = "RobotoCondensed";
			sizeEx = 0.08;
			colorBackground[] = {0, 0, 0, .5};
			colorText[] = {1, 1, 1, .9};
			shadow = 2;
			text = "No description defined for this mission";
			class Attributes {
				align = "center";
			};
		};
	};
};