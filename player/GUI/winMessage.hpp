#define uiWid (.05 * 3/4)
#define uiHei .05

/*			To center icon:
			x = (.5 - (uiWid / 2));
			y = (.5 - (uiHei / 2));
*/

class winMessage {
	idd = -1;
	duration = 5;
	fadeIn = 0;
	fadeOut = 0;
	movingEnable = 0;
		
	class controls {
		class descBox {
			idc = 1;
			type = 0;
			style = 2;
			x = .3;
			y = .2;
			w = .4;
			h = .09;
			font = "RobotoCondensed";
			sizeEx = 0.08;
			colorBackground[] = {0, 0, 0, .5};
			colorText[] = {1, 1, 1, .9};
			shadow = 2;
			text = "You win!";
			class Attributes {
				align = "center";
			};
		};
	};
};