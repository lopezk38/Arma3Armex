class dmScoreBoard {
	idd = 5001;
	movingEnable = 0;
		
	class controls {
		class dm_Background : terox_RscPicture {
			idc = 1;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			text = "#(argb,8,8,3)color(0.1,0.1,0.1,0.8)";
		};
		
		class dm_PlayerScores : terox_RscListNBox {
			idc = 2;
			x = .05;
			y = .11;
			w = .9;
			h = .74;
			colorBackground[] = {0,0,0,0};
			shadow = 0;
			columns[] 		= {0,0.672,0.9125};
		};	
		
		class dm_ExitButton : terox_RscButton {
			idc = 3;
			x = .295;
			y = .9;
			w = .409;
			h = .075;
			text = "Close (ESC)";
			colorBackground[] = {0,1,0,.5};
			colorBackgroundActive[] = {0,1,0,.5};
			colorFocused[] = {0,1,0,.5};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			shadow = 0;
			offsetPressedX = .001;
			offsetPressedY = .001;
		};	
		
		class dm_LabelsName : terox_RscText {
			idc = 4;
			x = .059;
			y = .035;
			w = .5;
			h = .1;
			text = "Player";
			shadow = 0;
			class Attributes {
				align = "left";
			};
		}
		
		class dm_LabelsKills : terox_RscText {
			idc = 5;
			x = .65;
			y = .035;
			w = .2;
			h = .1;
			text = "Kills";
			shadow = 0;
			class Attributes {
				align = "left";
			};
		}
		
		class dm_LabelsDeaths : terox_RscText {
			idc = 6;
			x = .85;
			y = .035;
			w = .2;
			h = .1;
			text = "Deaths";
			shadow = 0;
			class Attributes {
				align = "left";
			};
		}
		
		class dm_LabelScoreboard : terox_RscText {
			idc = 7;
			x = 0;
			y = 0.02;
			w = 1;
			h = .05;
			style = 0x02;
			text = "Scoreboard";
			sizeEx = 0.06;
			shadow = 0;
		};
	};
};