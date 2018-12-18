class redOverlay {
	idd = 2;
	duration = 5.5;
	fadeIn = 1.5;
	fadeOut = 0;
	movingEnable = 0;
	
	class controls {
		class pointer {
			idc = 2;
			type = 0;
			style = 2;
			x = safeZoneXAbs;
			y = safeZoneY;
			w = safeZoneWAbs;
			h = safeZoneH;
			font = "RobotoCondensed";
			sizeEx = 0.1;
			colorBackground[] = {1, 0, 0, 1};
			colorText[] = {0, 0, 0, 1};
			text = "You killed the rabbit. You monster.";
			class Attributes {
				align = "center";
			};
		};
	};
};