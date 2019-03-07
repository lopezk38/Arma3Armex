class loadoutGUI {
	idd = 5000;
	movingEnabled = false;
	
	class controls {
		class loadoutGUI_Background : terox_RscPicture {
			idc = 1;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			text = "#(argb,8,8,3)color(0.1,0.1,0.1,0.8)";
		};
		
		class loadoutGUI_Name : terox_RscText {
			idc = 2;
			style = terox_ST_CENTER;
			x = 0;
			y = -.0275;
			w = 1;
			h = .15;
			text = "Manage your Loadout";
			sizeEx = .1;
			shadow = 0;
		};
		
		class loadoutGUI_CurrentLoadoutListTitle : terox_RscFrame {
			idc = 3;
			x = .045;
			y = .09;
			w = .409;
			h = .867;
			text = "Current Loadout";
			sizeEx = 0.06;
			shadow = 0;
		};
		
		class loadoutGUI_CurrentLoadoutList : terox_RscListBox {
			idc = 4;
			x = .05;
			y = .15;
			w = .4;
			h = .8;
			colorBackground[] = {0,0,0,0};
			shadow = 0;
		};
		
		class loadoutGUI_CurrentSelectedVehicleTitle : terox_RscFrame {
			idc = 5;
			x = .545;
			y = .09;
			w = .409;
			h = .117;
			text = "Current Vehicle";
			sizeEx = 0.06;
			shadow = 0;
		};
		
		class loadoutGUI_CurrentSelectedVehicle : terox_RscListBox {
			idc = 6;
			x = .55;
			y = .15;
			w = .4;
			h = .05;
			colorBackground[] = {0,0,0,0};
			shadow = 0;
		};
		
		class loadoutGUI_ClearVehicle : terox_RscButton {
			idc = 7;
			x = .545;
			y = .25;
			w = .409;
			h = .1;
			text = "Remove Vehicle";
			colorBackground[] = {0,1,0,.5};
			colorBackgroundActive[] = {0,1,0,.5};
			colorFocused[] = {0,1,0,.5};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			shadow = 0;
			offsetPressedX = .001;
			offsetPressedY = .001;
		};
		
		class loadoutGUI_ClearLoadout : terox_RscButton {
			idc = 8;
			x = .545;
			y = .4;
			w = .409;
			h = .1;
			text = "Clear Loadout";
			colorBackground[] = {0,1,0,.5};
			colorBackgroundActive[] = {0,1,0,.5};
			colorFocused[] = {0,1,0,.5};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			shadow = 0;
			offsetPressedX = .001;
			offsetPressedY = .001;
		};
		
		class loadoutGUI_RemoveLoadoutItem : terox_RscButton {
			idc = 9;
			x = .545;
			y = .55;
			w = .409;
			h = .1;
			text = "Remove Selected Item from Loadout";
			colorBackground[] = {0,1,0,.5};
			colorBackgroundActive[] = {0,1,0,.5};
			colorFocused[] = {0,1,0,.5};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			shadow = 0;
			offsetPressedX = .001;
			offsetPressedY = .001;
		};
		
		class loadoutGUI_SaveLoadout : terox_RscButton {
			idc = 10;
			x = .545;
			y = .7;
			w = .409;
			h = .1;
			text = "Save Current Loadout";
			colorBackground[] = {0,1,0,.5};
			colorBackgroundActive[] = {0,1,0,.5};
			colorFocused[] = {0,1,0,.5};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			shadow = 0;
			offsetPressedX = .001;
			offsetPressedY = .001;
		};
		
		class loadoutGUI_Exit : terox_RscButton {
			idc = 11;
			x = .545;
			y = .85;
			w = .409;
			h = .1;
			text = "Exit";
			colorBackground[] = {1,0,0,.5};
			colorBackgroundActive[] = {1,0,0,.5};
			colorFocused[] = {1,0,0,.5};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			shadow = 0;
			offsetPressedX = .001;
			offsetPressedY = .001;
		};
	};
};















































