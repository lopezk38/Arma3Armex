#define uiWid (.05 * 3/4)
#define uiHei .05

/*			To center icon:
			x = (.5 - (uiWid / 2));
			y = (.5 - (uiHei / 2));
*/

class mapPointer {
	idd = 1;
	duration = 5;
	fadeIn = 0;
	fadeOut = 0;
	movingEnable = 0;
	
	class controls {
		class pointer {
			idc = 1;
			type = 0;
			style = 0x30 + 0x800;
			x = .493;
			y = (.5 - (uiHei));
			w = uiWid;
			h = uiHei;
			font = "RobotoCondensed";
			sizeEx = 0.1;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {0, 0, 0, 1};
			text = A3\ui_f\data\map\markers\military\flag_CA.paa;
			class Attributes {
				align = "left";
			};
		};
	};
};